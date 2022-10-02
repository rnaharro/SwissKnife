
import UIKit

public protocol UITableViewCellLoading {}
extension UITableViewCell : UITableViewCellLoading {}

extension UITableViewCellLoading where Self : UITableViewCell {
    
    /// Load View from XIB
    ///
    /// - Returns: view instance
    static func loadFromNib() -> UITableViewCell? {
        
        let className: String = "\(self)"
        let nibName = String(describing: className.components(separatedBy: ".").last)
        
        return UITableViewCell.loadFromNib(name: nibName, bundleName: nil) as? UITableViewCell
    }
    
    static func loadFromNib(name: String, bundleName: String?) -> UIView? {
        var bundle: Bundle?
        
        if bundleName == nil {
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
