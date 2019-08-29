//
//  ViewController.swift
//  MyVote
//
//  Created by David Araya on 2019-08-25.
//  Copyright © 2019 ElValle. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, UITextFieldDelegate{
    
    private let locationSource = ["Canada", "U.S.A", "France", "England"]
 
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var textField: UITextField!
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewUserLocation(){
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled()
        {
            //setup our location manager
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //show alert letting the user know they have to turn it on
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewUserLocation()
            //Do map stuff
            break
        case .denied:
            //Show alert instructing how to turn on permission
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            //User can not change app status
            // Show alert letting them know whats happening
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
        
    @IBAction func initButton(_ sender: Any) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
    }
}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //
    }
}

