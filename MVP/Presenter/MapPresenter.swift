//
//  MapPresenter.swift
//  MVP
//
//  Created by Sylvia Callejas on 07/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import Foundation

class MapPresenter {
    var view: MapView
    
    init (view: MapView) {
        self.view = view
    }
    
    func initialize() {
        self.view.initMap()
    }
}

protocol MapView {
    func initMap()
}
