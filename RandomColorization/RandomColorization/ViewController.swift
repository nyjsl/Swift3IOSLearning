//
//  ViewController.swift
//  RandomColorization
//
//  Created by 魏星 on 2016/11/7.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {

   
    fileprivate lazy var avPlayer: AVAudioPlayer = self.getAudioPlayer()
    
    let gradientLayer = CAGradientLayer()
    
    private func getAudioPlayer() -> AVAudioPlayer{
        let path = Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")
        let url: URL = URL(string: path!)!
        let avPlayer: AVAudioPlayer = try! AVAudioPlayer(contentsOf: url)
        return avPlayer
    }
    
    fileprivate var timer: Timer?
    private func initTimer() -> Timer{
        let timer: Timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
        return timer
    }
    
    @objc private func changeColor(){
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    @IBAction func playAction(_ sender: UIButton) {
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            avPlayer.prepareToPlay()
            avPlayer.delegate = self
            if avPlayer.isPlaying{
                avPlayer.pause()
                if timer!.isValid{
                    timer!.invalidate()
                }
            }else{
                setBg()
                timer = initTimer()
                avPlayer.play()
            }
        }catch{
            print(error)
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: AVAudioPlayerDelegate{
    
    
    fileprivate func setBg(){
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        //graditent color
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor as CGColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor as CGColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor as CGColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor as CGColor
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint =  CGPoint(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer)
    }
}
