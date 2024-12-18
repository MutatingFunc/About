import SwiftUI

public struct AboutLink: View {
    var appName: String
    var products: [IAPProduct]
    
    public init(appName: String, products: [IAPProduct] = []) {
        self.appName = appName
        self.products = products
    }
    
    @State private var showAbout = false
    
    public var body: some View {
        Button {
            showAbout.toggle()
        } label: {
            Label("About", systemImage: "list.clipboard")
        }.sheet(isPresented: $showAbout) {
            AboutPage(appName: appName, products: products)
        }
    }
}

#Preview {
    AboutLink(appName: "About", products: [.example])
}
