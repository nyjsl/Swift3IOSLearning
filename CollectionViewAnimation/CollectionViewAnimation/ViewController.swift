//
//  ViewController.swift
//  CollectionViewAnimation
//
//  Created by 魏星 on 2016/12/18.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    let cellModels: [CustomCellModel] = [
        CustomCellModel("1"),
        CustomCellModel("2"),
        CustomCellModel("3"),
        CustomCellModel("4"),
        CustomCellModel("5")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        collectionView?.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CellId")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView?.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! CustomCell
        cell.cellModel = cellModels[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomCell{
            
            let animationClosure: () -> Void = {
                () -> Void in
                cell.frame = collectionView.bounds
            }
            
            let completionClosure: (Bool) -> Void = {
                (finished) -> Void in
                collectionView.isScrollEnabled = false
            }
            cell.backBtnDidTouch = {
                () -> Void in
                if let indexPaths = self.collectionView?.indexPathsForSelectedItems{
                    collectionView.isScrollEnabled = true
                    collectionView.reloadItems(at: indexPaths)

                }
            }
            cell.handleCellSelected()
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: animationClosure, completion: completionClosure)
        }
    }
    
       
}

