//
//  ViewController.swift
//  MapLocationAnimation
//
//  Created by mr.scorpion on 4/17/16.
//  Copyright © 2016 mr.scorpion. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    // MARK: - Types
    struct Constants {
        struct MapViewIdentifiers {
            static let sonarAnnotationView = "sonarAnnotationView"
        }
    }
    
    // MARK: - Properties
//    @IBOutlet var mapView: MKMapView!
    var mapView: MKMapView?
    let regionRadius: CLLocationDistance = 3000
    let latitude = 22.54679
    let longitude = 114.13518
    
    
    // MARK: - View Life Cycle
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        mapView = MKMapView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)))
        mapView?.delegate = self    // Do not forget this step
        self.view.addSubview(mapView!)
        
        // Set initial location for map view.
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        centerMapOnLocation(initialLocation)
        
        // Add annotation to map based on location.
        let annotation = Annotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), title: nil, subtitle: nil)
        mapView!.addAnnotation(annotation)
        
        // Tap Dismiss
        let singleFingerTwo = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        singleFingerTwo.numberOfTapsRequired = 4
        self.view.addGestureRecognizer(singleFingerTwo)
    }

    
   // MARK: - MKMapViewDelegate
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        // Reuse the annotation if possible.
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(Constants.MapViewIdentifiers.sonarAnnotationView)
        
        if annotationView == nil {
           annotationView = SonarAnnotationView(annotation: annotation, reuseIdentifier: Constants.MapViewIdentifiers.sonarAnnotationView)
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    
    // MARK: - Convenience
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView!.setRegion(coordinateRegion, animated: false)
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Status Bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}