//
//  ViewController.swift
//  Calculator
//
//  Created by Taylor Mott on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stack = Stack()
    var topSpaceFill = UILabel()
    var topMiddleSpaceFill = UILabel()
    var calcLabel = UILabel()
    var isStillTyping = false
    var displayNumbers: Float {
        get {
            let text = calcLabel.text ?? "0"
            return (text as NSString).floatValue
        }
        set {
            calcLabel.text = "\(newValue)"
            isStillTyping = false
        }
    }
    
    
    var zeroButton = UIButton()
    var oneButton = UIButton()
    var twoButton = UIButton()
    var threeButton = UIButton()
    var fourButton = UIButton()
    var fiveButton = UIButton()
    var sixButton = UIButton()
    var sevenButton = UIButton()
    var eightButton = UIButton()
    var nineButton = UIButton()
    var divideButton = UIButton()
    var multiplyButton = UIButton()
    var subtractButton = UIButton()
    var addButton = UIButton()
    var enterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpNumberButtons(zeroButton, number: 0)
        setUpNumberButtons(oneButton, number: 1)
        setUpNumberButtons(twoButton, number: 2)
        setUpNumberButtons(threeButton, number: 3)
        setUpNumberButtons(fourButton, number: 4)
        setUpNumberButtons(fiveButton, number: 5)
        setUpNumberButtons(sixButton, number: 6)
        setUpNumberButtons(sevenButton, number: 7)
        setUpNumberButtons(eightButton, number: 8)
        setUpNumberButtons(nineButton, number: 9)
        setUpMathOperatorButtons(divideButton, mathOperator: "\u{00F7}")
        setUpMathOperatorButtons(multiplyButton, mathOperator: "x")
        setUpMathOperatorButtons(subtractButton, mathOperator: "-")
        setUpMathOperatorButtons(addButton, mathOperator: "+")
        setUpEnterButton()
        setUpCalcLabel(topSpaceFill)
        setUpCalcLabel(topMiddleSpaceFill)
        setUpCalcLabel(calcLabel)
        setUpStackViews()
        calcLabel.text = "0"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpCalcLabel(label: UILabel) {
        label.textAlignment = .Right
        label.textColor = .whiteColor()
        label.backgroundColor = .blackColor()
        label.font = UIFont.systemFontOfSize(50)
    }
    
    func setUpEnterButton() {
        enterButton.setTitle("\u{21B5}", forState: .Normal)
        enterButton.setTitleColor(.whiteColor(), forState: .Normal)
        enterButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        enterButton.backgroundColor = UIColor.darkGrayColor()
        enterButton.layer.borderColor = UIColor.blackColor().CGColor
        enterButton.layer.borderWidth = 2
        enterButton.addTarget(self, action: "enterButtonTapped", forControlEvents: .TouchUpInside)
    }
    
    func setUpNumberButtons(button: UIButton, number: Int) {
        button.setTitle("\(number)", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.lightGrayColor()
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(25)
        button.layer.borderColor = UIColor.blackColor().CGColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: "numberPressed", forControlEvents: .TouchUpInside)
    }
    
    func setUpMathOperatorButtons(button: UIButton, mathOperator: String) {
        button.setTitle("\(mathOperator)", forState: .Normal)
        button.setTitleColor(.whiteColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(25)
        button.backgroundColor = UIColor.orangeColor()
        button.layer.borderColor = UIColor.blackColor().CGColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: "operate", forControlEvents: .TouchUpInside)
    }
    
    func setUpStackViews() {
    
        
        let bottomRightStackView = UIStackView(arrangedSubviews: [enterButton, addButton])
        let bottomStackView = UIStackView(arrangedSubviews: [zeroButton, bottomRightStackView])
        let bottomMiddleStackView = UIStackView(arrangedSubviews: [oneButton, twoButton, threeButton, subtractButton])
        let middleStackView = UIStackView(arrangedSubviews: [fourButton, fiveButton, sixButton, multiplyButton])
        let topMiddleStackView = UIStackView(arrangedSubviews: [sevenButton, eightButton, nineButton, divideButton])
        let thirdMainStackView = UIStackView(arrangedSubviews: [bottomMiddleStackView, bottomStackView])
        let secondMainStackView = UIStackView(arrangedSubviews: [topMiddleStackView, middleStackView])
        //let secondMainStackView = UIStackView(arrangedSubviews: [topMiddleStackView, middleStackView, bottomMiddleStackView, bottomStackView])
        let labelStackView = UIStackView(arrangedSubviews: [topSpaceFill, topMiddleSpaceFill, calcLabel])
        let mainStackView = UIStackView(arrangedSubviews: [labelStackView, secondMainStackView, thirdMainStackView])
        //let mainStackView = UIStackView(arrangedSubviews: [calcLabel, secondMainStackView])
        
        mainStackView.frame = view.frame
        mainStackView.axis = .Vertical
        mainStackView.distribution = .FillEqually
        mainStackView.alignment = .Fill
        
        labelStackView.axis = .Vertical
        labelStackView.distribution = .FillEqually
        labelStackView.alignment = .Fill
        
        secondMainStackView.axis = .Vertical
        secondMainStackView.distribution = .FillEqually
        secondMainStackView.alignment = .Fill
        
        thirdMainStackView.axis = .Vertical
        thirdMainStackView.distribution = .FillEqually
        thirdMainStackView.alignment = .Fill
        
        topMiddleStackView.axis = .Horizontal
        topMiddleStackView.distribution = .FillEqually
        topMiddleStackView.alignment = .Fill
        
        middleStackView.axis = .Horizontal
        middleStackView.distribution = .FillEqually
        middleStackView.alignment = .Fill
        
        bottomMiddleStackView.axis = .Horizontal
        bottomMiddleStackView.distribution = .FillEqually
        bottomMiddleStackView.alignment = .Fill
  
        bottomStackView.axis = .Horizontal
        bottomStackView.distribution = .FillEqually
        bottomStackView.alignment = .Fill
     
        bottomRightStackView.axis = .Horizontal
        bottomRightStackView.distribution = .FillEqually
        bottomRightStackView.alignment = .Fill
        
        calcLabel.translatesAutoresizingMaskIntoConstraints = false
        secondMainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //let constraint = NSLayoutConstraint(item: calcLabel, attribute: .Height, relatedBy: .Equal, toItem: secondMainStackView, attribute: .Height, multiplier: 0.5, constant: 0)
    
        view.addSubview(mainStackView)
        //view.addConstraint(constraint)
    }
    
    func numberPressed(button: UIButton) {
        guard let digit = button.currentTitle else { return }
        
        if isStillTyping {
            let displayText = calcLabel.text ?? ""
            calcLabel.text = displayText + digit
        } else {
            calcLabel.text = digit
            isStillTyping = true
        }
    }
    
    func enterButtonTapped() {
        isStillTyping = false
        stack.push(displayNumbers)
        stack.log()
    }
    
    func operate(button: UIButton) {
        guard let operation = button.currentTitle else { return }
        
        if isStillTyping {
            enterButtonTapped()
        }
        
        if stack.count() >= 2{
            let float1 = stack.pop()!
            let float2 = stack.pop()!
            
            switch operation {
            case "\u{00F7}": displayNumbers = float2 / float1
            case "x": displayNumbers = float2 * float1
            case "-": displayNumbers = float2 - float1
            case "+": displayNumbers = float2 + float1
            default: stack.push(float1)
                     stack.push(float2)
            }
            
            enterButtonTapped()
        }
    }
    
}