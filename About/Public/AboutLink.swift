import SwiftUI

public struct AboutLink: View {
    var app: MyApp
    var showRestorePurchasesButton: Bool
    var products: [IAPProduct]
    
    public init(app: MyApp, showRestorePurchasesButton: Bool, products: [IAPProduct] = []) {
        self.app = app
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
            AboutPage(app: app, showRestorePurchasesButton: showRestorePurchasesButton, products: products)
        }
    }
}

#Preview {
    AboutLink(app: .simpleEdit, showRestorePurchasesButton: true, products: [.example])
}
