//
//  ViewController.swift
//  Demo Annotation Animation
//
//  Created by William O'Connor on 02/04/2018.
//  Copyright © 2018 William O'Connor. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    private let myAnnotation = MKPointAnnotation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set start and destination coordinates.
        let startPosition = CLLocationCoordinate2D(latitude: 53.3498, longitude: -6.2603)
        let destinationPosition = CLLocationCoordinate2D(latitude: 52.3369, longitude: -6.4633)
        
        // Set the region the MapView will be looking at at.
        let region = MKCoordinateRegionMakeWithDistance(startPosition, 100000, 100000)
        mapView.setRegion(region, animated: true)
        
        // Add annotation to map.
        myAnnotation.coordinate = startPosition
        mapView.addAnnotation(myAnnotation)
        
        // Set timer of 5 seconds before beginning the animation.
        weak var timer: Timer?
        
        func movePosition() {
            // Set timer to run after 5 seconds.
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { [weak self] _ in
                // Set animation to last 4 seconds.
                UIView.animate(withDuration: 4, animations: {
                    // Update annotation coordinate to be the destination coordinate
                    self?.myAnnotation.coordinate = destinationPosition
                }, completion: nil)
            }
        }
        
        // Start moving annotation.
        movePosition()
        
    }
}
