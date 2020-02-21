

import UIKit

@IBDesignable class ButtonView: UIView {
    var isSetuped = false
    
    private let button = UIButton(type: .system)
    
    var buttonColor: UIColor = .yellow
    @IBInspectable var buttonBorderWidth: CGFloat = 4 {
        didSet {layoutIfNeeded()}}
    
    @IBInspectable var borderColor:UIColor = UIColor.red {
        didSet {
            button.layer.borderColor = borderColor.cgColor
            layoutIfNeeded()}
    }
    
    @IBInspectable var radius: CGFloat = 20 {
        didSet {
            button.layer.cornerRadius = radius
            layoutIfNeeded()}}
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        button.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        button.backgroundColor = buttonColor
        button.titleLabel!.textColor = UIColor.black

        button.setTitle("My Button", for: UIControl.State.normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = buttonBorderWidth


        
        if isSetuped{return}
        isSetuped = true
        
        addSubview(button)
    }
}
