
import UIKit

@IBDesignable class ClockView: UIView {
    
    var isSetuped = false
    
    var markerSize = CGFloat(4)
    var markerLenhth = CGFloat(12)
    var markerColor = UIColor.green
    
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    
    private let hourLine = UIView()
    private let minuteLine = UIView()
    private let secondLine = UIView()
    
    private let roundedView = UIView()
    var roundedViewColor = UIColor.black
    
    
    @IBInspectable var hourLineSize:CGFloat = 8{
        didSet{layoutIfNeeded()}}
    
    var hourLineOffset = CGFloat(20)
    
    @IBInspectable var hourLineColor = UIColor.black{
        didSet{
            hourLine.backgroundColor = hourLineColor
            layoutIfNeeded()}}
    
    @IBInspectable var minuteLineSize:CGFloat = 4{
        didSet{layoutIfNeeded()}}
    var minuteLineOffset = CGFloat(10)
    @IBInspectable var minuteLineColor = UIColor.darkGray{
        didSet{
            minuteLine.backgroundColor = minuteLineColor
        }
    }
    
    @IBInspectable var secondLineSize:CGFloat = 2{
        didSet{layoutIfNeeded()}}
    var secondLineOffset = CGFloat(0)
    @IBInspectable var secondLineColor = UIColor.red{
        didSet{
            secondLine.backgroundColor = secondLineColor
        }
    }
    
    
    var hours = CGFloat(2){
        didSet {updateHours()}}
    var minutes = CGFloat(15){
        didSet {updateMinutes()}}
    var seconds = CGFloat(30){
        didSet {updateSeconds()}}
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        let w = frame.size.width
        let h = frame.size.height
        
        hourLine.frame = CGRect(x: w / 2 - hourLineSize / 2 , y: hourLineOffset, width: hourLineSize, height: h/2-hourLineOffset)
//        hourLine.backgroundColor = hourLineColor
        
        minuteLine.frame = CGRect(x: w / 2 - minuteLineSize / 2 , y: minuteLineOffset, width: minuteLineSize, height: h/2 - minuteLineOffset)
//        minuteLine.backgroundColor = minuteLineColor
        
        secondLine.frame = CGRect(x: w / 2 - secondLineSize / 2 , y: secondLineOffset, width: secondLineSize, height: h/2-secondLineOffset)
//        secondLine.backgroundColor = secondLineColor
        
        
        roundedView.frame = CGRect(x: w/2-10, y: h/2-10, width: 20, height: 20)
        roundedView.backgroundColor = roundedViewColor
        roundedView.layer.cornerRadius = roundedView.frame.height/2
        
        updateHours()
        updateMinutes()
        updateSeconds()
        
        topMarker.frame = CGRect(x: w / 2 - markerSize/2 , y: 0, width: markerSize, height: markerLenhth)
        leftMarker.frame = CGRect(x: 0, y: h/2 - markerSize/2, width: markerLenhth, height: markerSize)
        rightMarker.frame = CGRect(x: w-markerLenhth, y: h/2 - markerSize/2, width: markerLenhth, height: markerSize)
        bottomMarker.frame = CGRect(x: w/2-markerSize/2, y: h-markerLenhth, width: markerSize, height: markerLenhth)
        
        
        for v in [topMarker, leftMarker, rightMarker, bottomMarker]{
            v.backgroundColor = markerColor}
        
        layer.cornerRadius = frame.size.width/2
        
        if isSetuped { return }
        isSetuped = true
        
        for v in [topMarker, leftMarker, rightMarker, bottomMarker, hourLine, minuteLine, secondLine, roundedView]{
            addSubview(v)
            
        }
    }
    
    func updateHours(){
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    func updateMinutes(){
        let angle = CGFloat.pi * 2 * (minutes / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    func updateSeconds(){
        let angle = CGFloat.pi * 2 * (seconds / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: angle)
    }
}
