import SwiftUI

public struct AboutLink: View {
    var appName: String
    var showRestorePurchasesButton: Bool
    var products: [IAPProduct]
    
    public init(appName: String, showRestorePurchasesButton: Bool, products: [IAPProduct] = []) {
        self.appName = appName
        self.showRestorePurchasesButton = showRestorePurchasesButton
        self.products = products
    }
    
    @State private var showAbout = false
    
    public var body: some View {
        Button {
            showAbout.toggle()
        } label: {
            Label("About", systemImage: "info.circle")
        }.sheet(isPresented: $showAbout) {
            AboutPage(appName: appName, showRestorePurchasesButton: showRestorePurchasesButton, products: products)
        }
    }
}

#Preview {
    AboutLink(appName: "About", showRestorePurchasesButton: true, products: [.example])
}
