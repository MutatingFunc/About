import SwiftUI
import About

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("")
                .toolbar {
                    AboutLink(appName: "About")
                }
                .sheet(isPresented: .constant(true)) {
                    AboutPage(appName: "About", productIDs: ["abc", "def", "ghi"])
                }
        }
    }
}

#Preview {
    ContentView()
}
