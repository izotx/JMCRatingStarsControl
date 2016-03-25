//
//  JMCRatingControl.swift
//  ControlTest
//
//  Created by Janusz Chudzynski on 3/25/16.
//  Copyright © 2016 izotx. All rights reserved.
//

import UIKit


/**Displays rectangles with numbers */
class RectangleRatingView:JMCRatingView {
    /**Override the setup view to specify the type of button you want to use in the application*/
    override  func setupView() {
        //Set the button type
        self.clazz = RectangularButton.self
        super.setupView()
    }
}


/**Displays rectangles with numbers */
class StarRatingView:JMCRatingView {
    /**Override the setup view to specify the type of button you want to use in the application*/
    override  func setupView() {
        self.clazz = StarButton.self       
        super.setupView()
    }
}



/**Mother of all buttons displayed in a stack view*/
class SelectButton:UIView{
    var index:Int = 0{
        didSet(newValue){
            setupView()
        }
    }
    var selected:Bool = false{
        willSet(newValue) {
            setNeedsDisplay()
        }
        didSet(newValue){
            setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        drawShape(frame:self.bounds)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    func drawShape(frame frame: CGRect = CGRectMake(0, 0, 100, 100), selected:Bool = false) {
        
    }
    
    func setupView(){
        self.userInteractionEnabled = true
        self.backgroundColor = UIColor.clearColor()
    }
}

/**Rectangular button displaying it's index */
class RectangularButton:SelectButton{
    /**label will be displaying index*/
    let label = UILabel()
    
    override var selected:Bool{
        willSet(newValue) {
            setNeedsDisplay()
        }
        didSet(newValue){
            setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        drawShape(frame:self.bounds)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setupView() {
        backgroundColor = UIColor.clearColor()
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraintEqualToAnchor(centerXAnchor).active = true
        label.centerYAnchor.constraintEqualToAnchor(centerYAnchor).active = true
        label.widthAnchor.constraintEqualToAnchor(widthAnchor).active = true
        label.heightAnchor.constraintEqualToAnchor(widthAnchor).active = true
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        label.text = "\(self.index)"
    }
    
    
    override func drawShape(frame frame: CGRect = CGRectMake(0, 0, 100, 100), selected:Bool = false) {
        if(self.selected){
            label.backgroundColor = UIColor.lightGrayColor()
        }
        else{
            label.backgroundColor = UIColor.clearColor()
        }
    }
    
}


/**Star Button*/
class StarButton:SelectButton{
    
    
    override var selected:Bool{
        willSet(newValue) {
            setNeedsDisplay()
        }
        didSet(newValue){
            setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        drawShape(frame:self.bounds)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override func drawShape(frame frame: CGRect = CGRectMake(0, 0, 100, 100), selected:Bool = false) {
        
        //// Star Drawing
        let starPath = UIBezierPath()
        starPath.moveToPoint(CGPointMake(frame.minX + 0.50000 * frame.width, frame.minY + 0.00000 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.61481 * frame.width, frame.minY + 0.22284 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.85355 * frame.width, frame.minY + 0.14645 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.77716 * frame.width, frame.minY + 0.38519 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 0.50000 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.77716 * frame.width, frame.minY + 0.61481 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.85355 * frame.width, frame.minY + 0.85355 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.61481 * frame.width, frame.minY + 0.77716 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.50000 * frame.width, frame.minY + 1.00000 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.38519 * frame.width, frame.minY + 0.77716 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.14645 * frame.width, frame.minY + 0.85355 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.22284 * frame.width, frame.minY + 0.61481 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY + 0.50000 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.22284 * frame.width, frame.minY + 0.38519 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.14645 * frame.width, frame.minY + 0.14645 * frame.height))
        starPath.addLineToPoint(CGPointMake(frame.minX + 0.38519 * frame.width, frame.minY + 0.22284 * frame.height))
        starPath.closePath()
        
        if(self.selected){
            UIColor.yellowColor().setFill()
        }
        else{
            UIColor.blackColor().setFill()
        }
        
        starPath.fill()
    }
    
}



@IBDesignable class JMCRatingView:UIView {
    
    let stackView = UIStackView()
    var clazz: SelectButton.Type = SelectButton.self
    
   @IBInspectable var numberOfItems:Int = 5{
        didSet{
            setupView()
        }
    }
    
    
    @IBInspectable var singleSelection:Bool = false {
        didSet{
            setNeedsDisplay()
        }
    }
    
    /**Removes all stackviews*/
    func clearStackView(){
        for element in stackView.arrangedSubviews{
           stackView.removeArrangedSubview(element)
            if let _ = element.superview{
                element.removeFromSuperview()
            }
        }
    }
    
    /**Setup the stack view and it's arranged subviews*/
    func setupView(){
    
        userInteractionEnabled = true
    
        //setting up stackview
        stackView.axis = .Horizontal
        stackView.distribution = .FillEqually
        stackView.alignment = .Center
        stackView.spacing = 10
        
        clearStackView()
        
        //adding stars
        for index in 1...numberOfItems{
            let control = self.clazz.init()
            control.index = index
            control.translatesAutoresizingMaskIntoConstraints = false
            control.widthAnchor.constraintEqualToConstant(62).active = true
            control.heightAnchor.constraintEqualToConstant(62).active = true
            control.selected = false
            stackView.addArrangedSubview(control)
        }
        
        addSubview(stackView)
        stackView.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        stackView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let t = touches.first{
            processTouches(t)
        }
    }
    
    func processTouches(touch:UITouch){
        let point = touch.locationInView(self)
        for (index, element) in stackView.arrangedSubviews.enumerate(){
            element.setNeedsLayout()
            let elementFrame = CGRectOffset(element.frame, stackView.frame.origin.x, stackView.frame.origin.y)
            
            if elementFrame.contains(point){
                if singleSelection{
                    singleSelection((element as! SelectButton).index)
                }
                else{
                    selectControls(index)
                }
            }
        }
    }
    
    //Mark: Selections
    /**Multiple Selections*/
    func selectControls(count:Int){
        clearSelection()
        
        for element in stackView.arrangedSubviews{
            if (element as! SelectButton).index <= count + 1{
                (element as! SelectButton).selected = true
            }
        }
    }
    
    
    /**Multiple Selections*/
    func singleSelection(index:Int){
        clearSelection()
        
        let buttons =   stackView.arrangedSubviews.filter({
            let element = $0 as! SelectButton
            return element.index == index
        })
        if buttons.count > 0 {
            (buttons[0] as! SelectButton).selected = true
        }
    }
    
    func clearSelection(){
        for element in stackView.arrangedSubviews{
            (element as! SelectButton).selected = false
        }
    }
    
}

