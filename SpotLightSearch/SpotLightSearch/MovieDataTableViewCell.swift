//
//  MovieDataTableViewCell.swift
//  SpotLightSearch
//
//  Created by 魏星 on 2016/12/31.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit



struct MovieDataModel {
    let Category: String?
    let Description: String?
    let Director: String?
    let Image: String?
    let Rating: String?
    let Stars: String?
    let Title: String?
    
    static let CELL_ID = "MovieCellIdenntifier"
}

class MovieDataTableViewCell: UITableViewCell {
    
    var movieModel: MovieDataModel?{
        didSet{
            if let model = movieModel{
                self.img.image = UIImage(named: model.Image!)
                self.Description.text = model.Description
                self.title.text = model.Title
                self.rating.text = model.Rating
            }
        }
    }
    
    
    @IBOutlet weak var img: UIImageView!

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
