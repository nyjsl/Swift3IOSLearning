//
//  MovieDetailsViewController.swift
//  SpotLightSearch
//
//  Created by 魏星 on 2016/12/31.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!

    @IBOutlet weak var starImg: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var directorLabel: UILabel!
    
    @IBOutlet weak var actorLabel: UILabel!
    
    var movieModel: MovieDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let model = movieModel{
            self.titleLabel.text = model.Title
            self.typeLabel.text = model.Category
            self.ratingLabel.text = model.Rating
            self.starImg.image = UIImage(named: model.Image!)
            self.descLabel.text = model.Description
            self.directorLabel.text = model.Director
            self.actorLabel.text = model.Stars
            self.ratingLabel.layer.cornerRadius = self.ratingLabel.bounds.size.width/2
            self.ratingLabel.layer.masksToBounds = true
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
