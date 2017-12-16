//
//  UserData.swift
//  Uber App For Driver
//
//  Created by Trupti Karale on 16/12/17.
//  Copyright © 2017 Ankita Chordia. All rights reserved.
//

import Foundation
class UserData{
    private var _email_Address = ""
    private var _password = ""
    
    var email_ID: String{
        get{
            return _email_Address
        }
        set{
            _email_Address = newValue
        }
    }
    
    var password: String{
        get{
            return _password
        }
        set{
            _password = newValue
        }
    }
}//class





