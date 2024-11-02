import SwiftUI
import StoreKit

struct TipsView: View {
    var productIDs: [String]
    
    var body: some View {
        StoreView(ids: productIDs)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TipsView(productIDs: [])
}
