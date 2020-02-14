//
//  User+CoreDataProperties.swift
//  JSONParsingNew
//
//  Created by Felix 12 on 23/01/20.
//  Copyright © 2020 Felix-IT. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: Int32
    @NSManaged public var website: String?

}
