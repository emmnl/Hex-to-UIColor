//
//  Hex color to UIColor
//
//  Created by Emmanuel Vizcarra.
//

import UIKit

extension UIColor {
    
    convenience init?(hex: String) {
        var hex = hex
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }
        
        guard hex.count == 6 else {
            return nil
        }
        
        var value: UInt32 = 0
        Scanner(string: hex).scanHexInt32(&value)
        
        self.init(red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(value & 0x0000FF) / 255.0,
                  alpha: 1.0)
    }
}
