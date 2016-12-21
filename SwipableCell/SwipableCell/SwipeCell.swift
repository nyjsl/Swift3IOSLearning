//
//  SwipeCell.swift
//  SwipableCell
//
//  Created by 魏星 on 2016/12/21.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit

struct CellModel {
    let image: String
    let name: String
}

class SwipeCell: UITableViewCell{
    
    var cellModel: CellModel?{
        didSet{
            label.text = cellModel?.name
            img.image = UIImage(named: (cellModel?.image)!)
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
}
