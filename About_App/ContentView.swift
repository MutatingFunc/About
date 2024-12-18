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
                    AboutPage(appName: "About", products: [
                        IAPProduct(id: "abc", image: Image(systemName: "cup.and.heat.waves")),
                        IAPProduct(id: "def", image: Image(systemName: "cup.and.heat.waves")),
                        IAPProduct(id: "ghi", image: Image(systemName: "cup.and.heat.waves")),
                    ])
                }
        }
    }
}

#Preview {
    ContentView()
}
