//
//  FriendTableTableViewController.swift
//  TabBarDemo
//
//  Created by 魏星 on 2016/12/28.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class FriendTableTableViewController: UITableViewController {

    let friendModels: [FriendCellModel] = [
        FriendCellModel(userImg: #imageLiteral(resourceName: "allen"),user: "allen",type: "Read Later",contentImg: #imageLiteral(resourceName: "giphy"),content: "Giphy Cam Lets You Create And Share Homemade Gifs",contentDesc: "TheNextWeb",time: "5min  •  13:20"),
        FriendCellModel(userImg: #imageLiteral(resourceName: "Daniel Hooper"),user: "Daniel Hooper",type: "Shared on Twitter",contentImg: #imageLiteral(resourceName: "my workflow flow"),content: "Principle. The Sketch of Prototyping Tools",contentDesc: "SketchTalk",time: "3min  •  12:57"),
        FriendCellModel(userImg: #imageLiteral(resourceName: "davidbeckham"),user: "David Beckham",type: "Shared on Facebook",contentImg: #imageLiteral(resourceName: "Ohlala"),content: "Ohlala, An Uber For Escorts, Launches Its ‘Paid Dating’ Service In NYC",contentDesc: "TechCrunch",time: "1min  •  12:59"),
        FriendCellModel(userImg: #imageLiteral(resourceName: "bruce"),user: "Bruce Fan",type: "Shared on Weibo",contentImg: #imageLiteral(resourceName: "Lonely Planet"),content: "Lonely Planet’s new mobile app helps you explore major cities like a pro",contentDesc: "36Kr",time: "5min  •  11:21")    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableViewAutoHeight();
               // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    private func setUpTableViewAutoHeight(){
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCellId", for: indexPath) as! FriendTableViewCell
        cell.friendModel = friendModels[indexPath.row]
        
        makeImageViewCircle(img: cell.userImg)
        
        return cell
    }
    /*
     ImageView 圆形
     */
    private func makeImageViewCircle(img :UIImageView){
        img.layer.masksToBounds = true
        img.layer.cornerRadius = img.frame.size.width/2
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
