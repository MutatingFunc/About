import SwiftUI

public struct AboutPage: View {
    
    var appName: String
    var products: [IAPProduct]
    
    public init(appName: String, products: [IAPProduct] = []) {
        self.appName = appName
        self.products = products
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                Text(appName).font(.largeTitle).bold()
                Text("by James").font(.title3)
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
                Link(destination: URL(string: "https://mutatingfunc.github.io/")!) {
                    Label("My Blog", systemImage: "link")
                        .font(.title2.bold())
                        .padding(8)
                        .padding(.horizontal, 8)
                        .foregroundStyle(.white)
                        .background(Color.accentColor.gradient.tertiary, in: RoundedRectangle(cornerRadius: 16))
                }.hoverEffect(.lift).padding(.bottom)
                MyAppsView()
                if !products.isEmpty {
                    Divider()
                        .padding(.vertical)
                    TipsView(products: products)
                }
            }
            .multilineTextAlignment(.center)
            .safeAreaPadding()
        }.presentationBackground(.background.secondary)
    }
}

#Preview {
    Text("").sheet(isPresented: .constant(true)) {
        AboutPage(appName: "About", products: [.example])
    }
}
