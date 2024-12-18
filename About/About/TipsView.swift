import SwiftUI
import StoreKit

struct TipsView: View {
    var products: [IAPProduct]
    
    var body: some View {
        ForEach(products) { product in
            ProductView(id: product.id) {
                product.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.tint)
            }
                .padding()
                .background(LinearGradient(colors: [.white.opacity(0.25), .white.opacity(0)], startPoint: .top, endPoint: .bottom), in: RoundedRectangle(cornerRadius: 16))
                .background(.tint.quaternary, in: RoundedRectangle(cornerRadius: 16))
        }.productViewStyle(.compact)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TipsView(products: [.example])
}
