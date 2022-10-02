import Foundation

extension String {
    var asURL: URL? {
        URL(string: self)
    }
}
