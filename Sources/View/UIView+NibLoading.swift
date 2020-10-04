import UIKit

public protocol UIViewLoading {}
extension UIView : UIViewLoading {}

public extension UIViewLoading where Self : UIView {

    /// Load View from XIB
    ///
    /// - Returns: view instance
    static func loadFromNib() -> UIView? {
        
        let className: String = "\(self)"
        let nibName = String(describing: className.components(separatedBy: ".").last)
        
        return UIView.loadFromNib(name: nibName, bundleName: nil)
    }
    
    static func loadFromNib(name: String, bundleName: String?) -> UIView? {
        var bundle: Bundle?
        
        if bundleName == nil {
            bundle = Bundle(for: classForCoder())
        } else if bundleName?.lowercased() == "main" {
            bundle = Bundle.main
        } else {
            bundle = Bundle(identifier: bundleName!)
        }
        
        var result:UIView?
        if let elements = bundle?.loadNibNamed(name, owner: nil, options:nil) {
            
            for object in elements {
                if let view = object as? UIView {
                    result = view
                    break
                }
            }
        }
        
        return result
    }
}
