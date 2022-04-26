import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalResult = Float()
    var numberOfMan = Float()
    var ratio = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", totalResult)
        settingsLabel.text = "Split between \(Int(numberOfMan)), with \(Int(ratio * 100))% tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
