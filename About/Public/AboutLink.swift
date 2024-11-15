import SwiftUI

public struct AboutLink: View {
    var appName: String
    var productIDs: [String] = []
    
    public init(appName: String, productIDs: [String] = []) {
        self.appName = appName
        self.productIDs = productIDs
    }
    
    @State private var showAbout = false
    
    public var body: some View {
        Button {
            showAbout.toggle()
        } label: {
            Label("About", systemImage: "list.clipboard")
        }.sheet(isPresented: $showAbout) {
            AboutPage(appName: appName, productIDs: productIDs)
        }
    }
}

#Preview {
    AboutLink(appName: "About", productIDs: ["abc"])
}
