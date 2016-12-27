//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by 魏星 on 2016/12/26.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
   
    @IBAction func addBarButtonItemAction(_ sender: UIBarButtonItem) {
        
        showUIAlertController()
        
    }
    
    private func showUIAlertController(){
        
        let allertController = UIAlertController(title: "Add a New Song", message: "this is test messaeg", preferredStyle: .alert)
        
        let alertActionCancel = UIAlertAction(title: "取消", style: .default, handler: {
            action in
            
        })
        allertController.addAction(alertActionCancel)
        
        let alertActionConfirm = UIAlertAction(title: "确定", style: .default, handler: {
             (_) in
            let textField = allertController.textFields?[0]
            if textField != nil{
                if let content = textField?.text{
                    self.dataManager.save(str:content)
                    self.getAllItems()
                }
            }
           
        })
        allertController.addAction(alertActionConfirm)
        
        allertController.addTextField { (textField) in
            textField.placeholder = "Type your Favourite song Name"
        }
        
        self.present(allertController, animated: true, completion: nil)

        
    }
    
    
    private lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    private var items: [DataItem]?{
        didSet{
            self.tableView.reloadData()
        }
    }
    /**
     获取所有的数据
    **/
    private func getAllItems(){
        items = dataManager.getAll()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllItems()
        
//        dataManager.save(str: "陪安东尼渡过漫长的岁月")
//        
//        print(dataManager.getAll() ?? "none")
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        let item = items?[indexPath.row]
        cell?.textLabel?.text = item?.content
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete", handler:
            {
                (_,_) in
                self.dataManager.delete(item: (self.items?[indexPath.row])!)
                self.getAllItems()
        })
        return [deleteAction]
    }
    
}

