import SwiftUI
import StoreKit

struct AppIcon: View {
    var app: MyApp
    
    @State private var showAppStoreOverlay = false
    var body: some View {
        Button {
            showAppStoreOverlay = true
        } label: {
            Icon(app.icon, name: app.name)
        }
        .buttonStyle(.plain)
        .appStoreOverlay(isPresented: $showAppStoreOverlay) {
            SKOverlay.AppConfiguration(appIdentifier: app.appID, position: .bottomRaised)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AppIcon(app: .keybuild)
}
