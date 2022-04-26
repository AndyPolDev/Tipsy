import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var ratio: Float = 0.1
    var stepperValue: Float = 2
    var result = Float()
    
    @IBAction func tipChangedButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            ratio = 0.0
        } else if sender.currentTitle == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            ratio = 0.1
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            ratio = 0.2
        }
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        stepperValue = Float(sender.value)
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        if bill != "" {
            
            result = (Float(bill)! * ratio) / stepperValue
            print(String(format: "%.2f", result))
            
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalResult = result
            destinationVC.ratio = ratio
            destinationVC.numberOfMan = stepperValue
            
        }
    }
    
}

