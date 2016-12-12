//
//  ViewController.swift
//  TumblrMenu
//
//  Created by 魏星 on 2016/12/1.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private lazy var menuViewController:MenuViewController = {
        let menuVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController")
        return menuVC as! MenuViewController
    }()
    
    
    @IBAction func menuAction(_ sender: UIButton) {
        self.navigationController?.present(menuViewController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }


}

