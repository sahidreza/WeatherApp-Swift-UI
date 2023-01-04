//
//  LocationManager.swift
//  Weather Application SwiftUI
//
//  Created by Sahid Reza on 04/01/23.
//

import Foundation
import CoreLocation


final class LocationManager: NSObject ,CLLocationManagerDelegate,ObservableObject{
    
    private let locationmanger = CLLocationManager()
    
    @Published var latittude:String = String()
    @Published var lognitude:String = String()
    
    
    override init() {
        super.init()
        print("step3")
        locationmanger.requestWhenInUseAuthorization()
        locationmanger.delegate = self
    }
    
    func requestLocation(){
        print("step2")
        locationmanger.requestLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("step4")
        
        if let location = locations.last {
            DispatchQueue.main.async {
                
                self.locationmanger.stopUpdatingLocation()
                
                self.latittude = "\(location.coordinate.latitude)"
                self.lognitude = "\(location.coordinate.longitude)"
                
            }
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print(error)
    }
    
}

