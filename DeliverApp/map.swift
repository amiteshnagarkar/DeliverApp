//
//  map.swift
//  DeliverApp
//
//  Created by Amitesh Nagarkar on 21/12/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct Landmark: Equatable {
    static func ==(lhs: Landmark, rhs: Landmark) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID().uuidString
    let name: String
    let location: CLLocationCoordinate2D
}
//change name of this struct
struct ContentViewww: View {
    @State var landmarks: [Landmark] = [
        Landmark(name: "Lidl", location: .init(latitude: 52.046144, longitude: -0.677294)),
        Landmark(name: "Broughton Co-op", location: .init(latitude: 52.043590, longitude: -0.684886)),
        Landmark(name: "Sainsbury's Local", location: .init(latitude: 52.046917, longitude: -0.678846))
    ]
    
    @State var selectedLandmark: Landmark? = nil
    
    var body: some View {
        ZStack {
            MapView(landmarks: $landmarks,
                    selectedLandmark: $selectedLandmark)
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                Spacer()
                Button(action: {
                    self.selectNextLandmark()
                }) {
                    Text("Next")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 3)
                        .padding(.bottom)
                }
            }
        }
    }
    
    private func selectNextLandmark() {
        if let selectedLandmark = selectedLandmark, let currentIndex = landmarks.firstIndex(where: { $0 == selectedLandmark }), currentIndex + 1 < landmarks.endIndex {
            self.selectedLandmark = landmarks[currentIndex + 1]
        } else {
            selectedLandmark = landmarks.first
        }
    }
}





///

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let id: String
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(landmark: Landmark) {
        self.id = landmark.id
        self.title = landmark.name
        self.coordinate = landmark.location
    }
}

struct MapView: UIViewRepresentable {
    @Binding var landmarks: [Landmark]
    @Binding var selectedLandmark: Landmark?
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotations(from: uiView)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, MKMapViewDelegate {
        var control: MapView

        init(_ control: MapView) {
            self.control = control
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let coordinates = view.annotation?.coordinate else { return }
            let span = mapView.region.span
            let region = MKCoordinateRegion(center: coordinates, span: span)
            mapView.setRegion(region, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? LandmarkAnnotation else { return nil }
            let identifier = "Annotation"
            var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView?.annotation = annotation
            }
            return annotationView
        }
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let newAnnotations = landmarks.map { LandmarkAnnotation(landmark: $0) }
        mapView.addAnnotations(newAnnotations)
        if let selectedAnnotation = newAnnotations.filter({ $0.id == selectedLandmark?.id }).first {
            mapView.selectAnnotation(selectedAnnotation, animated: true)
        }
    }
}





/*
struct Map: UIViewRepresentable {


    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        view.showsUserLocation = true
        let locationManager = CLLocationManager()
        let status = CLLocationManager.authorizationStatus()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()

        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            let location: CLLocationCoordinate2D = locationManager.location!.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
            let region = MKCoordinateRegion(center: location, span: span)
            view.setRegion(region, animated: true)
        }
    }

}
 
*/

#if DEBUG

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        //call structs here
        ContentViewww ()
       
        //map()
    }
}

#endif
