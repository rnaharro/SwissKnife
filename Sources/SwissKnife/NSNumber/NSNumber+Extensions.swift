import Foundation

public extension NSNumber {
    #if os(tvOS)
    static var menu: NSNumber {
        return NSNumber(pressType: .menu)
    }
    static var playPause: NSNumber {
        return NSNumber(pressType: .playPause)
    }
    static var select: NSNumber {
        return NSNumber(pressType: .select)
    }
    static var upArrow: NSNumber {
        return NSNumber(pressType: .upArrow)
    }
    
    static var downArrow: NSNumber {
        return NSNumber(pressType: .downArrow)
    }
    static var leftArrow: NSNumber {
        return NSNumber(pressType: .leftArrow)
    }
    static var rightArrow: NSNumber {
        return NSNumber(pressType: .rightArrow)
    }
    static var direct: NSNumber {
        return NSNumber(touchType: .direct)
    }
    static var indirect: NSNumber {
        return NSNumber(touchType: .indirect)
    }
    
    // MARK: - Private
    private convenience init(pressType: UIPress.PressType) {
        self.init(integerLiteral: pressType.rawValue)
    }
    private convenience init(touchType: UITouch.TouchType) {
        self.init(integerLiteral: touchType.rawValue)
    }
    #endif
}
