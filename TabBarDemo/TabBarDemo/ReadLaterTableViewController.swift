//
//  ReadLaterTableViewController.swift
//  TabBarDemo
//
//  Created by 魏星 on 2016/12/28.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ReadLaterTableViewController: UIViewController {

    @IBOutlet weak var readLaterImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.readLaterImg.alpha = 0
        self.readLaterImg.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: [.curveEaseIn], animations: {
            self.readLaterImg.alpha = 1
            self.readLaterImg.transform = CGAffineTransform(scaleX: 1,y: 1)
        }, completion: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.readLaterImg.alpha = 0
        self.readLaterImg.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
