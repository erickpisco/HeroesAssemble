//
//  UIViewExtension.swift
//  HeroesAssemble
//
//  Created by erick pisco on 14/05/19.
//  Copyright © 2019 erick pisco. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func border(width: CGFloat, color:UIColor, radius: CGFloat){
        self.layer.cornerRadius = radius
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}

