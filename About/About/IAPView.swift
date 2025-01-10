import SwiftUI
import StoreKit

struct IAPView: View {
    var iaps: [IAPProduct]
    
    var body: some View {
        ForEach(iaps) { iap in
            ProductView(id: iap.id) {
                iap.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .accessibilityHidden(true)
                    .foregroundStyle(Color.accentColor.gradient)
            }
            .padding()
        }
        .about_iap()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    IAPView(iaps: [.example])
}
