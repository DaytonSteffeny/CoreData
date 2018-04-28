//
//  SingleSiteViewController.swift
//  Core Data Project
//
//  Created by Dayton Steffeny on 4/27/18.
//  Copyright © 2018 Dayton Steffeny. All rights reserved.
//

import UIKit

class SingleSiteViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var summaryTextField: UITextView!
    var existingWebsite:Website?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        urlTextField.delegate = self
        summaryTextField.delegate = self
        
        nameTextField.text = existingWebsite?.name
        urlTextField.text = existingWebsite?.url
        summaryTextField.text = existingWebsite?.summary
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        urlTextField.resignFirstResponder()
        summaryTextField.resignFirstResponder()
    }

    @IBAction func saveWebsite(_ sender: Any) {
        let name = nameTextField.text
        let url = urlTextField.text
        let summary = summaryTextField.text
        
        var website:Website?
        
        if let existingWebsite = existingWebsite{
            existingWebsite.name = name
            existingWebsite.summary = summary
            existingWebsite.url = url
            
            website = existingWebsite
        }else{
            website = Website(name: name, url: url, summary: summary)
        }
        
        if let website = website {
            do {
                let managedContext = website.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("Context could not be saved.")
            }
        }
    }
}

extension SingleSiteViewController: UITextViewDelegate {
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
}

extension SingleSiteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
