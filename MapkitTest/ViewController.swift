//
//  ViewController.swift
//  MapkitTest
//
//  Created by Andrei Soprachev on 07.04.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    lazy var map: MKMapView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        return $0
    }(MKMapView())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(map)
        
        NSLayoutConstraint.activate([
            map.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            map.topAnchor.constraint(equalTo: view.topAnchor),
            map.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let coord: [CLLocationCoordinate2D] = [
            .init(latitude: 60, longitude: 0),
            .init(latitude: 50, longitude: 20)
        ]
        
        map.addOverlay(MKPolyline(coordinates: coord, count: 2))
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let renderer = CustomRederer(overlay: overlay)
            
            renderer.lineWidth = 10
            renderer.strokeColor = .systemBlue
            renderer.shouldRasterize = false
            
            return renderer
        }
        
        return MKOverlayRenderer()
    }
}


class CustomRederer: MKPolylineRenderer {
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        super.draw(mapRect, zoomScale: zoomScale, in: context)
    }
}
