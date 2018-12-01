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
    
    var context = CIContext(options: nil)
    
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
    
    
    func RGB(chooseImage: UIImageView, r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        // filter logic
        
        
        
        let currentFilter = CIFilter(name: "CIColorMatrix")
        //var r:CGFloat = 1
        //var g:CGFloat = 0
        //var b:CGFloat = 1
        //var a:CGFloat = 1
    
        
        
        //tintColor.getRed(&r, green:&g, blue:&b, alpha:&a)
        
        currentFilter!.setValue(CIImage(image: chooseImage.image!), forKey: "inputImage")
        currentFilter!.setValue(CIVector(x:r, y:0, z:0, w:0), forKey:"inputRVector")
        currentFilter!.setValue(CIVector(x:0, y:g, z:0, w:0), forKey:"inputGVector")
        currentFilter!.setValue(CIVector(x:0, y:0, z:b, w:0), forKey:"inputBVector")
        currentFilter!.setValue(CIVector(x:0, y:0, z:0, w:a), forKey:"inputAVector")
        
        let output = currentFilter!.outputImage
        let cgimg = context.createCGImage(output!,from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        chooseImage.image = processedImage
        Blend(chooseImage: chooseImage)
    }
    
    func Blend(chooseImage: UIImageView) {
        // filter logic
        
        let currentFilter = CIFilter(name: "CIScreenBlendMode")
        
        
        currentFilter!.setValue(CIImage(image: chooseImage.image!), forKey: kCIInputImageKey)
        let output = currentFilter!.outputImage
        let cgimg = context.createCGImage(output!,from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        chooseImage.image = processedImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TintRed(chooseImage: image1)
        //TintBlue(chooseImage: image2)
        RGB(chooseImage: image1, r:1, g:0, b:0, a:0.5)
        RGB(chooseImage: image2, r:0, g:0, b:1, a:0.5)
        //TintPurple()
        
        
        
        
    }

    
    
}

