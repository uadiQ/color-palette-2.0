//
//  ViewController.swift
//  color palette 2.0
//
//  Created by Vadim Shoshin on 16.10.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorPalette: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var alphaLabel: UILabel!
    
    let maxValue: Float = 255
    let minValue: Float = 0
    
    var mediumValue: Float
    {
        return ((maxValue + minValue) / 2)
    }
    
    
    var rgbSliders: [UISlider]
    {
        return[redSlider, greenSlider, blueSlider]
    }

    
    
    func setupMinMaxValues(slider: UISlider)
    {
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
    }
    
    
    func updateColorLabels()
    {
        redLabel.text = "\(Int(redSlider.value))"
        greenLabel.text = "\(Int(greenSlider.value))"
        blueLabel.text = "\(Int(blueSlider.value))"
        alphaLabel.text = ("\(Int(alphaSlider.value))")
    }
    
    func updatePaletteColor()
    {
        let redColor: CGFloat = CGFloat(redSlider.value) / 255.0
        let greenColor: CGFloat = CGFloat(greenSlider.value) / 255.0
        let blueColor: CGFloat = CGFloat(blueSlider.value) / 255.0
        let alpha: CGFloat = CGFloat(alphaSlider.value) / 100.0
        colorPalette.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: alpha)
    }
    
    func setValueToAllSliders(_ value: Float)
    {
        for slider in rgbSliders
        {
            slider.value = value
        }
        updateColorLabels()
        updatePaletteColor()
    }

    
    func configureSliders()
    {
        for slider in rgbSliders
        {
            setupMinMaxValues(slider: slider)
        }
        alphaSlider.minimumValue = 0.0
        alphaSlider.maximumValue = 100.0
        alphaSlider.value = 75.0
        setValueToAllSliders(mediumValue)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSliders()
    }
    
    
    @IBAction func anySliderChanged(_ sender: Any)
    {
        updatePaletteColor()
        updateColorLabels()
    }
    
    
}

