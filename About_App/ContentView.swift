import SwiftUI
import About

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("")
                .toolbar {
                    AboutLink(app: .simpleEdit, showRestorePurchasesButton: true)
                }
                .sheet(isPresented: .constant(true)) {
                    AboutPage(
                        app: .simpleEdit,
                        showRestorePurchasesButton: true,
                        products: [
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
