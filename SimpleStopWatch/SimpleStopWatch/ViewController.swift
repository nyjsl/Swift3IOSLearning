//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by 魏星 on 2016/10/30.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBAction func resetAction(_ sender: UIButton) {
        currentCount = 0.0
        isPlaying = false
        timer.invalidate()

    }
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBOutlet weak var playBtn: UIButton!
    
    
    @IBAction func playAction(_ sender: UIButton) {
        guard !isPlaying else{
            return
        }
        isPlaying = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.upateTimer), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var pauseBtn: UIButton!
    

    
    fileprivate var currentCount:Double = 0.0{
        didSet{
            timeLabel.text = "\(String(format: "%.1f", currentCount) )"
        }
    }
    
    fileprivate lazy var timer: Timer = {
        let timer: Timer = Timer()
        return timer
    }()
    
    fileprivate var isPlaying = false{
        didSet{
            playBtn.isEnabled = !isPlaying
            pauseBtn.isEnabled = isPlaying
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
            self.view.backgroundColor = UIColor.black
        currentCount = 0.0
        
        pauseBtn.addTarget(self, action: #selector(ViewController.pauseBtnAction), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func pauseBtnAction(){
        isPlaying = false
        timer.invalidate()
    }
    
    func upateTimer(){
        currentCount += 0.1
    }

}

