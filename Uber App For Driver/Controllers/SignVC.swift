//
//  SignVC.swift
//  Uber App For Driver
//
//  Created by Trupti Karale on 16/12/17.
//  Copyright © 2017 Ankita Chordia. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignVC: UIViewController {

    private let DRIVER_SEGUE = "DriverVC"
    
    @IBOutlet var email_tf: UITextField!
    @IBOutlet var password_tf: UITextField!
    
    @IBOutlet var login_btn: UIButton!
    @IBOutlet var signUp_btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func login_Btn_Clicked(_ sender: UIButton) {
        
        if checkBothFieldsArePresent(){
           let vc = self
            AuthProvider.Instance.login(withEmail: email_tf.text!, password: password_tf.text!, loginHandler: { (msg) in
                if msg != nil{
                    showAlert(title: "Login Error!", msg: msg!, viewController: vc)
                }else{
                    showAlertWithOkAction(viewController: self, ok_handler: {
                            self.performSegue(withIdentifier: self.DRIVER_SEGUE, sender: self)
                    })
                }
            })
        }else{
            showAlert(title: "Error", msg: "Please enter valid details", viewController: self)
        }
    }
    
    @IBAction func signUp_Btn_Clicked(_ sender: UIButton) {
        
        if isValidEmail(testStr: email_tf.text!) && checkBothFieldsArePresent(){
            AuthProvider.Instance.signUp(withEmail: email_tf.text!, password: password_tf.text!, signUpHandler: { (msg) in
                if msg != nil{
                    showAlert(title: "Problem With Creating  A New User", msg: msg!, viewController: self)
                }else{
                    showAlertWithOkAction(viewController: self, ok_handler: {
                        self.performSegue(withIdentifier: self.DRIVER_SEGUE, sender: self)
                    })
                }
            })
            
        }else{
            showAlert(title: "Error", msg: "Please enter valid details", viewController: self)
        }
    }
    
    //MARK:- Validations
    func checkBothFieldsArePresent() -> Bool{
        var flag = false
        if email_tf.text! != "" && password_tf.text! != ""{
            flag = true
        }
        return flag
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    
}//class

















