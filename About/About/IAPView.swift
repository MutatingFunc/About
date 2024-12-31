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
                    .foregroundStyle(Color.accentColor.gradient)
            }
            .padding()
            .background(Color(uiColor: .systemBackground).gradient.secondary)
            .about_thinBorder(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    IAPView(iaps: [.example])
}
