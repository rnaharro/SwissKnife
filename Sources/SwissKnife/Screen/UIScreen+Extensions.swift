import UIKit
public extension UIScreen
{
    @objc class func displaySize() -> CGSize {
        let mainScreenBoundsSize = UIScreen.main.bounds.size
        return mainScreenBoundsSize
    }

    @objc class func statusBarSize() -> CGSize {
        return UIApplication.shared.statusBarFrame.size
    }
    
    @objc class func isIpadInLandscapeAndFullWidthMode(_ width: Float) -> Bool {
        let mainScreenBounds = UIScreen.main.bounds
        
        let isIpad = UI_USER_INTERFACE_IDIOM() == .pad
        let isLandscape = mainScreenBounds.width > mainScreenBounds.height
        let isFullWidthMode = mainScreenBounds.width == CGFloat(width)
        
        return isIpad && isLandscape && isFullWidthMode
    }
}
