//
//  LoginViewController.swift
//  LoginAnimation
//
//  Created by 魏星 on 2016/11/14.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit
class LoginViewController: UIViewController{
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var unTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.loginBtn.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        //导航栏背景色
        self.navigationController?.navigationBar.barTintColor = UIColor.green
        //返回按钮及文字颜色
        self.navigationController?.navigationBar.tintColor = UIColor.white
        //标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]

    }
}
