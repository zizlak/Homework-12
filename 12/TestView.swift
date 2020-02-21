
import UIKit

protocol TestViewDelegate:NSObjectProtocol {
    func firstButtonPressed(_ testView: TestView)
    func secondButtonPressed(_ testView: TestView)
}

@IBDesignable class TestView: UIView {
    var isSetuped = false

    weak var delegate: TestViewDelegate?
    
    @IBInspectable var colorBorder:UIColor = UIColor.red {
        didSet {
            self.layer.borderColor = colorBorder.cgColor
            layoutIfNeeded()}
    }
    
    @IBInspectable var colorSelected:UIColor = UIColor.lightGray {
        didSet {layoutIfNeeded()}
        }

    var colorDeselected: UIColor = UIColor.white

    @IBOutlet weak var testStackView: UIStackView!

    @IBOutlet weak var firstbuttonOutlet: UIButton!
    
    @IBOutlet weak var secondButtonOutlet: UIButton!
    @IBAction func firstButton(_ sender: Any) {
        UIView.animate(withDuration: 0.6, animations: {
            self.firstbuttonOutlet.backgroundColor = self.colorSelected
            self.secondButtonOutlet.backgroundColor = self.colorDeselected
            })
        delegate?.firstButtonPressed(self)
    }
    
    @IBAction func secondButton(_ sender: Any) {
        UIView.animate(withDuration: 0.6, animations: {
            self.secondButtonOutlet.backgroundColor = self.colorSelected
            self.firstbuttonOutlet.backgroundColor = self.colorDeselected
        })
        delegate?.secondButtonPressed(self)
    }
    
    
    static func loadFromNIB() -> TestView{
        let nib = UINib(nibName: "TestView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! TestView
    }
}
