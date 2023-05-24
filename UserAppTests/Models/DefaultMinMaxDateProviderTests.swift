//
//  DefaultMinMaxDateProviderTests.swift
//  UserAppTests
//
//  Created by John Salvador on 5/25/23.
//

import XCTest
@testable import UserApp

final class DefaultMinMaxDateProviderTests: XCTestCase {
   
   // MARK: - Properties
   
   var provider: DefaultMinMaxDateProvider!
   
   // MARK: - Setup
   
   override func setUpWithError() throws {
      provider = DefaultMinMaxDateProvider()
   }
   
   override func tearDownWithError() throws {
      provider = nil
   }
   
   // MARK: - Tests
   
   func test_minimumDate() {
      // Act
      let minimumDate = provider.minimumDate
      
      // Assert
      XCTAssertEqual(minimumDate, createDate(year: 1950, month: 1, day: 1))
   }
   
   func test_maximumDate() {
      // Act
      let maximumDate = provider.maximumDate
      
      // Assert
      XCTAssertEqual(maximumDate, createDate(year: 2022, month: 12, day: 31))
   }
   
   // MARK: - Helpers
   
   private func createDate(year: Int, month: Int, day: Int) -> Date {
      let calendar = Calendar.current
      var dateComponents = DateComponents()
      dateComponents.year = year
      dateComponents.month = month
      dateComponents.day = day
      return calendar.date(from: dateComponents)!
   }
}
