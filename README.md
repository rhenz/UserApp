# UserApp

UserApp is an iOS app that allows users to manage a list of `User`s. The app is built using Swift and SwiftUI, and follows the MVVM architecture pattern. The app also includes unit testing to ensure that the code works as expected.

## Technologies Used

- Swift: The primary programming language used to build the app.
- SwiftUI: The user interface framework used to build the app's views and layouts.
- MVVM: The architecture pattern used to organize the app's code into separate components.
- Unit Testing(XCTest): The testing framework used to write and run automated tests for the app.

## Features

The app includes the following features:

- Add a new `User` with First Name, Last Name, and Date of Birth.
- View a list of all added `User`s with their details.
- Sort the list of `User`s by last name in ascending or descending order.
- View the latest added `User` on the home screen.
- Validate names
- Date Picker(minimum 1950 - maximum 2022)
- Present `Error Alert` for invalid names
- Unit tests to ensure the code works as expected.



## Main View Feature Specs (In-Progress...🚧)

### Story: User wants to see latest added `User`

### Narrative

```swift
As a user
I want to see the latest added `User`
So I can see their First Name, Last Name and Date of Birth
```

### Scenarios (Acceptance criteria)

1. When I open the app, I can see the latest added `User` on the home screen.
2. The latest added `User` should be displayed with their First Name, Last Name, and Date of Birth.
3. If no `User` has been added yet, the home screen should display a placeholder strings for First Name, Last Name, and Date of Birth.
4. If multiple `User`s have been added, the home screen should display the latest added `User`.
5. If I add a new `User`, the home screen should refresh to display the latest added `User`.



### Story: User wants to see the list of added `User`s

### Narrative

```swift
As a user
I want to see a list of added `User`s
So I can see every `User`s added
```

### Scenarios (Acceptance criteria)

1. When I open the app, I can see a list of all added `User`s on the home screen.
2. The list of `User`s should be displayed in chronological order, with the most recently added `User` at the bottom.
3. Each `User` in the list should be displayed with their First Name and Last Name.
4. If no `User` has been added yet, the home screen should display an empty list.
5. If I add a new `User`, the list of `User`s should refresh to include the new `User` at the bottom of the list.


### Story: User wants to sort `User`s in ascending/descending order

### Narrative

```swift
As a user
I want to sort `User`s in ascending/descending order
So that I can see their names sorted alphabetically by last name
```

### Scenarios (Acceptance criteria)

1. When I open the app, I can see a list of all added `User`s on the home screen.
2. The list of `User`s should be displayed in chronological order, with the most recently added `User` at the top.
3. I can sort the list of `User`s in ascending or descending order by last name.
4. When I sort the list of `User`s, the display should update to show the sorted list.
5. If no `User` has been added yet, the home screen should display a message indicating that no `User` has been added yet.
