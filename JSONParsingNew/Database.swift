//
//  Database.swift
//  JSONParsingNew
//
//  Created by Felix 12 on 23/01/20.
//  Copyright © 2020 Felix-IT. All rights reserved.
//

import Foundation
import UIKit
import CoreData
final class Database {
static let shared = Database()
var userArray = [User] ()
private init() {
    
}
func getContext() -> NSManagedObjectContext? {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return nil}
    
    let managedContext = appDelegate.persistentContainer.viewContext
    return managedContext
}
func saveUser(id: Int16, name: String, username: String, email: String, phone: Int32, website: String){
    let entity = NSEntityDescription.entity(forEntityName: "User", in: getContext()!)
    let user = NSManagedObject(entity: entity!, insertInto: getContext())
    user.setValue(id, forKey: "id")
    user.setValue(name, forKey: "name")
    user.setValue(username, forKey: "username")
    user.setValue(email, forKey: "email")
    user.setValue(phone, forKey: "phone")
    user.setValue(website, forKey: "website")
    do{
               try getContext()?.save()
           } catch {
               print("Not saved")
           }
}
func fetchUser() -> [User]? {
    
    let request = NSFetchRequest<User>(entityName: "User")
   
    do {
        let result = try getContext()!.fetch(request)
        userArray.removeAll()
        for user in result as [NSManagedObject]{
            userArray.append(user as! User)
        }
        print(userArray)
        return userArray
    } catch {
        print("something")
        return nil
    }
}
}
