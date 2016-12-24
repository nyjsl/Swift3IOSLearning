//
//  ArticleViewController.swift
//  SlideOutMenu
//
//  Created by 魏星 on 2016/12/24.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
