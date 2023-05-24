//
//  MainViewModelTests.swift
//  UserAppTests
//
//  Created by John Salvador on 5/25/23.
//

import XCTest
@testable import UserApp

final class MainViewModelTests: XCTestCase {
   
   // MARK: - Properties
   
   var viewModel: MainViewModel!
   
   // MARK: - Setup
   
   override func setUpWithError() throws {
      // Put setup code here. This method is called before the invocation of each test method in the class.
      viewModel = MainViewModel()
   }
   
   override func tearDownWithError() throws {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      viewModel = nil
   }
   
   
   // MARK: - Tests
   
   func test_descendingIconImage() {
      assertImageEqual(viewModel.descendingIcon, "arrow.up.circle")
   }
   
   func test_ascendingIconImage() {
      assertImageEqual(viewModel.ascendingIcon, "arrow.down.circle")
   }
   
   func test_addNewUserIconImage() {
      assertImageEqual(viewModel.addNewUserIcon, "plus.app.fill")
   }
   
   func test_navigationBarTitle() {
      XCTAssertEqual(viewModel.navigationTitle, "Users")
   }
   
   func test_firstNamePlaceholder() {
      XCTAssertEqual(viewModel.firstNamePlaceholder, "First Name")
   }
   
   func test_lastNamePlaceholder() {
      XCTAssertEqual(viewModel.lastNamePlaceholder, "Last Name")
   }
   
   func test_dateOfBirthPlaceholder() {
      XCTAssertEqual(viewModel.dateOfBirthPlaceholder, "Date Of Birth")
   }
   
   func test_addNewUser() {
      let user = User(firstName: "John", lastName: "Salvador", dateOfBirth: Date())
      viewModel.addNewUser(user)
      XCTAssertEqual(viewModel.users.count, 1)
      XCTAssertEqual(viewModel.lastAddeduser, user)
   }
   
   func test_sortByDateCreated() {
      // Arrange
      let user1 = User(firstName: "John", lastName: "Catriona", dateOfBirth: Date())
      Thread.sleep(forTimeInterval: 0.5) // Add delay for date creation not to have same value
      let user2 = User(firstName: "Lucas", lastName: "Balboa", dateOfBirth: Date())
      Thread.sleep(forTimeInterval: 0.5) // Add delay for date creation not to have same value
      let user3 = User(firstName: "Angela", lastName: "Alvarez", dateOfBirth: Date())
      viewModel.addNewUser(user1)
      viewModel.addNewUser(user2)
      viewModel.addNewUser(user3)
      
      // Act
      viewModel.sortAscending()
      viewModel.sortByDateCreated()
      
      // Assert
      XCTAssertEqual(viewModel.users, [user1, user2, user3])
   }
   
   func test_sortAscending() {
      let user1 = User(firstName: "John", lastName: "Salvador", dateOfBirth: Date())
      let user2 = User(firstName: "Angela", lastName: "Frias", dateOfBirth: Date())
      viewModel.addNewUser(user1)
      viewModel.addNewUser(user2)
      viewModel.sortAscending()
      XCTAssertEqual(viewModel.users, [user2, user1])
   }
   
   func test_sortDescending() {
      let user1 = User(firstName: "John", lastName: "Salvador", dateOfBirth: Date())
      let user2 = User(firstName: "Angela", lastName: "Frias", dateOfBirth: Date())
      viewModel.addNewUser(user1)
      viewModel.addNewUser(user2)
      viewModel.sortDescending()
      XCTAssertEqual(viewModel.users, [user1, user2])
   }
   
   func test_formattedDate() {
      let user = User(firstName: "John", lastName: "Salvador", dateOfBirth: Date())
      let formattedDate = user.dateOfBirth.formatted(date: .complete, time: .omitted)
      XCTAssertEqual(viewModel.formattedDate(for: user), formattedDate)
   }
   
   func test_getUserFullName() {
      let user = User(firstName: "John", lastName: "Salvador", dateOfBirth: Date())
      let fullName = "\(user.firstName) \(user.lastName)"
      XCTAssertEqual(viewModel.getUserFullName(user), fullName)
   }
   
   // MARK: - Helpers
   
   private func assertImageEqual(_ systemName: String, _ expectedSystemName: String, file: StaticString = #file, line: UInt = #line) {
      guard let data1 = UIImage(systemName: systemName)?.pngData(), let data2 = UIImage(systemName: expectedSystemName)?.pngData() else {
         XCTFail("Image Data should not be nil")
         return
      }
      
      XCTAssertEqual(data1, data2, file: file, line: line)
   }
}
