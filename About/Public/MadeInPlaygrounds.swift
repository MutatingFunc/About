import SwiftUI
import SwiftUI
import StoreKit

public struct MadeInPlaygrounds: View {
    
    public init() {}
    
    @State private var height: Double = 1
    @State private var showingProductView = false
    @Environment(\.horizontalSizeClass) private var hSize
    
    public var body: some View {
        let view = HStack {
            let iconSize = hSize == .compact ? height : height * 1.5
            LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom)
                .mask {
                    Image(systemName: "swift")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.95, anchor: .topLeading)
                        .scaleEffect(hSize == .compact ? 0.8 : 0.75)
                }
                .frame(width: iconSize, height: iconSize, alignment: .center)
                .background {
                    Image(systemName: "app")
                        .resizable()
                        .scaledToFit()
                        .symbolVariant(.fill)
                        .foregroundColor(.white)
                        .shadow(radius: 2, x: 0, y: 0)
                }
                .imageScale(.large)
            let text = Text(" Made in\n").font(.callout) + Text("Swift Playgrounds").font(hSize == .compact ? .title : .largeTitle)
            text
                .minimumScaleFactor(0.5)
                .lineLimit(2)
                .background {
                    GeometryReader { geometry in
                        Color.clear.onAppear {
                            height = geometry.size.height
                        }
                    }
                }
        }
            .padding(2)
        Button {
            showingProductView = true
        } label: {
            view
        }
        .buttonStyle(.plain)
        .appStoreOverlay(isPresented: $showingProductView) {
            SKOverlay.AppConfiguration(appIdentifier: "908519492", position: .bottomRaised)
        }
    }
}

#Preview("Solo", traits: .sizeThatFitsLayout) {
    MadeInPlaygrounds()
}

#Preview("List") {
    List {
        MadeInPlaygrounds()
            .padding(.vertical)
    }
}
