# JMCRatingControl
Custom control that can be used as a rating for any kind of content.

<h3>Usage:</h3>
* Create a copy of JMCRatingControl.swift to your project
* Open a storyboard and add an UIView to the screen
* Change it's class to RectangleRatingView or StarRatingView
* Use the storyboard to control number of displayed buttons
* Use the storyboard to control if the view will have a single selection mode or multipple


<h3>Extending</h3>
<p>You can create your own buttons if needed. To do it create a subclass of SelectButton class and a JMCRatingView </p>
<p>Subclassing button example: </p>

```Swift
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
```
<p>The only thing you have to do in a JMCRatingView's subclass is to register which Class will be used to display the button </p>


```Swift
/**Displays rectangles with numbers */
class RectangleRatingView:JMCRatingView {
    /**Override the setup view to specify the type of button you want to use in the application*/
    override  func setupView() {
        //Set the button type
        self.clazz = StarButton.self
        super.setupView()
    }
}
```


Enjoy it!


<h3>License</h3>
GNU General Public License V3
