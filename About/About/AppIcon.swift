import SwiftUI
import StoreKit

struct AppIcon: View {
    var app: MyApp
    var includeName: Bool = true
    
    @State private var showAppStoreOverlay = false
    var body: some View {
        Button {
            showAppStoreOverlay = true
        } label: {
            Icon(app.icon, name: includeName ? app.name : nil)
        }
        .buttonStyle(.plain)
        .appStoreOverlay(isPresented: $showAppStoreOverlay) {
            SKOverlay.AppConfiguration(appIdentifier: app.appID, position: .bottomRaised)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AppIcon(app: .simpleEdit)
}
