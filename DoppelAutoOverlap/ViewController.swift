//
//  ViewController.swift
//  DoppelAutoOverlap
//
//  Created by Neil Clavin on 18/11/2018.
//  Copyright © 2018 Neil Clavin. All rights reserved.
//

import UIKit


extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}



class ViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    
    
    func TintRed(chooseImage: UIImageView) {
    
    
    let templateImage = chooseImage.image!.withRenderingMode(.alwaysTemplate)
    chooseImage.image = templateImage
       
    chooseImage.tintColor = UIColor.red
        
        
    }
    
    func TintBlue(chooseImage: UIImageView) {
        
        
        let templateImage = chooseImage.image!.withRenderingMode(.alwaysTemplate)
        chooseImage.image = templateImage
        
        chooseImage.tintColor = UIColor.blue
        
        
    }

    func TintPurple() {
        let imageView = UIImageView(image: UIImage(named: "image1"))
        imageView.setImageColor(color: UIColor.purple)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TintRed(chooseImage: image1)
        //TintBlue(chooseImage: image2)
        TintPurple()
        
        
        
        
    }

    
    
}

