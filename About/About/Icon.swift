import SwiftUI

struct Icon: View {
    var image: ImageResource
    var name: String?
    init(_ image: ImageResource, name: String? = nil) {
        self.image = image
        self.name = name
    }
    
    @Environment(\.colorScheme) private var colorScheme
    
    var iconCornerRadiusMultiplier: Double {
        if #available(iOS 26, *) {
            2/9
        } else {
            13/50
        }
    }
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Image(image)
                    .resizable()
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
                    .about_thinBorder(RoundedRectangle(cornerRadius: geometry.size.width * iconCornerRadiusMultiplier, style: .continuous))
            }
            .frame(maxWidth: 76, maxHeight: 76)
            .aspectRatio(contentMode: .fit)
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
