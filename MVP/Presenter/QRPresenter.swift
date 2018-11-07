//
//  QRPresenter.swift
//  MVP
//
//  Created by Sylvia Callejas on 07/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import Foundation

class QRPresenter {
    var view: QRView
    
    init (view: QRView) {
        self.view = view
    }
    
    func generateQRButtonPressed() {
        view.loadQRImage()
    }
    
    func readQRButtonPressed() {
        
    }
}

protocol QRView {
    func loadQRImage()
}
