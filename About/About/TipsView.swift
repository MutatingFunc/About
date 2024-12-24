import SwiftUI
import StoreKit

struct TipsView: View {
    var showRestorePurchasesButton: Bool
    var products: [IAPProduct]
    
    @State private var isRestoring = false
    
    var body: some View {
        if showRestorePurchasesButton {
            Button {
                Task {
                    isRestoring = true
                    try? await AppStore.sync()
                    isRestoring = false
                }
            } label: {
                if isRestoring {
                    ProgressView()
                        .accessibilityLabel("Restoring purchases…")
                } else {
                    Text("Restore purchases")
                        .bold()
                }
            }.disabled(isRestoring)
        }
        ForEach(products) { product in
            ProductView(id: product.id) {
                product.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color.accentColor.gradient)
            }
                .padding()
                .background(Color(uiColor: .systemBackground).gradient.secondary, in: RoundedRectangle(cornerRadius: 16))
        }.productViewStyle(.compact)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TipsView(showRestorePurchasesButton: true, products: [.example])
}
