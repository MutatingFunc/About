import SwiftUI

public struct IAPProduct: Equatable, Identifiable {
    public var id: String
    public var image: Image
    public var isKnownUnlocked: Bool
    public init(id: String, image: Image, isKnownUnlocked: Bool = false) {
        self.id = id
        self.image = image
        self.isKnownUnlocked = isKnownUnlocked
    }
    
    @MainActor internal static let example = IAPProduct(id: "abc", image: Image(systemName: "cup.and.heat.waves"))
}
