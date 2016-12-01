//
//  NewsTableViewController.swift
//  SlideMenu
//
//  Created by 魏星 on 2016/11/29.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit

class NewsTableViewController: UITableViewController,MenuControllerDismissDelegate{
    
     let menuTransitionManager = MenuTransitionManager()
    
    @IBAction func leftBarButtonAction(_ sender: Any) {
        
        let menuTableViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuTableViewController")
        menuTransitionManager.delegate = self
        menuTableViewController.transitioningDelegate = menuTransitionManager
        self.navigationController?.present(menuTableViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func dismiss() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        
        cell.backgroundColor = UIColor.clear
        
        if indexPath.row == 0 {
            cell.bgImg.image = UIImage(named: "1")
            cell.authorTitle.text = "Love mountain."
            cell.authorDesc.text = "Allen Wang"
            cell.authorImg.image = UIImage(named: "a")
            
        } else if indexPath.row == 1 {
            cell.bgImg.image = UIImage(named: "2")
            cell.authorTitle.text = "New graphic design - LIVE FREE"
            cell.authorDesc.text = "Cole"
            cell.authorImg.image = UIImage(named: "b")
            
        } else if indexPath.row == 2 {
            cell.bgImg.image = UIImage(named: "3")
            cell.authorTitle.text = "Summer sand"
            cell.authorDesc.text = "Daniel Hooper"
            cell.authorImg.image = UIImage(named: "c")
            
        } else {
            cell.bgImg.image = UIImage(named: "4")
            cell.authorTitle.text = "Seeking for signal"
            cell.authorDesc.text = "Noby-Wan Kenobi"
            cell.authorImg.image = UIImage(named: "d")
            
        }
        
        return cell

    }
    
}
