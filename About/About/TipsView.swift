import SwiftUI
import StoreKit

struct TipsView: View {
    var productIDs: [String]
    
    var body: some View {
        ForEach(productIDs, id: \.self) { productID in
            ProductView(id: productID) {
                Image(systemName: "cup.and.heat.waves")
            }
                .padding()
                .background(.green.tertiary, in: RoundedRectangle(cornerRadius: 16))
        }.productViewStyle(.compact)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TipsView(productIDs: [])
}
