//
//  User.swift
//  UserApp
//
//  Created by John Salvador on 5/23/23.
//

import Foundation

struct User: Identifiable {
   var id = UUID()
   var firstName: String
   var lastName: String
   var dateOfBirth: Date
   var creationDate: Date = Date()
}
