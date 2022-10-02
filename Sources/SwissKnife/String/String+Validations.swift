import Foundation

extension String {
    
    // MARK: - Public Functions
    // MARK:   Validations
    func isEmpty() -> Bool {
        var ret:Bool = true
        if self != "" {
            ret = false
        }
        return ret
    }
    
    func isValidEmail() -> Bool {
        let strictedFilterString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", strictedFilterString)
        return emailPredicate.evaluate(with: self)
    }
    
    func isValidName() -> Bool {
        let regularExpression = "[ a-zA-Z\\u00C0-\\u017F]+"
        let namePredicate = NSPredicate(format: "SELF MATCHES[c] %@", regularExpression)
        
        return namePredicate.evaluate(with: self)
    }

    func isValidSpanishCode() -> Bool {
        let regularExpression = "^(?=[0-9]{4,5}$)(?=(?!0?1000$))(?=(?:(?:[1-9]|0[1-9]|[1-4][0-9]|5[0-2])(?:[0-9])(?:[0-9]{2}))$).*"
        let postalCodePredicate = NSPredicate(format: "SELF MATCHES[c] %@", regularExpression)
        
        return postalCodePredicate.evaluate(with: self)
    }
    
    func isValidSpanishPhone() -> Bool {
        let phone = cleanString()
        print(phone, terminator: "")
        return phone.lengthOfBytes(using: String.Encoding.utf8) == 9
    }

    func isValidPassword(pattern: String = "[A-Z0-9a-z]{6,25}") -> Bool {
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return passwordPredicate.evaluate(with: self)
    }

    
    // MARK: - Private Functions
    func cleanString() -> String {
        return cleanDots().cleanCommas().cleanWhitespaces().cleanHypen().cleanUnderline().cleanSlash().cleanBackslashes().cleanBars()
    }
}
