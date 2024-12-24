import SwiftUI
import StoreKit

public enum MyApp: CaseIterable {
    case keybuild
    case medlied
    case shimmer
    case simpleEdit
    
    var name: String {
        switch self {
        case .keybuild: "Keybuild"
        case .medlied: "Medlied"
        case .shimmer: "Shimmer"
        case .simpleEdit: "SimpleEdit"
        }
    }
    
    var appID: String {
        switch self {
        case .keybuild: "1547174534"
        case .medlied: "1606367519"
        case .shimmer: "6739163018"
        case .simpleEdit: "1287562515"
        }
    }
    
    var icon: ImageResource {
        switch self {
        case .keybuild: .keybuild
        case .medlied: .medlied
        case .shimmer: .shimmer
        case .simpleEdit: .simpleEdit
        }
    }
}

#Preview {
    Image(MyApp.keybuild.icon)
}
