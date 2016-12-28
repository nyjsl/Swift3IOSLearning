//
//  FriendTableViewCell.swift
//  TabBarDemo
//
//  Created by 魏星 on 2016/12/28.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

struct FriendCellModel {
    let userImg: UIImage
    let user: String
    let type: String
    let contentImg:UIImage
    let content: String
    let contentDesc: String
    let time: String
}

class FriendTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userImg: UIImageView!
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var contentImg: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var contentDescLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var friendModel: FriendCellModel?{
        didSet{
            if let model = friendModel{
                userImg.image = model.userImg
                userLabel.text = model.user
                typeLabel.text = model.type
                contentImg.image = model.contentImg
                contentLabel.text = model.content
                contentDescLabel.text = model.contentDesc
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
