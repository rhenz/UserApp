//
//  AddUserView.swift
//  UserApp
//
//  Created by John Salvador on 5/23/23.
//

import SwiftUI

struct AddUserView: View {
   
   // MARK: - Properties
   
   @ObservedObject var mainViewModel: MainViewModel
   @StateObject var addUserViewModel = AddUserViewModel()
   @Environment(\.dismiss) private var dismiss
   
   @State private var showErrorAlert = false
   @State private var errorMessage = ""
   
   // MARK: - View
   
   var body: some View {
      List {
         TextField(addUserViewModel.firstNamePlaceholder, text: $addUserViewModel.firstName)
         TextField(addUserViewModel.lastNamePlaceholder, text: $addUserViewModel.lastName)
         DatePicker(
            "",
            selection: $addUserViewModel.dateOfBirth,
            in: addUserViewModel.minimumDate...addUserViewModel.maximumDate,
            displayedComponents: [.date])
         .datePickerStyle(.graphical)
         .labelsHidden()
         
         // Add new user
         Button(addUserViewModel.addButtonTitle) {
            addUserViewModel.addUser(for: mainViewModel)
         }
      }
      .alert(isPresented: $showErrorAlert) {
         Alert(title: Text(addUserViewModel.alertErrorTitle),
               message: Text(errorMessage),
               dismissButton: .default(Text("OK!")))
      }
      .onReceive(addUserViewModel.$state) { state in
         if case .successAddingNewUser = state {
            dismiss()
         } else if case .error(let message) = state {
            showErrorAlert = true
            errorMessage = message
         }
      }
   }
}

struct AddUserView_Previews: PreviewProvider {
   static var previews: some View {
      AddUserView(mainViewModel: MainViewModel())
   }
}
