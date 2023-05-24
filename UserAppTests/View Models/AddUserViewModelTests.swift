//
//  AddUserViewModelTests.swift
//  UserAppTests
//
//  Created by John Salvador on 5/25/23.
//

import XCTest
@testable import UserApp

final class AddUserViewModelTests: XCTestCase {
   
   // MARK: - Properties
   
   var viewModel: AddUserViewModel!
   var nameValidator: DefaultNameValidator!
   var minMaxDateProvider: MinMaxDateProvider!
   
   // MARK: - Setup
   
   override func setUpWithError() throws {
      // Put setup code here. This method is called before the invocation of each test method in the class.
      viewModel = AddUserViewModel()
      nameValidator = DefaultNameValidator()
      minMaxDateProvider = DefaultMinMaxDateProvider()
   }
   
   override func tearDownWithError() throws {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      viewModel = nil
      nameValidator = nil
      minMaxDateProvider = nil
   }
   
   // MARK: - Tests
   
   func test_initialState() {
      XCTAssertEqual(viewModel.firstName, "")
      XCTAssertEqual(viewModel.lastName, "")
      XCTAssertEqual(viewModel.dateOfBirth, minMaxDateProvider.maximumDate)
      XCTAssertEqual(viewModel.state, .initial)
   }
   
   func test_minimumDate() {
      XCTAssertEqual(viewModel.minimumDate, minMaxDateProvider.minimumDate)
   }
   
   func test_maximumDate() {
      XCTAssertEqual(viewModel.maximumDate, minMaxDateProvider.maximumDate)
   }
   
   func test_alertErrorTitle() {
      XCTAssertEqual(viewModel.alertErrorTitle, "Error")
   }
   
   func test_addButtonTitle() {
      XCTAssertEqual(viewModel.addButtonTitle, "Add")
   }
   
   func test_firstNamePlaceholder() {
      XCTAssertEqual(viewModel.firstNamePlaceholder, "First Name")
   }
   
   func test_lastNamePlaceholder() {
      XCTAssertEqual(viewModel.lastNamePlaceholder, "Last Name")
   }
   
   func test_addUserSuccess() {
      // Arrange
      let user = User(firstName: "John", lastName: "Salvador", dateOfBirth: Date())
      let mainViewModel = MainViewModel()
      
      // Act
      viewModel.firstName = user.firstName
      viewModel.lastName = user.lastName
      viewModel.dateOfBirth = user.dateOfBirth
      viewModel.addUser(for: mainViewModel)
      
      // Assert
      XCTAssertEqual(mainViewModel.users[0].firstName, user.firstName)
      XCTAssertEqual(mainViewModel.users[0].lastName, user.lastName)
      XCTAssertEqual(mainViewModel.users[0].dateOfBirth, user.dateOfBirth)
      XCTAssertEqual(viewModel.state, .successAddingNewUser)
   }
   
   func test_addUserFailure() {
         // Arrange
         let mainViewModel = MainViewModel()
         
         // Act
         viewModel.firstName = "John"
         viewModel.lastName = "123"
         viewModel.addUser(for: mainViewModel)
         
         // Assert
         XCTAssertEqual(viewModel.state, .error(message: "Invalid First Name or Last Name"))
      }
}
