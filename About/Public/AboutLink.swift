import SwiftUI

public struct AboutLink: View {
    var config: AboutPageConfiguration
    public init(_ configuration: AboutPageConfiguration) {
        self.config = configuration
    }
    public init(app: MyApp, features: [IAPProduct] = [], tips: [IAPProduct] = []) {
        self.config = .init(app: app, features: features, tips: tips)
    }
    
    @State private var showAbout = false
    
    public var body: some View {
        Button {
            showAbout.toggle()
        } label: {
            if #available(iOS 26, *) {
                Label("About", systemImage: "info")
            } else {
                Label("About", systemImage: "info.circle")
            }
        }.sheet(isPresented: $showAbout) {
            AboutPage(config)
        }
    }
}

#Preview {
    AboutLink(app: .simpleEdit, tips: [.example])
}
