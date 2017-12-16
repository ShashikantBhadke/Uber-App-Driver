//
//  AuthProvider.swift
//  Uber App For Driver
//
//  Created by Trupti Karale on 16/12/17.
//  Copyright © 2017 Ankita Chordia. All rights reserved.
//
import UIKit
import Foundation
import FirebaseAuth

typealias LoginHandler = (_ msg: String?) -> Void
struct LoginErrorCode {
    static let INVALID_EMAIL = "Invalid Email Address, Please Provid A Real Email Address"
    static let WRONG_PASSWORD = "Invalid Email Address, Please Provid A Real Email Address"
    static let PROBLEM_CONNECTING = "Problem Connecting To Database"
    static let USER_NOT_FOUND = "User Not Found, Please Register"
    static let EMAIL_ALREADY_IN_USE = "Email Address In Use, Please Use Another Email"
    static let WEAK_PASSWORD = "Password Should Be At Least 6 Characters Long"
    
}

class AuthProvider {
    private static let _instance = AuthProvider()
    
    static var Instance: AuthProvider{
        return _instance
    }
    //MARK:-Login Handler
    func login(withEmail: String, password: String, loginHandler: LoginHandler?){
        Auth.auth().signIn(withEmail: withEmail, password: password, completion: { (user, err) in
            if err != nil{
                self.handleErrors(err: err! as NSError, loginHandler: loginHandler)
            }else{
                loginHandler?(nil)
            }
        })
    }
    
    //MARK:-SignUp Handler
    func signUp(withEmail: String, password: String,signUpHandler: LoginHandler?){
        
        Auth.auth().createUser(withEmail: withEmail, password: password, completion: { (user, err) in
            if err != nil{
                print(err!)
                self.handleErrors(err: err as! NSError, loginHandler: signUpHandler)
            }else{
                if user?.uid != nil{
                    self.login(withEmail: withEmail, password: password, loginHandler: signUpHandler)
                }
            }
        })
    }
    
    //MARK:-LogOut Handler
    func logOut() -> Bool{
        if Auth.auth().currentUser != nil{
            do{
                try Auth.auth().signOut()
                return true
            } catch{
                return false
            }
            
        }
        return true
    }
    
    //MARK:-Error Handler
    private func handleErrors(err: NSError, loginHandler: LoginHandler?){
        
        if let errCode = AuthErrorCode(rawValue: err.code){
         
            switch errCode{
            case .wrongPassword:
                loginHandler?(LoginErrorCode.WRONG_PASSWORD)
                break
            case .invalidEmail:
                loginHandler?(LoginErrorCode.INVALID_EMAIL)
                break
            case .userNotFound:
                loginHandler?(LoginErrorCode.USER_NOT_FOUND)
                break
            case .emailAlreadyInUse:
                loginHandler?(LoginErrorCode.EMAIL_ALREADY_IN_USE)
                break
            case .weakPassword:
                loginHandler?(LoginErrorCode.WEAK_PASSWORD)
                break
            default:
                break
                
            }
        }
    }
    
    
    
}//class



































