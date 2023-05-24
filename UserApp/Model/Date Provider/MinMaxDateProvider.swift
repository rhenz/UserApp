//
//  DateProvider.swift
//  UserApp
//
//  Created by John Salvador on 5/24/23.
//

import Foundation

protocol MinMaxDateProvider {
   
   // MARK: - Properties
   
   var minimumDate: Date { get }
   var maximumDate: Date { get }
}
