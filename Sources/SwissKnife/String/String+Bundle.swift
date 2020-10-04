import Foundation

public extension String {
    static func localizableStringFromBundle(_ key: String, bundle: Bundle) -> String {
        let string = bundle.localizedString(forKey: key, value: "", table: nil)
        
        return string
    }
    
    static func localizableStringFromBundle(_ key: String, bundleName: String) -> String {
        let bundle = Bundle(identifier: bundleName)!
        
        return String.localizableStringFromBundle(key, frameworkBundle: bundle, bundleName: bundleName)
    }
    
    static func localizableStringFromBundle(_ key: String, frameworkBundle: Bundle, bundleName: String) -> String {
        var string = key
        if let bundlePath = frameworkBundle.path(forResource: (bundleName as NSString).deletingPathExtension, ofType: (bundleName as NSString).pathExtension) {
            let libraryBundle = Bundle(path: bundlePath)
            string = libraryBundle!.localizedString(forKey: key, value: "", table: nil)
        }
        
        return string
    }
}
