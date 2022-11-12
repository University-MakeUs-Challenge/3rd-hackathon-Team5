//
//  User.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//

import RealmSwift
import Realm
import Foundation

class User:Object{
    @Persisted var name:String = ""
    @Persisted var email:String = ""
    @Persisted var password:String = ""
    
    override static func primaryKey() -> String? {
      return "email"
    }
    
    convenience init(name:String,email:String,password:String){
        self.init()
        self.name = name
        self.email = email
        self.password = password
    }
}
