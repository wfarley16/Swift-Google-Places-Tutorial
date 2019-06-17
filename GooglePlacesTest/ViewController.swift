//
//  ViewController.swift
//  GooglePlacesTest
//
//  Created by William Farley on 6/17/19.
//  Copyright © 2019 William Farley. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {
    
    var placesClient: GMSPlacesClient!
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationManager.requestAlwaysAuthorization()
        placesClient = GMSPlacesClient.shared()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        placesClient.currentPlace { (placeList, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placesList = placeList {
                let place = placeList?.likelihoods.first?.place
                if let place = place {
                    print(place.coordinate)
                    print(place.name)
                }
            }
            
        }
    }


}
