//
//  MainView.swift
//  UserApp
//
//  Created by John Salvador on 5/23/23.
//

import SwiftUI


struct MainView: View {
   
   // MARK: - Properties
   
   @StateObject var mainViewModel = MainViewModel()
   
   // MARK: - View
   
   var body: some View {
      NavigationView {
         VStack(alignment: .leading) {
            
            // User Details
            VStack(alignment: .leading) {
               if let user = mainViewModel.lastAddeduser {
                  Text(user.firstName)
                  Text(user.lastName)
                  Text(mainViewModel.formattedDate(for: user))
               } else {
                  Text(mainViewModel.firstNamePlaceholder)
                  Text(mainViewModel.lastNamePlaceholder)
                  Text(mainViewModel.dateOfBirthPlaceholder)
               }
            }
            .padding()
            
            // Buttons for Sorting
            VStack {
               HStack {
                  Button {
                     mainViewModel.sortDescending()
                  } label: {
                     Image(systemName: mainViewModel.descendingIcon)
                  }
                  
                  Button {
                     mainViewModel.sortAscending()
                  } label: {
                     Image(systemName: mainViewModel.ascendingIcon)
                  }
               }
               .font(.largeTitle)
               
               // List of Users
               List(mainViewModel.users) { user in
                  Text(mainViewModel.getUserFullName(user))
               }
            }
            
         }
         .navigationTitle(mainViewModel.navigationTitle)
         .navigationBarTitleDisplayMode(.inline)
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               NavigationLink(destination: AddUserView(mainViewModel: mainViewModel)) {
                  Image(systemName: mainViewModel.addNewUserIcon)
               }
            }
         }
         .onDisappear {
            if mainViewModel.usersPreviouslySorted {
               mainViewModel.sortByDateCreated() // Revert to unsorted array
            }
         }
      }
      
   }
}

struct MainView_Previews: PreviewProvider {
   static var previews: some View {
      MainView()
   }
}
