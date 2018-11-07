//
//  QRViewController.swift
//  MVP
//
//  Created by Sylvia Callejas on 07/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import UIKit
import AVFoundation

class QRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, QRView{
    var presenter: QRPresenter?
    
    var video = AVCaptureVideoPreviewLayer()
    @IBOutlet var frame: UIImageView!
    
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
    
    func readQRImage() {
        let session = AVCaptureSession()
        
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        } catch {
            print("ERROR")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubviewToFront(frame)
        
        session.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects != nil && metadataObjects.count != nil {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                if object.type == AVMetadataObject.ObjectType.qr {
                    let alert = UIAlertController(title: "QR Code", message: "Message", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { (nil) in
                        UIPasteboard.general.string = object.stringValue
                    }))
                    
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
