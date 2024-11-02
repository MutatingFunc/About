import SwiftUI

public struct AboutPage: View {
    
    var appName: String
    var productIDs: [String]
    
    public init(appName: String, productIDs: [String] = []) {
        self.appName = appName
        self.productIDs = productIDs
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                Text(appName).font(.largeTitle).bold()
                Text("by James").font(.title3)
                Divider()
                    .padding(.bottom)
                let tipText = if productIDs.isEmpty {
                    ""
                } else {
                    " or leave a tip"
                }
                Text("Hi, I work on this app independently. If you'd like to support me, check out my other apps\(tipText)!")
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .padding(.vertical)
                MyAppsView()
                if !productIDs.isEmpty {
                    Divider()
                        .padding(.vertical)
                    TipsView(productIDs: productIDs)
                }
            }
            .multilineTextAlignment(.center)
            .safeAreaPadding()
        }.presentationBackground(.background.secondary)
    }
}

#Preview {
    Text("").sheet(isPresented: .constant(true)) {
        AboutPage(appName: "About", productIDs: ["abc"])
    }
}
