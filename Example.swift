// It is not possbile to init an instance of class that subclasses `Superclass`
// Explanation: https://blog.eidinger.info/subclassing-an-open-swift-class-is-not-always-possibl

open class Superclass {
    internal init(param1 _: String, param2 _: String) {}

    public convenience init(params _: [String]) {
        self.init(param1: "", param2: "")
    }
}
