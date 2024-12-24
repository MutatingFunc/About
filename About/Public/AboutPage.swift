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
    
    public var body: some View {
        ScrollView {
            VStack {
                let dismissButton = Button {
                    dismiss()
                } label: {
                    Text("Done")
                        .fontWeight(.medium)
                }
                let title = Group {
                    Text(app.name).font(.largeTitle).bold()
                    Text("by James").font(.title3)
                }.lineLimit(nil)
                HStack {
                    AppIcon(app: app, includeName: false)
                    VStack(alignment: .leading) {
                        title
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    dismissButton
                }
                .multilineTextAlignment(.leading)
                
                Divider()
                    .padding(.bottom)
                let tipText = if products.isEmpty {
                    ""
                } else {
                    " or leave a tip"
                }
                Text("I work on this app independently! If you'd like to support me, check out my other projects\(tipText)!")
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .padding(.vertical)
                MyAppsView(currentApp: app).padding(.bottom)
                Link(destination: URL(string: "https://mutatingfunc.github.io/")!) {
                    Label("MutatingFunc Blog", systemImage: "link")
                        .font(.title2.weight(.medium))
                        .fontDesign(.none)
                        .padding(8)
                        .padding(.horizontal, 8)
                        .foregroundStyle(.foreground)
                        .background(Color(uiColor: .systemBackground).gradient.secondary, in: RoundedRectangle(cornerRadius: 16))
                }.hoverEffect(.lift)
                if !products.isEmpty {
                    Divider()
                        .padding(.vertical)
                    TipsView(showRestorePurchasesButton: showRestorePurchasesButton, products: products)
                }
            }
            .multilineTextAlignment(.center)
            .safeAreaPadding()
        }.presentationBackground(.background.secondary)
    }
}

#Preview {
    Text("").sheet(isPresented: .constant(true)) {
        AboutPage(app: .simpleEdit, showRestorePurchasesButton: true, products: [.example])
    }
}
