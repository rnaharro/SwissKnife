import Foundation

extension URL {
    
    func appending(_ queryItem: String, value: String?) -> URL? {
        return appending([queryItem: value])
    }
    
    func appending(_ params: [String: String?]) -> URL? {
        
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        
        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        
        // Create and append query items
        for (key, value) in params {
            // Create query item
            let queryItem = URLQueryItem(name: key, value: value)
            // Append the new query item in the existing query items array
            queryItems.append(queryItem)
        }
        
        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems
        
        // Returns the url from new url components
        return urlComponents.url
    }
}
