//
//  ViewControllerPresenter.swift
//  MVP
//
//  Created by Sylvia Callejas on 06/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import Foundation

class ViewControllerPresenter {
    var navigator: Navigator
    
    init(navigator: Navigator) {
        self.navigator = navigator
    }
    
    func mapButtonPressed() {
        self.navigator.navigateToMap()
    }
}

protocol Navigator {
    func navigateToMap()
}
