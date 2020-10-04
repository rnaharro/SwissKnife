public extension CGSize {
    static func <(lhs: CGSize, rhs: CGSize) -> Bool {
        return (lhs.width * lhs.height) < (rhs.width * rhs.height)
    }
    
    
    static func >(lhs: CGSize, rhs: CGSize) -> Bool {
        return (lhs.width * lhs.height) > (rhs.width * rhs.height)
    }
    
    static func ==(lhs: CGSize, rhs: CGSize) -> Bool {
        return (lhs.width * lhs.height) == (rhs.width * rhs.height)
    }
}

