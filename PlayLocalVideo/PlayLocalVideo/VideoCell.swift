//
//  VideoCell.swift
//  PlayLocalVideo
//
//  Created by 魏星 on 2016/11/6.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit

struct VideoModel {
    let image: String
    let title: String
    let source: String
}


protocol PlayBtnDidClickDelegate {
    func onClick() -> Void
}

class VideoCell: UITableViewCell {
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    var playBtnDidClickDeleage: PlayBtnDidClickDelegate?
    
    @IBOutlet weak var screenShot: UIImageView!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBAction func playBtnClickAction(_ sender: UIButton) {
        playBtnDidClickDeleage?.onClick()
    }
}
