//
//  RevealTableViewController.swift
//  SlideOutMenu
//
//  Created by 魏星 on 2016/12/23.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit

class RevealTableViewController: UITableViewController{
    
    let titles = ["FriendRead","Article","ReadAfter"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.black
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.textLabel?.textColor = UIColor.white
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let frontNav = self.revealViewController().frontViewController as! UINavigationController
        switch indexPath.row {
        case 0:
            let feedVC = sb.instantiateViewController(withIdentifier: "FeedViewController")
//            self.revealViewController().pushFrontViewController(feedVC, animated: true)
            frontNav.setViewControllers([feedVC], animated: true)
           
        case 1:
            let articleVC = sb.instantiateViewController(withIdentifier: "ArticleVC")
            frontNav.setViewControllers([articleVC], animated: true)
        case 2:
            let afterVC = sb.instantiateViewController(withIdentifier: "AfterVC")
            frontNav.setViewControllers([afterVC], animated: true)
       default:
            print("default")
        }
    }
    
    
    
}
