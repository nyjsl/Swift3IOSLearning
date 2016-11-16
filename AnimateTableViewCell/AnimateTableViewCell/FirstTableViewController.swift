//
//  ViewController.swift
//  AnimateTableViewCell
//
//  Created by 魏星 on 2016/11/15.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    
    
    var tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others" ,"Extra Line 1","Extra Line 2","Extra Line 3","Extra Line 4","Extra Line 5","Extra Line 6","Extra Line 7","Extra Line 8","Extra Line 9","Extra Line 10","Extra Line 11"]

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        tableView.reloadData()
//        animateCells()
    }
    /*
     cell 显示后调用此方法需要先调用reloadData
     */
    private func animateCells(){
        let cells = tableView.visibleCells
        let tableHeight = tableView.bounds.size.height
        print(tableHeight)
        for (i,cell) in cells.enumerated(){
            animateCell(i: i, cell: cell, tableHeight: tableHeight)
        }
    }
    
    private func animateCell(i:Int,cell: UITableViewCell,tableHeight: CGFloat){
        cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        UIView.animate(withDuration: 1.0, delay: 0.05*Double(i), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier") as! FirstTableViewCell
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    func colorforIndex(index: Int) -> UIColor {
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorforIndex(index: indexPath.row)
        let tableHeight = tableView.bounds.size.height
        animateCell(i: indexPath.row, cell: cell, tableHeight: tableHeight)
    }

}
