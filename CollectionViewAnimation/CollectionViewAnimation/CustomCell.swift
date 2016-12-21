//
//  CustomCell.swift
//  CollectionViewAnimation
//
//  Created by 魏星 on 2016/12/19.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UICollectionViewCell{
    
    public var cellModel: CustomCellModel?{
        didSet{
            imgView.image = UIImage(named: (cellModel?.imgPath)!)
            textView.isScrollEnabled = false
            backBtn.isHidden = true
        }
        
    }
    
    var backBtnDidTouch: (() -> Void)?
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBAction func backAction(_ sender: UIButton) {
        if let listener = backBtnDidTouch{
            listener()
        }
    }
    
    func handleCellSelected(){
        backBtn.isHidden = false
        self.superview?.bringSubview(toFront: self)
        
    }
  }
