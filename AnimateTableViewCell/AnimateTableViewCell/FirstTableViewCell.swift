//
//  File.swift
//  AnimateTableViewCell
//
//  Created by 魏星 on 2016/11/16.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation

import UIKit

class FirstTableViewCell: UITableViewCell{
    
    
    private lazy var gradientLayer: CAGradientLayer = {
        let layer: CAGradientLayer = CAGradientLayer()
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor
        let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor
        let color3 = UIColor.clear.cgColor
        let color4 = UIColor(white: 0.0, alpha: 0.05).cgColor
        layer.colors =  [color1,color2,color3,color4]
        layer.locations = [0.0, 0.04, 0.95, 1.0]
        return layer
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
