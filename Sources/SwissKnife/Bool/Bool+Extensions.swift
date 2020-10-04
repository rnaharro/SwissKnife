public extension Bool {
    
    init<T: BinaryInteger>(_ num: T) {
        if num == 0 {
            self.init(false)
        } else {
            self.init(true)
        }
    }
}

