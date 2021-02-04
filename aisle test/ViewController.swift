//
//  ViewController.swift
//  aisle test
//
//  Created by Akshay M on 14/11/1942 Saka.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var upgradebtn: UIButton!
    @IBOutlet weak var subImg1: UIImageView!
    @IBOutlet weak var subImg2: UIImageView!
    @IBOutlet weak var count1: UILabel!
    @IBOutlet weak var count2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainImage.layer.cornerRadius = 10
        upgradebtn.layer.cornerRadius = 10
        subImg1.layer.cornerRadius = 10
        subImg2.layer.cornerRadius = 10
        count1.layer.cornerRadius = count1.frame.width/2
        count2.layer.cornerRadius = count2.frame.width/2
        count1.layer.masksToBounds = true
        count2.layer.masksToBounds = true
        self.blurEffect()
        self.blurEffectForSecondImage()
    }
    func blurEffect() {

        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: subImg1.image!)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(10, forKey: kCIInputRadiusKey)

        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")

        let output = cropFilter!.outputImage
        let context = CIContext(options: nil)
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        subImg1.image = processedImage
    }
    func blurEffectForSecondImage() {

        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: subImg2.image!)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(10, forKey: kCIInputRadiusKey)

        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")

        let output = cropFilter!.outputImage
        let context = CIContext(options: nil)
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        subImg2.image = processedImage
    }



}

