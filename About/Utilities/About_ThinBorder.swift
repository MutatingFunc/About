import SwiftUI

extension View {
    func about_thinBorder(_ shape: some InsettableShape) -> some View {
        self
            .clipShape(shape)
            .padding(1)
            .overlay {
                shape
                    .strokeBorder(.separator.secondary, lineWidth: 1)
            }
            .contentShape([.accessibility, .contextMenuPreview, .dragPreview, .hoverEffect], shape)
            .hoverEffect(.lift)
            .padding(-1)
    }
    func about_iap() -> some View {
        self
            .background(Color(uiColor: .systemBackground).gradient.secondary)
            .about_thinBorder(RoundedRectangle(cornerRadius: 16))
    }
}
