import UIKit

//MARK: - Crop
public extension UIImage {
    @objc func crop(_ frame: CGRect) -> UIImage? {
        let imageCGI = self.cgImage!.cropping(to: frame)
        let image = UIImage(cgImage: imageCGI!, scale: UIScreen.main.scale, orientation: self.imageOrientation)
        
        return image
    }
}

// MARK: - Scale
public extension UIImage {
    @objc func scale(_ size: CGSize) -> UIImage? {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    @objc func scaleProportional(_ size: CGSize) -> UIImage? {
        var newSize:CGSize
        if self.size.width > self.size.height {
            newSize = CGSize(width: ceil(self.size.width / self.size.height) * size.height, height: size.height);
        } else {
            newSize = CGSize(width: size.width, height: ceil(self.size.height / self.size.width) * size.width);
        }
        
        return self.scale(newSize)
    }
    
    @objc func scaleProportionalToHeight(_ size: CGSize) -> UIImage? {
        let newSize = CGSize(width: ceil(self.size.width / self.size.height) * size.height, height: size.height);
        
        return self.scale(newSize)
    }
    
    @objc func drawAtBottomLeftInNewImage(_ size: CGSize) -> UIImage? {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        self.draw(in: CGRect(x: 5, y: size.height - self.size.height, width: self.size.width, height: self.size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    @objc func drawCenterInNewImage(_ size: CGSize) -> UIImage? {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        self.draw(in: CGRect(x: (size.width - self.size.width) / 2, y: (size.height - self.size.height) / 2, width: self.size.width, height: self.size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

//MARK: - Effects
public extension UIImage {
    
}

//MARK: - UIColor
public extension UIImage {
    @objc convenience init(color: UIColor) {
        self.init(color: color, size: CGSize(width: 1, height: 1))
    }
    
    @objc convenience init(color: UIColor, size: CGSize) {
        var rect = CGRect.zero
        rect.size = size
        
        UIGraphicsBeginImageContext(size)
        let path = UIBezierPath(rect: rect)
        color.setFill()
        path.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.init(cgImage: (image?.cgImage)!)
    }
    
    @objc func changeImage(_ color: UIColor) -> UIImage? {
        var rect = CGRect.zero
        rect.size = self.size
        
        var image:UIImage?
        
        UIGraphicsBeginImageContext(rect.size)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.clip(to: rect, mask: self.cgImage!)
            context.setFillColor(color.cgColor)
            context.fill(rect)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        
        return image
    }
    
    @objc func color() -> UIColor {
        let position = CGPoint(x: 0, y: 0)
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(position.y)) + Int(position.x)) * 4
        
        let r = CGFloat(data[pixelInfo])
        let g = CGFloat(data[pixelInfo+1])
        let b = CGFloat(data[pixelInfo+2])
        let a = CGFloat(data[pixelInfo+3])
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    @objc static func gradientImage(firstColor first:UIColor, secondColor second:UIColor) -> UIImage {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.nativeBounds.width, height: 4)
        layer.colors = [first.cgColor, first.cgColor, second.cgColor, second.cgColor]
        layer.locations = [0, 0.1, 0.9, 1]
        layer.startPoint = CGPoint(x: 0, y: 1)
        layer.endPoint = CGPoint(x: 0, y: 1)
        
        UIGraphicsBeginImageContext(layer.frame.size)
        
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
        }
        
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        
        return outputImage!
    }
}

public extension UIImage {
    
    @objc func maskWithColor(_ color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.setBlendMode(.multiply)
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    
    @objc func multiply(_ color:UIColor) -> UIImage? {
        let rect = CGRect(origin: .zero, size: self.size)
        
        //image colored
        let coloredImage = self.maskWithColor(color)
        
        //image multiply
        UIGraphicsBeginImageContextWithOptions(self.size, false, 3)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(UIColor.clear.cgColor)
        context!.fill(rect)
        
        self.draw(in: rect, blendMode: .normal, alpha: 1)
        coloredImage?.draw(in: rect, blendMode: .multiply, alpha: 1)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result
    }
    
}

//MARK: - UIViewRendering
public extension UIImage {
    @objc convenience init(view: UIView) {
        self.init(fromLayer: view.layer)
    }
    
    @objc convenience init(fromLayer layer: CALayer) {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
        }
        
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        self.init(cgImage: (outputImage?.cgImage)!)
    }
}

//MARK: - NSBundle
public extension UIImage {
    @objc static func assetImage(name: String, bundle: Bundle) -> UIImage? {
        
        // Intentamos cargar la imagen desde el bundle incluido
        let bundlePath = bundle.bundlePath
        let imagePath:String = "\(bundlePath)/Assets/\(name).png"
        
        var image = UIImage(contentsOfFile: imagePath)
        
        // If image isn't found in bundle we try to load from main bundle
        if image == nil {
            image = UIImage(named: name)
        }
        
        return image
    }
}
