//
//  ViewController.swift
//  CustomPullRefresh
//
//  Created by 魏星 on 2016/12/14.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dataArray: Array<String> = ["😂", "🤗", "😳", "😌", "😊"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CellOneLable
        cell.idLabel.text = dataArray[indexPath.row]
        return cell
    }
    

}

