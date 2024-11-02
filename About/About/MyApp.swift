import SwiftUI
import StoreKit

enum MyApp: CaseIterable {
    case keybuild
    case medlied
    case simpleEdit
    
    var name: String {
        switch self {
        case .keybuild: "Keybuild"
        case .simpleEdit: "SimpleEdit"
        case .medlied: "Medlied"
        }
    }
    
    var appID: String {
        switch self {
        case .keybuild: "1547174534"
        case .simpleEdit: "1287562515"
        case .medlied: "1606367519"
        }
    }
    
    var icon: String {
        switch self {
        case .keybuild: "keybuild"
        case .simpleEdit: "simpleEdit"
        case .medlied: "medlied"
        }
    }
}

#Preview {
    Image(MyApp.keybuild.icon)
}
