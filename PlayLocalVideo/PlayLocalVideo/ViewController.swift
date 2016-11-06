//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by 魏星 on 2016/11/6.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

import AVKit
import AVFoundation

class PlayLocalVideoViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let datas = [
        
        VideoModel(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        VideoModel(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        VideoModel(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        VideoModel(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        VideoModel(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        VideoModel(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 220
        tableView.rowHeight = UITableViewAutomaticDimension
       
    }
    
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let avPlayerViewController = AVPlayerViewController()
    
    fileprivate lazy var avPlayer: AVPlayer = {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        let player: AVPlayer = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
        return player
    }()

}

extension PlayLocalVideoViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        let data = datas[indexPath.row]
        cell.titleLabel.text = data.title
        cell.sourceLabel.text = data.source
        cell.screenShot.image = UIImage(named: data.image)
        cell.playBtnDidClickDeleage = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension PlayLocalVideoViewController: PlayBtnDidClickDelegate{
    
    func onClick() {
        playVideo()
    }
    
    
    fileprivate func playVideo(){
        avPlayerViewController.player = avPlayer
        self.present(avPlayerViewController, animated: true) { 
            self.avPlayer.play()
        }
    }
}

