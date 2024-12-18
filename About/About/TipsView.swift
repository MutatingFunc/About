import SwiftUI
import StoreKit

struct TipsView: View {
    var products: [IAPProduct]
    
    var body: some View {
        ForEach(products) { product in
            ProductView(id: product.id) {
                product.image
                    .resizable()
                    .foregroundStyle(.brown)
            }
                .padding()
                .background(.green.gradient.quaternary, in: RoundedRectangle(cornerRadius: 16))
        }.productViewStyle(.compact)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TipsView(products: [.example])
}
