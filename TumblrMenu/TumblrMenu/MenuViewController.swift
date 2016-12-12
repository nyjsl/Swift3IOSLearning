//
//  MenuViewController.swift
//  TumblrMenu
//
//  Created by 魏星 on 2016/12/3.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController{
    
    
    
    @IBOutlet weak var textView: UIView!
    
    @IBOutlet weak var photoVIew: UIView!
    
    @IBOutlet weak var quoteView: UIView!
    @IBOutlet weak var linkView: UIView!
    
    @IBOutlet weak var chatView: UIView!
    
    @IBOutlet weak var audioView: UIView!
    
    
    private var menuTransitionManager = MenuTransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
         transitioningDelegate = menuTransitionManager
        neverMindLabel.addGestureRecognizer(tapGestureRecognizer)
        
       
        
    }
    
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.dismissByTap))
        return recognizer
    }()
    
    @objc private func dismissByTap(){
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var neverMindLabel: UILabel!
    
}
