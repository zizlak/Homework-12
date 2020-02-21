
import UIKit

protocol SegmentControlViewDelegate: NSObjectProtocol {
    func buttom1Pressed(_ testView: SegmentControlView)
//    func buttom2Pressed(_ testView: SegmentControlView)
    
}

class SegmentControlView: UIView {
//    var isSetuped = false
    
    weak var delegate: SegmentControlViewDelegate?

    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func button1(_ sender: Any) {
        delegate?.buttom1Pressed(self)
    }
    
    @IBAction func buttom2(_ sender: Any) {
  //      delegate?.buttom2Pressed(self)
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        if isSetuped{return}
//        isSetuped = true
//}
    
    static func loadFromNIB() -> SegmentControlView{
        let nib = UINib(nibName: "SegmentControlView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! SegmentControlView
    }
}
