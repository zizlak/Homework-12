
import UIKit


@IBDesignable class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let testView = TestView.loadFromNIB()
        testView.delegate = self
        view.addSubview(testView)
        testView.center = CGPoint(x: view.frame.width/2, y: view.frame.height - 150)
        
        testView.firstbuttonOutlet.backgroundColor = testView.colorSelected
        testView.secondButtonOutlet.backgroundColor = testView.colorDeselected
        
        testView.layer.borderWidth = 3

    }}

extension ViewController: TestViewDelegate{
    func firstButtonPressed(_ testView: TestView) {
        print("First Button Pressed")}
    func secondButtonPressed(_ testView: TestView) {
        print("Second Button Pressed")
    }
}

