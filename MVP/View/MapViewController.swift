//
//  MapViewController.swift
//  MVP
//
//  Created by Sylvia Callejas on 06/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MapView {
    var presenter: MapPresenter?
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = MapPresenter(view: self)
        self.presenter?.initialize()
    }
    
    func initMap() {
        let locationGranada = CLLocationCoordinate2DMake(37.1773363, -3.5985570999999936)
        let locationGame = CLLocationCoordinate2DMake(37.1546683, -3.6086245999999846)
        let locationGameNevada = CLLocationCoordinate2DMake(37.1463704, -3.613418300000035)
        let locationCEX = CLLocationCoordinate2DMake(37.1723654, -3.6001013999999714)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
        
        let region = MKCoordinateRegion(center: locationGranada, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotationGame = MKPointAnnotation()
        annotationGame.coordinate = locationGame
        annotationGame.title = "Game"
        annotationGame.subtitle = "Compra tus juegos en GAME!"
        let annotationGameNevada = MKPointAnnotation()
        annotationGameNevada.coordinate = locationGameNevada
        annotationGameNevada.title = "Game Nevada"
        annotationGameNevada.subtitle = "Compra tus juegos en el centro comercial Nevada!"
        let annotationCEX = MKPointAnnotation()
        annotationCEX.coordinate = locationCEX
        annotationCEX.title = "CEX"
        annotationCEX.subtitle = "Compra o vende tus juegos en CEX!"
        
        map.addAnnotation(annotationGame)
        map.addAnnotation(annotationGameNevada)
        map.addAnnotation(annotationCEX)
    }
}
