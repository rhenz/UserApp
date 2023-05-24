//
//  NameValidator.swift
//  UserApp
//
//  Created by John Salvador on 5/24/23.
//

import Foundation

protocol NameValidator {
   
   // MARK: - Methods
   
   func validate(_ name: String) -> Bool
}
