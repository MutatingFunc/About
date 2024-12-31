

public struct AboutPageConfiguration {
    /// The app the About page is hosted in.
    public var app: MyApp
    /// One-time unlocks
    public var features: [IAPProduct]
    /// Repeatable tip purchases
    public var tips: [IAPProduct]
    public init(app: MyApp, features: [IAPProduct] = [], tips: [IAPProduct] = []) {
        self.app = app
        self.features = features
        self.tips = tips
    }
}
