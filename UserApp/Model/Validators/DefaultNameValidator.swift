//
//  DefaultNameValidator.swift
//  UserApp
//
//  Created by John Salvador on 5/24/23.
//

import Foundation

final class DefaultNameValidator: NameValidator {
   
   // MARK: - Methods
   
   func validate(_ name: String) -> Bool {
      containsOnlySpacesAndCharactersAndNotEmpty(name)
   }
   
   func containsOnlySpacesAndCharactersAndNotEmpty(_ string: String) -> Bool {
      if string.isEmpty { return false }
      let regex = try! NSRegularExpression(pattern: "^[a-zA-Z ]*$")
      return regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count)) != nil
   }
}
