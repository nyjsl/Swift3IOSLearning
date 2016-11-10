//
//  VideoBackgroudBaseViewController.swift
//  VideoBackground
//
//  Created by 魏星 on 2016/11/10.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation

import UIKit
import AVKit
import AVFoundation

enum VideoGravity{
    case resize
    case resizeAspect
    case resizeAspectFill
}

class VideoBackgroundBaseViewController: UIViewController{
    
    lazy var videoViewController: AVPlayerViewController = {
        return AVPlayerViewController()
    }()
    
    var videoGravity: VideoGravity = .resizeAspectFill{
        didSet{
            switch videoGravity{
            case .resizeAspectFill:
                videoViewController.videoGravity = AVLayerVideoGravityResizeAspectFill
            case .resize:
                videoViewController.videoGravity = AVLayerVideoGravityResize
            case .resizeAspect:
                videoViewController.videoGravity = AVLayerVideoGravityResizeAspect
            }
        }
        
    }
    
    func setVideoParams(url:URL,videoGravity:VideoGravity = .resizeAspectFill,alpha: CGFloat = 1.0,sound: Bool = true,`repeat`: Bool = true){
        self.videoGravity = videoGravity
        self.url = url
        self.alpha = alpha
        self.sound = sound
        self.`repeat` = `repeat`
    }
    
    
    var alpha: CGFloat = CGFloat(){
        didSet{
            videoViewController.view.alpha = alpha
        }
    }
    
    var sound: Bool = true{
        didSet{
            videoViewController.player?.volume = sound ? 1.0: 0.0
        }
    }
    
    var `repeat`: Bool = true{
        didSet{
            NotificationCenter.default.addObserver(self, selector: #selector(playItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: videoViewController.player?.currentItem)
        }
    }
    
    var url: URL?{
        didSet{
            videoViewController.player = AVPlayer(url: url!)
            videoViewController.player?.play()
        }
    }
    
    var frame: CGRect = CGRect(){
        didSet{
            videoViewController.view.frame = frame
            videoViewController.showsPlaybackControls = false
            view.addSubview(videoViewController.view)
            view.sendSubview(toBack: videoViewController.view)
        }
    }
    
    @objc func playItemDidReachEnd(){
        videoViewController.player?.seek(to: kCMTimeZero)
        videoViewController.player?.play()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}
