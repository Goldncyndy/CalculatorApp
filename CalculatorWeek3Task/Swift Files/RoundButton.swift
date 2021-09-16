//
//  RoundButton.swift
//  CalculatorWeek3Task
//
//  Created by Decagon on 20/07/2021.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {
  
  @IBInspectable var roundButton:Bool = false {
    didSet {
      if roundButton {
        layer.cornerRadius = frame.height / 2
      }
    }
  }
  
  override func prepareForInterfaceBuilder() {
    
    if roundButton {
      layer.cornerRadius = frame.height / 2
    }
  }
}

