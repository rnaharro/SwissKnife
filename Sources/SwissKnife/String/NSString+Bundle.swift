import Foundation

public extension NSString {
    @objc static func localizableNSStringFromBundle(_ key: NSString, bundleName: NSString) -> NSString {
        return String.localizableStringFromBundle(key as String, bundleName: bundleName as String) as NSString
    }
    
    @objc static func localizableNSStringFromBundle(_ key: String, frameworkBundle: Bundle, bundleName: String) -> NSString {
        return String.localizableStringFromBundle(key, frameworkBundle: frameworkBundle, bundleName: bundleName) as NSString
    }
}
