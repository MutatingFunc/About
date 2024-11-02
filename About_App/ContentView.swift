import SwiftUI
import About

struct ContentView: View {
    var body: some View {
        Text("").sheet(isPresented: .constant(true)) {
            AboutPage(appName: "About")
        }
    }
}

#Preview {
    ContentView()
}
