//
//  ViewController.swift
//  FindMyLocation
//
//  Created by 魏星 on 2016/11/6.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var locationLabel: UILabel!
    
    
    @IBAction func findLocationAction(_ sender: UIButton) {
        locationManager.startUpdatingLocation()

    }
    fileprivate lazy var locationManager: CLLocationManager = {
        let locationManager: CLLocationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        return locationManager
    }()

}

extension ViewController: CLLocationManagerDelegate{
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLabel.text = "Error while updating location \(error.localizedDescription)"
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placeMarkers, error) in
            if nil != error{
                self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            if placeMarkers!.count > 0{
                let pm = placeMarkers![0]
                self.displayLocationInfo(placeMarker: pm)
            }
        }
    }
    
    private func displayLocationInfo(placeMarker: CLPlacemark?){
        if let pm = placeMarker{
            locationManager.stopUpdatingLocation()
            
            let locality = pm.locality ?? ""
            let postalCode = pm.postalCode ?? ""
            let administrativeArea = pm.administrativeArea ?? ""
            let country = pm.country ?? ""
            self.locationLabel.text = locality + postalCode + administrativeArea + country
        }
    }
    
    
    
}

