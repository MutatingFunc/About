import SwiftUI

struct Icon: View {
    var image: ImageResource
    var name: String?
    init(_ image: ImageResource, name: String? = nil) {
        self.image = image
        self.name = name
    }
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 76, height: 76)
                .background {
                    if colorScheme == .dark {
                        LinearGradient(
                            colors: [
                                Color(
                                    red: 68/255,
                                    green: 68/255,
                                    blue: 68/255
                                ),
                                .black
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    }
                }
                .compositingGroup()
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .hoverEffect(.lift)
            if let name {
                Text(name)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Icon(.keybuild, name: "Keybuild")
}
