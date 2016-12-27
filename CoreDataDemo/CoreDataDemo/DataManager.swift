//
//  DataManager.swift
//  CoreDataDemo
//
//  Created by 魏星 on 2016/12/26.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataManager:NSObject {
    
    private var managedContext: NSManagedObjectContext!
    
    static let sharedInstance = DataManager()
    
    private override init(){
        let appDelagate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelagate.persistentContainer.viewContext
    }
    
    
    func save(str: String){
        let description = NSEntityDescription.entity(forEntityName: "DataItem", in: managedContext)
        let item = DataItem(entity: description!, insertInto: managedContext)
        item.content = str
        do{
            try managedContext.save()
        }catch{
            print(error)
        }
    }
    
    func getAll() -> [DataItem]?{
        let fetchRequest = NSFetchRequest<DataItem>(entityName: "DataItem")
        do{
            let result = try managedContext.fetch(fetchRequest)
            return result
        }catch{
            print(error)
            return nil
        }
    }
    //删除
    func delete(item: DataItem){
        managedContext.delete(item)
    }
    
}
