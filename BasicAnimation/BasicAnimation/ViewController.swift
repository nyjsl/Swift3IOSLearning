//
//  ViewController.swift
//  BasicAnimation
//
//  Created by 魏星 on 2016/12/25.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let VC: UIViewController
        switch indexPath.row {
        
        case 0:
            VC = sb.instantiateViewController(withIdentifier: "Position")
            VC.title = "PositionAnimation"
        case 1:
            VC = sb.instantiateViewController(withIdentifier: "Opacity")
            VC.title = "OpacityAnimation"

        case 2:
            VC = sb.instantiateViewController(withIdentifier: "Scale")
            VC.title = "ScaleAnimation"

        case 3:
            VC = sb.instantiateViewController(withIdentifier: "Color")
            VC.title = "ColorAnimation"

        case 4:
            VC = sb.instantiateViewController(withIdentifier: "Rotate")
            VC.title = "RotateAnimation"
 
        default:
            return
        }
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}

