//
//  RoundButton.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 27/10/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundButton: UIButton {
    
//    override init(frame: CGRect){
//        super.init(frame: frame)
//    }

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }
    
    fileprivate func sharedInit(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = cornerRadius
      }

      override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        sharedInit()
      }

    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
   
}
