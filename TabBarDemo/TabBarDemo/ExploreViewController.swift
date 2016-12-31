//
//  ExploreTableViewController.swift
//  TabBarDemo
//
//  Created by 魏星 on 2016/12/28.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var exploreImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        exploreImg.alpha = 0
        exploreImg.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [.curveEaseOut], animations: {
            self.exploreImg.alpha = 1
            self.exploreImg.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        exploreImg.alpha = 0
        exploreImg.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
