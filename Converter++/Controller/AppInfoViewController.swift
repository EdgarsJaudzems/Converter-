//
//  AppInfoViewController.swift
//  Converter++
//
//  Created by Edgars Jaudzems on 11/02/2021.
//

import UIKit

class AppInfoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    
    var infoText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        if !infoText.isEmpty {
            appDescLabel.text = infoText
        }

    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
