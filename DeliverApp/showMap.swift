//
//  showMap.swift
//  DeliverApp
//
//  Created by Amitesh Nagarkar on 23/12/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import SwiftUI
import MapKit
import Foundation


class LandmarkkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    static func requestMockData()-> [LandmarkkAnnotation]{
        return [
            LandmarkkAnnotation(title: "Bengalore",
                               subtitle:"Bengaluru (also called Bangalore) is the capital of India's southern Karnataka state.",
                               coordinate: .init(latitude: 12.9716, longitude: 77.5946)),
            LandmarkkAnnotation(title: "Mumbai",
                               subtitle:"Mumbai (formerly called Bombay) is a densely populated city on India’s west coast",
                               coordinate: .init(latitude: 19.0760, longitude: 72.8777))
        ]
    }
}


struct showMap: UIViewRepresentable {
    
    let landmarks = LandmarkkAnnotation.requestMockData()
    
    func makeCoordinator() -> MapViewCoordinator {
       MapViewCoordinator(self)
    }
    
    /**
     - Description - Replace the body with a make UIView(context:) method that creates and return an empty MKMapView
     */
    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        //If you changing the Map Annotation then you have to remove old Annotations
       //mapView.removeAnnotations(mapView.annotations)
        view.delegate = context.coordinator
       // view.addAnnotations(landmarks)
    }
}

///


///

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
      var mapViewController: showMap
        
      init(_ control: showMap) {
          self.mapViewController = control
      }
        
      func mapView(_ mapView: MKMapView, viewFor
           annotation: MKAnnotation) -> MKAnnotationView?{
         //Custom View for Annotation
          let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
          annotationView.canShowCallout = true
          //Your custom image icon
          annotationView.image = UIImage(named: "locationpin")
          return annotationView
       }
}

///

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        showMap()
    }
}

