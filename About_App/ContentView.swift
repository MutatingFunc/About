import SwiftUI
import About

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello world!")
                .toolbar {
                    AboutLink(app: .simpleEdit)
                }
                .sheet(isPresented: .constant(true)) {
                    AboutPage(
                        app: .simpleEdit,
                        features: [
                            IAPProduct(id: "123", image: Image(systemName: "cup.and.heat.waves"))
                        ],
                        tips: [
                            IAPProduct(id: "abc", image: Image(systemName: "cup.and.heat.waves")),
                            IAPProduct(id: "def", image: Image(systemName: "cup.and.heat.waves")),
                            IAPProduct(id: "ghi", image: Image(systemName: "cup.and.heat.waves")),
                        ]
                    )
                }
        }
    }
}

#Preview {
    ContentView()
}
