public extension Array where Element: Hashable {
    var asBag: [Element: Int] {
        return reduce(into: [:]) {
            $0.updateValue(($0[$1] ?? 0) + 1, forKey: $1)
        }
    }
    
    func containSameElements(_ array: [Element]) -> Bool {
        let selfAsBag = asBag
        let arrayAsBag = array.asBag
        return selfAsBag.count == arrayAsBag.count && selfAsBag.allSatisfy {
            arrayAsBag[$0.key] == $0.value
        }
    }
}

public extension Array where Element: Equatable {
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = firstIndex(of: object) {
            remove(at: index)
        }
    }
}
