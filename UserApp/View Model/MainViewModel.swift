//
//  MainViewModel.swift
//  UserApp
//
//  Created by John Salvador on 5/23/23.
//

import Foundation

final class MainViewModel: ObservableObject {
   
   // MARK: - Properties
   
   @Published private(set) var users: [User] = []
   @Published private(set) var lastAddeduser: User?
   
   private(set) var usersPreviouslySorted: Bool = false
   
   
   // MARK: - Public API
   
   var descendingIcon: String {
      "arrow.up.circle"
   }
   
   var ascendingIcon: String {
      "arrow.down.circle"
   }
   
   var addNewUserIcon: String {
      "plus.app.fill"
   }
   
   var navigationTitle: String {
      "Users"
   }
   
   var firstNamePlaceholder: String {
      "First Name"
   }
   
   var lastNamePlaceholder: String {
      "Last Name"
   }
   
   var dateOfBirthPlaceholder: String {
      "Date Of Birth"
   }
   
   func addNewUser(_ user: User) {
      users.append(user)
      lastAddeduser = user
   }
   
   func sortByDateCreated() {
      users.sort { $0.creationDate < $1.creationDate }
      usersPreviouslySorted = false
   }
   
   func sortAscending() {
      users.sort { $0.lastName < $1.lastName}
      usersPreviouslySorted = true
   }
   
   func sortDescending() {
      users.sort { $0.lastName > $1.lastName}
      usersPreviouslySorted = true
   }
   
   func formattedDate(for user: User) -> String {
      user.dateOfBirth.formatted(date: .complete, time: .omitted)
   }
   
   func getUserFullName(_ user: User) -> String {
      return "\(user.firstName) \(user.lastName)"
   }
}
