//
//  ViewController.swift
//  MosaicLayout
//
//  Created by 魏星 on 2016/12/24.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit
import Foundation

import FMMosaicLayout

class MosaicViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView?.collectionViewLayout = mosaicLayout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var mosaicLayout: FMMosaicLayout = {
        return FMMosaicLayout()
    }()

}

extension MosaicViewController: FMMosaicLayoutDelegate{
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, numberOfColumnsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        if let uiImageView = cell.viewWithTag(1) as! UIImageView? {
            uiImageView.image = UIImage(named: "\(indexPath.row + 1)")
        }
        
        let randomBlue = CGFloat(drand48())
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        
        cell.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        cell.alpha = 0.0
        let cellDeay = UInt64(drand48())
        let deadLine = DispatchTime(uptimeNanoseconds: DispatchTime.now().uptimeNanoseconds + cellDeay*NSEC_PER_SEC)
        print(deadLine)
        DispatchQueue.main.asyncAfter(deadline: deadLine, execute: {() -> Void
            in
            UIView.animate(withDuration: 1, animations: {
                cell.alpha = 1.0
            })
        })
       
        return cell
    }
    

    
//    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, insetForSectionAt section: Int) -> UIEdgeInsets {
//        
//        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
//    }
    
//    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, interitemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10.0
//    }
//
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, mosaicCellSizeForItemAt indexPath: IndexPath! ) -> FMMosaicCellSize {
        return indexPath.item % 7 == 0 ? FMMosaicCellSize.big : FMMosaicCellSize.small
    }
}





