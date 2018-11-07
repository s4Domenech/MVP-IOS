//
//  ViewControllerPresenter.swift
//  MVP
//
//  Created by Sylvia Callejas on 06/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import Foundation

class MainPresenter {
    var navigator: MainNavigator
    
    init(navigator: MainNavigator) {
        self.navigator = navigator
    }
    
    func mapButtonPressed() {
        self.navigator.navigateToMapView()
    }
    
    func qrButtonPressed() {
        self.navigator.navigateToQrView()
    }
    
    func passButtonPressed() {
        self.navigator.navigateToPassView()
    }
}

protocol MainNavigator {
    func navigateToMapView()
    func navigateToQrView()
    func navigateToPassView()
}
