public extension Dictionary {
    static func ==(lhs: [String: Any], rhs: [String: Any] ) -> Bool {
        return NSDictionary(dictionary: lhs).isEqual(to: rhs)
    }
}
