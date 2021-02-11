//
//  ViewController.swift
//  Converter++
//
//  Created by Edgars Jaudzems on 11/02/2021.
//

import UIKit

class DayFinderViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findButton.layer.cornerRadius = 20
    }

    @IBAction func findWeekDayTapped(_ sender: Any) {
        // Calendar
        let calendar = Calendar.current
       
        // Date component
        var dateComponents = DateComponents()
        
        guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!)  else {
            //Alert
            warningPopup(withTitle: "Input error", withMessage: "Date fields can't be empty.")
            return
        }
        
        // Date components = daytextfield.text
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        // Calendar.date(from: dateComponents)
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        
        // Date Formater()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        // Find button
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                let weekday = dateFormatter.string(from: date)
                let capitalizedWeekday = weekday.capitalized
                
                // Result
                resultLabel.text = capitalizedWeekday
            } else {
                // Alert
                warningPopup(withTitle: "Wrong date", withMessage: "Enter correct date.")
            }
        default:
            findButton.setTitle("Find", for: .normal)
            clearAllTextFields()
        }

    }
    
    func clearAllTextFields() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Day of the week, inside finder"
    }

    // Ja pieskaras ekranam, kur nav aktivi elementi, klaviatura aizversies
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    // Warning PopUp Alert
    func warningPopup(withTitle title: String?, withMessage message: String?) {
        DispatchQueue.main.async {
            let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            popUp.addAction(okButton)
            self.present(popUp, animated: true, completion: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infoPageDayFinder" {
            // Get the new view controller using segue.destination.
            let vc = segue.destination as! AppInfoViewController
            // Pass the selected object to the new view controller.
            vc.infoText = "DayFinder helps to find \nexact weekday for given date"
        }

    }
}

