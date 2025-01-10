import SwiftUI
import StoreKit

struct RestorePurchasesButton: View {
    var iapCount: Int
    
    @State private var isRestoring = false
    
    var body: some View {
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
                        .accessibilityLabel("Restoring purchase(s)")
                } else {
                    Text("Restore purchase(s)")
                        .font(.caption)
                }
            }
            .padding(4)
            .padding(.horizontal, 2)
            .hoverEffect(.highlight)
        }
        .disabled(isRestoring)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    RestorePurchasesButton(iapCount: 1)
}
#Preview {
    RestorePurchasesButton(iapCount: 2)
}
