//
//  ViewController.swift
//  EmojiMachine
//
//  Created by 魏星 on 2016/11/16.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class EmojiViewController: UIViewController {
    
    
    @IBOutlet weak var goBtn: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!

    @IBOutlet weak var resultLabel: UILabel!
    
    fileprivate var result = "" {
        didSet{
            resultLabel.text = result
        }
    }
    
    fileprivate var selectedRows:(String,String,String)?{
        didSet{
            if selectedRows?.0 == selectedRows?.1 && selectedRows?.1 == selectedRows?.2{
                result = "Bingo"
            }else{
                result = "💔"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initData()
        
        goBtn.layer.cornerRadius = 6
        
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.selectRow(0, inComponent: 1, animated: true)
        pickerView.selectRow(0, inComponent: 2, animated: true)
        selectedRows = (imageArray[dataArray1[0]],imageArray[dataArray2[0]],imageArray[dataArray3[0]])
    }
    
    private func initData(){
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for _ in 0 ..< 100 {
            dataArray1.append((Int)(arc4random() % 10 ))
            dataArray2.append((Int)(arc4random() % 10 ))
            dataArray3.append((Int)(arc4random() % 10 ))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goAction(_ sender: UIButton) {
        pickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        pickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        pickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)
        
        selectedRows?.0 = imageArray[dataArray1[pickerView.selectedRow(inComponent: 0)]]
        selectedRows?.1 = imageArray[dataArray2[pickerView.selectedRow(inComponent: 1)]]
        selectedRows?.2 = imageArray[dataArray3[pickerView.selectedRow(inComponent: 2)]]

    }
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    
    
}
extension EmojiViewController: UIPickerViewDataSource,UIPickerViewDelegate{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            selectedRows?.0 = imageArray[dataArray1[row]]
            print(selectedRows?.0)
        case 1:
            selectedRows?.1 = imageArray[dataArray2[row]]
            print(selectedRows?.1)
        case 2:
            selectedRows?.2 = imageArray[dataArray3[row]]
            print(selectedRows?.2)
        default:
            selectedRows?.0 = imageArray[dataArray1[row]]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = .center
        switch component {
        case 0:
            pickerLabel.text = imageArray[dataArray1[row]]
        case 1:
            pickerLabel.text = imageArray[dataArray2[row]]
        case 2:
            pickerLabel.text = imageArray[dataArray3[row]]
        default:
            pickerLabel.text = imageArray[dataArray1[row]]
        }
        return pickerLabel
    }
}




