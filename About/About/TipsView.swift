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
                Group {
                    if isRestoring {
                        ProgressView()
                            .accessibilityLabel("Restoring purchases…")
                    } else {
                        Text("Restore purchases")
                            .fontWeight(.medium)
                    }
                }
                .padding(8)
                .padding(.horizontal, 4)
                .hoverEffect(.highlight)
            }
            .disabled(isRestoring)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        ForEach(products) { product in
            ProductView(id: product.id) {
                product.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color.accentColor.gradient)
            }
            .padding()
            .background(Color(uiColor: .systemBackground).gradient.secondary)
            .about_thinBorder(RoundedRectangle(cornerRadius: 16))
        }.productViewStyle(.compact)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TipsView(showRestorePurchasesButton: true, products: [.example])
}
