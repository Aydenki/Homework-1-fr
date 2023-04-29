//
//  GPSViewController.swift
//  GPS
//
//  Created by Loaner on 4/29/23.
//

import UIKit

class GPSViewController: UITabBarController {
    import UIKit
    import CoreLocation
    class GPSViewController: UIViewController, CLLocationManagerDelegate {

        
        @IBOutlet var distanceLabel: UILabel!
        
        
        let locMan: CLLocationManager = CLLocationManager()
        var startLocation:  CLLocation!
        
        let floLongitude: CLLocationDegrees = -81.760254
        let flolatitude: CLLocationDegrees = 27.994402
        
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
            
            let newLocation: CLLocation=locations[0]
            NSLog("Something is happening")
            
            if newLocation.horizontalAccuracy>=0 {
                let flo:CLLocation = CLLocation(latitude: flolatitude, longitude: floLongitude)
                let delta:CLLocationDistance = flo.distance(from: newLocation)
                let miles: Double = (delta * 0.000621371) + 0.5
                if miles < 3 {
                    locMan.stopUpdatingLocation()
                    distanceLabel.text = " Enjoy\nFlorida!"
                    
                }else {
                    let commaDelimited: NumberFormatter = NumberFormatter()
                    commaDelimited.numberStyle = NumberFormatter.Style.decimal
                    distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to Florida"
                }
    }
    

    


