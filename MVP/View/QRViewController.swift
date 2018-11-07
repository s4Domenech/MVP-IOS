//
//  QRViewController.swift
//  MVP
//
//  Created by Sylvia Callejas on 07/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import UIKit

class QRViewController: UIViewController, QRView{
    var presenter: QRPresenter?
    
    @IBAction func generateQRButton(_ sender: UIButton) {
        presenter?.generateQRButtonPressed()
    }
    @IBAction func readQRButton(_ sender: UIButton) {
        presenter?.readQRButtonPressed()
    }
    @IBOutlet var imgQR: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = QRPresenter(view: self)
    }
    
    func loadQRImage() {
        let stringToCode = "Testing"
        let data = stringToCode.data(using: .ascii, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        
        let img = UIImage(ciImage: (filter?.outputImage)!)
        
        imgQR.image = img
    }
}
