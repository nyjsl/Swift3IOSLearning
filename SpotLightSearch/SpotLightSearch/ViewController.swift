//
//  ViewController.swift
//  SpotLightSearch
//
//  Created by 魏星 on 2016/12/31.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

import CoreSpotlight
import MobileCoreServices

class ViewController: UITableViewController {
    
    private var movieModels:[MovieDataModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dataPath = Bundle.main.path(forResource: "MoviesData", ofType: ".plist")
        let movieData = NSMutableArray(contentsOfFile: dataPath!)
        movieData?.forEach({ (data) in
            let data = data as! Dictionary<String,String>
            let model = MovieDataModel(Category: data["Category"], Description: data["Description"], Director: data["Director"], Image: data["Image"], Rating: data["Rating"], Stars: data["Stars"], Title: data["Title"])
            self.movieModels.append(model)
            
        })
        
        setupSearchableItem()
        
        let nib = UINib(nibName: "MovieDataTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: MovieDataModel.CELL_ID)
        
//        self.tableView.estimatedRowHeight = 200
//        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
    }
    
    
    private func setupSearchableItem(){
        
        var csSearchableItems :[CSSearchableItem] = []
        
        for i in 0..<movieModels.count{
            let movie = movieModels[i]
            
            let searchableItemAttributeSet: CSSearchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            searchableItemAttributeSet.title = movie.Title
            let imgParts = movie.Image?.components(separatedBy: ".")
            searchableItemAttributeSet.thumbnailURL = Bundle.main.url(forResource: imgParts?[0], withExtension: imgParts?[1])
            searchableItemAttributeSet.contentDescription = movie.Description
            
            let keyWordsCatogries = movie.Category?.components(separatedBy: ", ")
            let keyWordsStars = movie.Stars?.components(separatedBy: ", ")
            let keyWords = keyWordsCatogries! + keyWordsStars!
            searchableItemAttributeSet.keywords = keyWords
            
            let searchItem = CSSearchableItem(uniqueIdentifier: "org.wx.SpotLightSearch.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)
            
            csSearchableItems.append(searchItem)
        }
        
        CSSearchableIndex.default().indexSearchableItems(csSearchableItems, completionHandler:
            {
                (error) -> Void in
                if let error = error{
                    print(error.localizedDescription)
                }
        })
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if activity.activityType == CSSearchableItemActionType{
            let selecteMovie: String = activity.userInfo![CSSearchableItemActivityIdentifier] as! String
            let index = Int(selecteMovie.components(separatedBy: ".").last!)
            pushViewController(index: index!)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModels.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieDataModel.CELL_ID, for: indexPath) as! MovieDataTableViewCell
        cell.movieModel = movieModels[indexPath.row]
        
        cell.rating.layer.cornerRadius = cell.rating.frame.size.height/2
        cell.rating.layer.masksToBounds = true
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushViewController(index: indexPath.row)
    }
    
    private func pushViewController(index: Int){
        let detailController = MovieDetailsViewController(nibName: "MovieDetailsViewController", bundle: nil)
        detailController.movieModel = movieModels[index]
        self.navigationController?.pushViewController(detailController, animated: true)
    }

}

