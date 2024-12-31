import SwiftUI

public struct AboutPage: View {
    
    var config: AboutPageConfiguration
    public init(_ configuration: AboutPageConfiguration) {
        self.config = configuration
    }
    public init(app: MyApp, features: [IAPProduct] = [], tips: [IAPProduct] = []) {
        self.config = .init(app: app, features: features, tips: tips)
    }
    
    @Environment(\.dismiss) private var dismiss
    @State private var scrollOffsetY: Double = 0
    @State private var isExpanded = true
    @State private var inlineRestore = false
    
    public var body: some View {
        ScrollViewReader { scrollView in
            ScrollView {
                VStack(alignment: .leading) {
                    if !config.features.isEmpty {
                        ViewThatFits(in: .horizontal) {
                            HStack(alignment: .firstTextBaseline) {
                                Text("🔑 Unlock Features")
                                    .lineLimit(1)
                                    .font(.headline)
                                RestorePurchasesButton(iapCount: config.features.count)
                                    .lineLimit(1)
                                    .onAppear { inlineRestore = true }
                                    .onDisappear { inlineRestore = false }
                            }
                            Text("🔑 Unlock Features")
                                .font(.headline)
                        }
                        Text("I work on this app independently. Your support means a lot!")
                            .font(.footnote)
                        if !inlineRestore {
                            RestorePurchasesButton(iapCount: config.features.count)
                        }
                        IAPView(iaps: config.features)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 4)
                        if config.features.reduce(true, { $0 && $1.isKnownUnlocked }) {
                            Text("You unlocked the full app. Thank you so much! 🥰")
                                .font(.footnote.weight(.medium))
                                .padding(.top, 2)
                        }
                        Divider()
                            .padding(.vertical, 4)
                    }
                    Text("✨ My Apps")
                        .font(.headline)
                    Text("If you're enjoying \(config.app.name), you might like my other works too!")
                        .font(.footnote)
                    MyAppsView(currentApp: config.app)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 4)
                    if !config.tips.isEmpty {
                        Divider()
                            .padding(.vertical, 4)
                        Text("💝 Tip Jar")
                            .font(.headline)
                        Text("If you're feeling generous, you can directly support me in bringing you new features regularly!")
                            .font(.footnote)
                        IAPView(iaps: config.tips)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 4)
                    }
                }
                .multilineTextAlignment(.leading)
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
            .productViewStyle(.compact)
        }
    }
    
    @State private var isHoveringBlogLink = false
    
    @ViewBuilder
    func header(expanded: Bool) -> some View {
        VStack(spacing: 0) {
            let dismissButton = Button {
                dismiss()
            } label: {
                Text("Done")
                    .fontWeight(.medium)
                    .padding(8)
                    .hoverEffect(.highlight)
                    .frame(minWidth: 44, minHeight: 44)
            }
            let title = Group {
                Text(config.app.name).font(.largeTitle).bold()
                if expanded {
                    Link(destination: URL(string: "https://mutatingfunc.github.io/")!) {
                        Text("by James \(Image(systemName: "arrow.up.right.square"))")
                            .font(.title3)
                            .opacity(isHoveringBlogLink ? 0.6 : 1)
                            .animation(.default, value: isHoveringBlogLink)
                    }.onHover { isHovering in
                        isHoveringBlogLink = isHovering
                    }
                    .transition(.blurReplace.combined(with: .move(edge: .top)))
                }
            }.lineLimit(nil)
            HStack {
                let iconHeight: Double = expanded ? 76 : 48
                Color.clear
                    .frame(width: iconHeight, height: iconHeight)
                    .overlay {
                        AppIcon(app: config.app, includeName: false)
                            .frame(width: 76, height: 76)
                            .scaleEffect(expanded ? 1 : 0.5)
                    }
                VStack(alignment: .leading) {
                    title
                }.frame(maxWidth: .infinity, alignment: .leading)
                dismissButton
            }
            .multilineTextAlignment(.leading)
            .safeAreaPadding([.top, .horizontal], expanded ? 8 : 4)
            .padding(.bottom, expanded ? 8 : 4)
            
            Divider()
        }
        .background(.background.secondary)
    }
}

#Preview("Large text") {
    Text("").sheet(isPresented: .constant(true)) {
        AboutPage(app: .simpleEdit, features: [.example], tips: [.example, .example, .example])
            .dynamicTypeSize(.xxxLarge)
    }
}

#Preview("Full") {
    Text("").sheet(isPresented: .constant(true)) {
        AboutPage(app: .simpleEdit, features: [.example], tips: [.example, .example, .example])
    }
}

#Preview("Tips") {
    Text("").sheet(isPresented: .constant(true)) {
        AboutPage(app: .simpleEdit, tips: [.example, .example, .example])
    }
}

#Preview("Features") {
    Text("").sheet(isPresented: .constant(true)) {
        AboutPage(app: .simpleEdit, features: [.example])
    }
}

#Preview("Empty") {
    Text("").sheet(isPresented: .constant(true)) {
        AboutPage(app: .simpleEdit)
    }
}
