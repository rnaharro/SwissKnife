import Foundation

public extension String {

    // MARK:   Cleanings
    
    func cleanDots() -> String {
        let set = CharacterSet(charactersIn: ".")
        let sanitizedString = self.components(separatedBy: set)
        let arrayString = sanitizedString as NSArray
        return arrayString.componentsJoined(by: "")
    }
    
    func cleanCommas() -> String {
        let set = CharacterSet(charactersIn: ",")
        let sanitizedString = self.components(separatedBy: set)
        let arrayString = sanitizedString as NSArray
        return arrayString.componentsJoined(by: "")
    }
    
    func cleanWhitespaces() -> String {
        let set = CharacterSet(charactersIn: " ")
        let sanitizedString = self.components(separatedBy: set)
        let arrayString = sanitizedString as NSArray
        return arrayString.componentsJoined(by: "")
    }
    
    func cleanHypen() -> String {
        let set = CharacterSet(charactersIn: "-")
        let sanitizedString = self.components(separatedBy: set)
        let arrayString = sanitizedString as NSArray
        return arrayString.componentsJoined(by: "")
    }
    
    func cleanUnderline() -> String {
        let set = CharacterSet(charactersIn: "_")
        let sanitizedString = self.components(separatedBy: set)
        let arrayString = sanitizedString as NSArray
        return arrayString.componentsJoined(by: "")
    }
    
    func cleanSlash() -> String {
        let set = CharacterSet(charactersIn: "/")
        let sanitizedString = self.components(separatedBy: set)
        let arrayString = sanitizedString as NSArray
        return arrayString.componentsJoined(by: "")
    }
    
    func cleanBackslashes() -> String {
        let set = CharacterSet(charactersIn: "\\")
        let sanitizedString = self.components(separatedBy: set)
        let arrayString = sanitizedString as NSArray
        return arrayString.componentsJoined(by: "")
    }
    
    func cleanBars() -> String {
        let set = CharacterSet(charactersIn: "|")
        let sanitizedString = self.components(separatedBy: set)
        let arrayString = sanitizedString as NSArray
        return arrayString.componentsJoined(by: "")
    }

}
