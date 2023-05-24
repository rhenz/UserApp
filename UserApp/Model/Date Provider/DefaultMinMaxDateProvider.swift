//
//  DefaultMinMaxDateProvider.swift
//  UserApp
//
//  Created by John Salvador on 5/24/23.
//

import Foundation

final class DefaultMinMaxDateProvider: MinMaxDateProvider {
   
   // MARK: - Properties
   
   var minimumDate: Date {
      let calendar = Calendar.current
      var dateComponents = DateComponents()
      dateComponents.year = 1950
      dateComponents.month = 1
      dateComponents.day = 1
      return calendar.date(from: dateComponents)!
   }
   
   var maximumDate: Date {
      let calendar = Calendar.current
      var dateComponents = DateComponents()
      dateComponents.year = 2022
      dateComponents.month = 12
      dateComponents.day = 31
      return calendar.date(from: dateComponents)!
   }
}
