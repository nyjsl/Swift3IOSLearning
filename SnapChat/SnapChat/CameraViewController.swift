//
//  CameraViewController.swift
//  SnapChat
//
//  Created by 魏星 on 2016/11/6.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CameraViewController: UIViewController{
    
    
    @IBOutlet var cameraView: UIView!
    
    @IBOutlet weak var preViewImageView: UIImageView!
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        prevewLayer.frame = cameraView.bounds
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let device = captureDevice{
            do{
                let avDeviceInput = try AVCaptureDeviceInput(device: device)
                if captureSession.canAddInput(avDeviceInput){
                    captureSession.addInput(avDeviceInput)
                    
                    captureSession.addOutput(stillImageOutPut)
                    
                    cameraView.layer.addSublayer(prevewLayer)
                    captureSession.startRunning()
                    
                }
            }catch{
                print(error)
            }

        }
        
    }
    
    fileprivate lazy var captureSession: AVCaptureSession = {
        
        let captureSession: AVCaptureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSessionPreset1920x1080
        return captureSession
        
    }()
    
    fileprivate lazy var captureDevice: AVCaptureDevice? = {
        
        let captureDevice: AVCaptureDevice? = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        return captureDevice
    }()
    
    fileprivate lazy var stillImageOutPut: AVCapturePhotoOutput = {
        
        let photoOutPut: AVCapturePhotoOutput = AVCapturePhotoOutput()
        return photoOutPut
    }()
    
    fileprivate lazy var prevewLayer: AVCaptureVideoPreviewLayer = {
        
        let preViewLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        preViewLayer.videoGravity = AVLayerVideoGravityResizeAspect
        preViewLayer.connection.videoOrientation = .portrait
        return preViewLayer
        
    }()
    
    fileprivate var didTakePhoto = false{
        didSet{
            if didTakePhoto{
                preViewImageView.isHidden = true
            }else{
                captureSession.startRunning()
                getAndShowPreView()
            }
        }
    }
    
    fileprivate func getAndShowPreView(){
        if let connection = stillImageOutPut.connection(withMediaType: AVMediaTypeVideo){
            if connection.isActive{
                let settings = AVCapturePhotoSettings()
                let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
                let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
                                     kCVPixelBufferWidthKey as String: 160,
                                     kCVPixelBufferHeightKey as String: 160,
                                     ]
                settings.previewPhotoFormat = previewFormat
                stillImageOutPut.capturePhoto(with: settings, delegate: self)
            }
        }
        
    }
    
}

extension CameraViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didTakePhoto = !didTakePhoto
    }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate{
    
    func capture(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?, previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if let error = error {
            print(error.localizedDescription)
        }
        
        if let sampleBuffer = photoSampleBuffer, let previewBuffer = previewPhotoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewBuffer) {
            self.preViewImageView.image = UIImage(data: dataImage)
            self.preViewImageView.isHidden = false
        }

    }
    
}
