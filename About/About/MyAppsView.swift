import SwiftUI
import StoreKit

struct MyAppsView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(MyApp.allCases, id: \.appID) { app in
                    AppIcon(app: app)
                }
                .frame(width: 84)
            }
        }.scrollClipDisabled()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MyAppsView()
}
