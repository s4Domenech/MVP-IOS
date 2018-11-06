//
//  ViewControllerPresenter.swift
//  MVP
//
//  Created by Sylvia Callejas on 06/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import Foundation

class ViewControllerPresenter {
    var view: View
    
    init(view: View) {
        self.view = view
    }
    
    func changeLabelButtonPressed() {
        self.view.changeLabel("Pressed!!")
    }
}

protocol View {
    func changeLabel(_ text: String)
}
