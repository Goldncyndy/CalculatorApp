//
//  ViewController.swift
//  Calculator
//
//  Created by Decagon on 19/07/2021.
//

import UIKit
// enum declaration

enum OperationHandler: String {
  case Addition = "+"
  case Subtraction = "-"
  case Multiplication = "*"
  case Division = "/"
  case Null = "Null"
  case Percentage = "%"
}


class ViewController: UIViewController {
  
//Output labels declaration
  @IBOutlet weak var outputLabel: UILabel!
  @IBOutlet weak var outputLabl: UILabel!
  
// variable declaration
  var runningValue = ""
  var leftValue = ""
  var rightValue = ""
  var result = ""
  var currentOperation: OperationHandler = .Null
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
// function for any number button pressed on the calculator
  @IBAction func numberPressed (_ sender: RoundButton) {
    if runningValue.count <= 9 {
      runningValue += "\(sender.tag)"
      outputLabel.text = runningValue
      outputLabl.text = outputLabel.text
    }
  }
  
  // function for all-clear button pressed on the calculator to reset the calculator
  @IBAction func allClearPressed (_ sender: RoundButton) {
    runningValue = ""
    leftValue = ""
    rightValue = ""
    result = ""
    currentOperation = .Null
    outputLabel.text = "0"
    outputLabl.text = "0"
  }
  
// function for divide button presseed
  @IBAction func dividePressed (_ sender: RoundButton) {
    operation(operation: .Division)
  }
  
// function for multiplication operation
  @IBAction func multiplyPressed (_ sender: RoundButton) {
    operation(operation: .Multiplication)
  }
  
// function for addition operation
  @IBAction func addPressed (_ sender: RoundButton) {
    operation(operation: .Addition)
  }
  
// function for subtraction operation
  @IBAction func subtractPressed (_ sender: RoundButton) {
    operation(operation: .Subtraction)
  }
  
// function for decimal point button pressed (can only contain one decimal point)
  
  @IBAction func decimalPointPressed (_ sender: RoundButton) {
    if runningValue.contains(".") {
      outputLabel.text = runningValue
      outputLabl.text = outputLabel.text
    } else {
      if runningValue.count <= 8  {
        runningValue += "."
        outputLabel.text = runningValue
        outputLabl.text = outputLabel.text
      }
    }
    
  }
  
// function for equal operation
  @IBAction func equalsPressed (_ sender: RoundButton) {
    operation(operation: currentOperation)
  }
  
// percentage function
  @IBAction func percentagePressed (_ sender: RoundButton) {
    operation(operation: .Percentage)
  }
  
  
// Block of code for the whole calculator operation
  func operation(operation: OperationHandler){
    if currentOperation != .Null {
      if runningValue != "" {
        rightValue = runningValue
        runningValue = ""
        
// conditions for operation
        if currentOperation == .Addition {
          result = "\(Double(leftValue)! + Double(rightValue)!)"
        }else if currentOperation == .Subtraction {
          result = "\(Double(leftValue)! - Double(rightValue)!)"
        }else if currentOperation == .Multiplication {
          result = "\(Double(leftValue)! * Double(rightValue)!)"
        }else if currentOperation == .Division{
          result = "\(Double(leftValue)! / Double(rightValue)!)"
        }else if currentOperation == .Percentage{
          result = "\(Double(leftValue)! * 0.01 )"
        }
        leftValue = result
        if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0 ){
          result = "\(Int(Double(result)!))"
        }
        outputLabel.text = result
        outputLabl.text = outputLabel.text
      }
      currentOperation =  operation
    }else {
      leftValue = runningValue
      runningValue = ""
      currentOperation = operation
    }
    
  }
}
