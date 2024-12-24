import SwiftUI
import StoreKit

struct MyAppsView: View {
    var currentApp: MyApp?
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(Array(MyApp.allCases.filter { $0 != currentApp }), id: \.appID) { app in
                    AppIcon(app: app)
                }
                .frame(width: 84)
            }
        }.scrollClipDisabled()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MyAppsView(currentApp: nil)
}
