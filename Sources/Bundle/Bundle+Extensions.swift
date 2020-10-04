public extension Bundle {
    
    /// Returns the Display Name
    ///
    /// Example: Atresplayer
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }

    /// Return the current version
    ///
    /// Example: 2.0.3
    var version: String? {
        let version = object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        return version
    }
    
    /// Return the build version
    ///
    /// Example: 687 (based in commit's count)
    var buildVersion: String? {
        let version = object(forInfoDictionaryKey: "CFBundleVersion") as? String
        return version
    }

    /// Returns Aplication ID
    ///
    /// Example: MXWY272D5U.com.antena3.atresplayer
    var applicationID: String? {
        let queryLoad: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "bundleSeedID" as AnyObject,
            kSecAttrService as String: "" as AnyObject,
            kSecReturnAttributes as String: kCFBooleanTrue
        ]
        
        var result : AnyObject?
        var status = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(queryLoad as CFDictionary, UnsafeMutablePointer($0))
        }
        
        if status == errSecItemNotFound {
            status = withUnsafeMutablePointer(to: &result) {
                SecItemAdd(queryLoad as CFDictionary, UnsafeMutablePointer($0))
            }
        }
        
        if status == noErr {
            if let resultDict = result as? [String: Any], let accessGroup = resultDict[kSecAttrAccessGroup as String] as? String {
                return accessGroup
            } else {
                return nil
            }
        } else {
            print("Error getting bundleSeedID to Keychain")
            return nil
        }
    }
    
    /// Return group for the app
    ///
    /// Example: MXWY272D5U
    var groupID: String? {
        if let accessGroup = self.applicationID {
            let components = accessGroup.components(separatedBy: ".")
            return components.first
        }
        
        return nil
    }
}
