//
//  ViewController.swift
//  CarouselEffect
//
//  Created by 魏星 on 2016/11/6.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    

    @IBOutlet weak var interestCollectionView: UICollectionView!
    
    fileprivate lazy var interests:[Interests] = {
        return Interests.buildInterests()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        interestCollectionView.dataSource = self
        interestCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReuseable.Identifier, for: indexPath) as! InterestCollectionViewCell
        let interest = interests[indexPath.row]
        cell.cellModel = interest
        return cell
    }
    
}



