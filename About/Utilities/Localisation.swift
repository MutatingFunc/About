import SwiftUI

extension Text {
    init(_ key: LocalizedStringKey) {
        self.init(key, bundle: .module)
    }
}
