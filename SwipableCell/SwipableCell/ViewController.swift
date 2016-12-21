//
//  ViewController.swift
//  SwipableCell
//
//  Created by 魏星 on 2016/12/21.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //auto resize cell height
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
      
    }
    
    var data = [
        CellModel(image: "1", name: "Pattern Building"),
        CellModel(image: "2", name: "Joe Beez"),
        CellModel(image: "3", name: "Car It's car"),
        CellModel(image: "4", name: "Floral Kaleidoscopic"),
        CellModel(image: "5", name: "Sprinkle Pattern"),
        CellModel(image: "6", name: "Palitos de queso"),
        CellModel(image: "7", name: "Ready to Go? Pattern"),
        CellModel(image: "8", name: "Sets Seamless"),
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId") as! SwipeCell
        cell.cellModel = data[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .normal, title: "🗑\nDelete", handler: {
            action,index in
            print("delete tapped")
        })
        
        deleteAction.backgroundColor = UIColor.red
        
        let shareAction = UITableViewRowAction(style: .normal, title: "🤗\nShare", handler: {
            (action,index) -> Void in
             let fisrtActivityItem = self.data[indexPath.row]
             let actiivtyViewControlelr = UIActivityViewController(activityItems: [fisrtActivityItem.image], applicationActivities: nil)
            self.present(actiivtyViewControlelr, animated: true, completion: nil)
            })
        shareAction.backgroundColor = UIColor.brown
        
        let downLoadAction = UITableViewRowAction(style: .normal, title: "⬇️\nDownload", handler: {
            (action,index) in
            print("downLoad tapped")
        })
        
        return [deleteAction,shareAction,downLoadAction]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}

