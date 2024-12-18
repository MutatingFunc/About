import SwiftUI

public struct IAPProduct: Equatable, Identifiable {
    public var id: String
    public var image: Image
    public init(id: String, image: Image) {
        self.id = id
        self.image = image
    }
    
    internal static let example = IAPProduct(id: "abc", image: Image(systemName: "cup.and.heat.waves"))
}
