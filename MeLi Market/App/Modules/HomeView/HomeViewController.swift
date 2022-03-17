//
//  ViewController.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 13-03-22.
//

import UIKit

protocol HomeViewLogic: AnyObject {
    func presentViewController(vc: UIViewController)
}

class HomeViewController: UIViewController {
    var searchText = ""
    var presenter : HomePresenterLogic = HomePresenter()
    
    @IBOutlet var searchTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       }

       @objc func keyboardWillShow(notification: NSNotification) {
           if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
               if self.view.frame.origin.y == 0 {
                   self.view.frame.origin.y -= (keyboardSize.height/2)
               }
           }
       }

       @objc func keyboardWillHide(notification: NSNotification) {
           if self.view.frame.origin.y != 0 {
               self.view.frame.origin.y = 0
           }
       }


       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }

    @IBAction func searchEndEditing(_ sender: Any) {
        searchText =  searchTextField.text ?? ""
        presenter.model.items = nil
    }
    
    @IBAction func goToListView(_ sender: Any) {
        if searchTextField.text != "" {
            presenter.goSearch(searchText: searchTextField.text ?? "", fromView: self)
        } else {
            let dialogMessage = UIAlertController(title: NSLocalizedString("Really", comment: ""),
                                                  message: NSLocalizedString("ForgotSearch", comment: ""), preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
             dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
}
