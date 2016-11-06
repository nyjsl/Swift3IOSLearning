//
//  Interests.swift
//  CarouselEffect
//
//  Created by 魏星 on 2016/11/6.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit
struct Interests {
    
    var interestDesc: String
    
    var interestImage: UIImage
    
    static func buildInterests() -> [Interests]{
        return [
            Interests(interestDesc: "Hello there, i miss u.", interestImage: #imageLiteral(resourceName: "hello")),
            Interests(interestDesc: "We love romantic stories.", interestImage: #imageLiteral(resourceName: "dudu")),
            Interests(interestDesc: "Training like this, #bodyline", interestImage: #imageLiteral(resourceName: "bodyline")),
            Interests(interestDesc: "I'm hungry, indeed.", interestImage: #imageLiteral(resourceName: "wave")),
            Interests(interestDesc: "eet life with full presence.", interestImage: #imageLiteral(resourceName: "darkvarder")),
            Interests(interestDesc: "We love romantic stories.", interestImage: #imageLiteral(resourceName: "dudu")),
            Interests(interestDesc: "I have no idea, bitch", interestImage: #imageLiteral(resourceName: "hhhhh"))
        ]
    }
    
}
