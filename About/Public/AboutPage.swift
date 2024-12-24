import SwiftUI

public struct AboutPage: View {
    
    var app: MyApp
    var showRestorePurchasesButton: Bool
    var products: [IAPProduct]
    
    public init(app: MyApp, showRestorePurchasesButton: Bool, products: [IAPProduct] = []) {
        self.app = app
        self.showRestorePurchasesButton = showRestorePurchasesButton
        self.products = products
    }
    
    @Environment(\.dismiss) private var dismiss
    @State private var scrollOffsetY: Double = 0
    @State private var isExpanded = true
    
    public var body: some View {
        ScrollViewReader { scrollView in
            ScrollView {
                VStack {
                    let tipText = if products.isEmpty {
                        ""
                    } else {
                        " or leave a tip"
                    }
                    Text("I work on this app independently! If you'd like to support me, check out my other projects\(tipText)!")
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                        .padding(.bottom)
                    MyAppsView(currentApp: app)
                        .padding(.bottom)
                    Link(destination: URL(string: "https://mutatingfunc.github.io/")!) {
                        Label("MutatingFunc Blog", systemImage: "link")
                            .font(.title2.weight(.medium))
                            .fontDesign(.none)
                            .padding(8)
                            .padding(.horizontal, 8)
                            .foregroundStyle(.foreground)
                            .background(Color(uiColor: .systemBackground).gradient.secondary)
                    }
                    .about_thinBorder(RoundedRectangle(cornerRadius: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                    if !products.isEmpty {
                        Divider()
                        TipsView(showRestorePurchasesButton: showRestorePurchasesButton, products: products)
                    }
                }
                .multilineTextAlignment(.center)
                .safeAreaPadding()
                .background {
                    GeometryReader { geometry in
                        Color.clear.onChange(of: -geometry.frame(in: .scrollView(axis: .vertical)).minY, initial: true) { oldValue, newValue in
                            let new = if newValue > oldValue {
                                newValue < 16
                            } else {
                                newValue < 24
                            }
                            if new != self.isExpanded {
                                self.isExpanded = new
                            }
                        }
                    }
                }
                .presentationBackground(.background.secondary)
            }
            .safeAreaInset(edge: .top, spacing: 0) {
                header(expanded: true).hidden()
            }
            .overlay(alignment: .top) {
                header(expanded: isExpanded)
                    .animation(.default.speed(2), value: isExpanded)
            }
        }
    }
    
    @ViewBuilder
    func header(expanded: Bool) -> some View {
        VStack {
            let dismissButton = Button {
                dismiss()
            } label: {
                Text("Done")
                    .fontWeight(.medium)
                    .padding(4)
                    .padding(.horizontal, 4)
                    .hoverEffect(.highlight)
                    .frame(minWidth: 44, minHeight: 44)
            }
            let title = Group {
                Text(app.name).font(.largeTitle).bold()
                if expanded {
                    Text("by James").font(.title3)
                        .transition(.blurReplace.combined(with: .move(edge: .top)))
                }
            }.lineLimit(nil)
            HStack {
                let iconHeight: Double = expanded ? 76 : 48
                Color.clear
                    .frame(width: iconHeight, height: iconHeight)
                    .overlay {
                        AppIcon(app: app, includeName: false)
                            .frame(width: 76, height: 76)
                            .scaleEffect(expanded ? 1 : 0.5)
                    }
                VStack(alignment: .leading) {
                    title
                }.frame(maxWidth: .infinity, alignment: .leading)
                dismissButton
            }
            .multilineTextAlignment(.leading)
            .safeAreaPadding([.top, .horizontal])
            .padding(.bottom, 4)
            
            Divider()
        }
        .background(.background.secondary)
    }
}

#Preview {
    Text("").sheet(isPresented: .constant(true)) {
        AboutPage(app: .simpleEdit, showRestorePurchasesButton: true, products: [.example])
    }
}
