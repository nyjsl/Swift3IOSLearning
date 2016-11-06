//
//  InterestCollectionViewCell.swift
//  CarouselEffect
//
//  Created by 魏星 on 2016/11/6.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation

import UIKit

struct CellReuseable {
    static let Identifier = "InterestCell"
}

class InterestCollectionViewCell: UICollectionViewCell{
    
    var cellModel: Interests?{
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var interestImageView: UIImageView!
    
    @IBOutlet weak var interestLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
    private func updateUI(){
        interestImageView.image = cellModel?.interestImage
        interestLabel.text = cellModel?.interestDesc
    }
    
}
