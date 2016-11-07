//
//  PullToRefreshTableViewController.swift
//  PullToRefresh
//
//  Created by 魏星 on 2016/11/7.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit

class PullToRefreshTableViewController: UITableViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupTableView()
        refresh()
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Datas.CellIdentifier)
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(PullToRefreshTableViewController.refresh), for: .valueChanged)
        self.refreshControl?.tintColor = UIColor.black
        refresh()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var emojiData = [String]()
    var count = 0
    
    func refresh(){
        let attributes = [NSForegroundColorAttributeName: UIColor.blue]
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())", attributes: attributes)
        self.refreshControl?.beginRefreshing()
        if count%2 == 0 {
            emojiData = Datas.favoriteEmoji
        }else{
            emojiData = Datas.newFavoriteEmoji
        }
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
        count += 1
    }
    
}


extension PullToRefreshTableViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Datas.CellIdentifier)
        cell?.textLabel!.text = self.emojiData[indexPath.row]
        cell?.textLabel!.textAlignment = .center
        cell?.textLabel!.font = UIFont.systemFont(ofSize: 50)
        cell?.backgroundColor = UIColor.clear
        cell?.selectionStyle = .none
        return cell!
    }
    
}
