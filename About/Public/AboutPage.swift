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
                Text("I work on this app independently! If you'd like to support me, check out my other projects\(tipText)!")
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .padding(.vertical)
                Link(destination: URL(string: "https://mutatingfunc.github.io/")!) {
                    Label("My Blog", systemImage: "link")
                        .font(.title2.bold())
                        .padding(8)
                        .padding(.horizontal, 8)
                        .foregroundStyle(.white)
                        .background(.brown.gradient, in: RoundedRectangle(cornerRadius: 8))
                }.hoverEffect(.lift).padding(.bottom)
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
