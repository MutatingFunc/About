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
}
