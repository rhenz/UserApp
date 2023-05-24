//
//  AddUserViewModel.swift
//  UserApp
//
//  Created by John Salvador on 5/23/23.
//

import Foundation

final class AddUserViewModel: ObservableObject {
   
   // MARK: - Types
   
   enum State {
      case initial
      case successAddingNewUser
      case error(message: String)
   }
   
   // MARK: - Properties
   
   @Published var firstName: String = ""
   @Published var lastName: String = ""
   @Published var dateOfBirth: Date
   @Published private(set) var state: State = .initial
   
   private let nameValidator: NameValidator
   private let minMaxDateProvider: MinMaxDateProvider
   
   // MARK: - Init
   
   init(nameValidator: NameValidator = DefaultNameValidator(),
        minMaxDateProvider: MinMaxDateProvider = DefaultMinMaxDateProvider())
   {
      self.nameValidator = nameValidator
      self.minMaxDateProvider = minMaxDateProvider
      self.dateOfBirth = minMaxDateProvider.maximumDate
   }
   
   
   // MARK: - Public API
   
   var minimumDate: Date {
      minMaxDateProvider.minimumDate
   }
   
   var maximumDate: Date {
      minMaxDateProvider.maximumDate
   }
   
   var alertErrorTitle: String {
      "Error"
   }
   
   var addButtonTitle: String {
      "Add"
   }
   
   var firstNamePlaceholder: String {
      "First Name"
   }
   
   var lastNamePlaceholder: String {
      "Last Name"
   }
   
   func addUser(for viewModel: MainViewModel) {
      
      guard validateFirstNameAndLastName() else {
         state = .error(message: "Invalid First Name or Last Name")
         return
      }
      
      let user = User(firstName: firstName,
                      lastName: lastName,
                      dateOfBirth: dateOfBirth)
      
      viewModel.addNewUser(user)
      state = .successAddingNewUser
   }
   
   func validateFirstNameAndLastName() -> Bool {
      return nameValidator.validate(firstName) && nameValidator.validate(lastName)
   }
}
