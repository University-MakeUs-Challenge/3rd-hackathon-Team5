//
//  RealmService.swift
//  Client
//
//  Created by 홍준혁 on 2022/11/13.
//
import Foundation
import RealmSwift
import Realm

class RealmService{
    
    let localRealm = try! Realm()
    
    func addUserInSignUp(name:String,email:String,password:String) {
        let user = User(name: name, email: email, password: password)
        try! localRealm.write {
            localRealm.add(user)
        }
        print("add")
    }
    
    func delete(deleteId:String) {
        try! localRealm.write{
        }
        print("deleted")
    }
    
    func readDB(){
        let user = localRealm.objects(User.self)
        print(user)
    }

        
    // 스키마 수정 시 해야한다
    func resetDB(){
        let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
        let realmURLs = [
          realmURL,
          realmURL.appendingPathExtension("lock"),
          realmURL.appendingPathExtension("note"),
          realmURL.appendingPathExtension("management")
        ]

        for URL in realmURLs {
          do {
            try FileManager.default.removeItem(at: URL)
          } catch {
            // handle error
          }
        }
    }
    
    init() {
        print("Realm Location: ", localRealm.configuration.fileURL ?? "cannot find location.")
    }

}
