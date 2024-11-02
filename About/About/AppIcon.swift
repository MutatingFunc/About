import SwiftUI
import StoreKit

struct AppIcon: View {
    var app: MyApp
    
    @State private var showAppStoreOverlay = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        Button {
            showAppStoreOverlay = true
        } label: {
            VStack {
                Image(app.icon, bundle: .module)
                    .resizable()
                    .frame(width: 76, height: 76)
                    .background {
                        if colorScheme == .dark {
                            LinearGradient(
                                colors: [
                                    Color(
                                        red: 68/255,
                                        green: 68/255,
                                        blue: 68/255
                                    ),
                                    .black
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }
                    }
                    .compositingGroup()
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .hoverEffect(.lift)
                Text(app.name)
                    .lineLimit(1)
            }
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
