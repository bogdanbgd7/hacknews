//
//  CustomTextView.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 05/11/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextView: UITextView {
    
    
     var borderColor: UIColor? {
            set {
                layer.borderColor = newValue?.cgColor
            }
            get {
                guard let borderColor = layer.borderColor else {
                    return nil
                }
                return UIColor(cgColor: borderColor)
            }
        }
        
         var borderWidth: CGFloat {
            set {
                layer.borderWidth = newValue
            }
            get {
                return layer.borderWidth
            }
        }

    

}
