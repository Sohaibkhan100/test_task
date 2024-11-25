# Country Search App

A Flutter application to search for countries dynamically using the REST Countries API and a user-friendly UI.

---

## Approach

### Dynamic Search with Debouncing
- Implemented a search bar with real-time suggestions for country names.
- (new learning) "Debouncing" this logic ensures minimal API calls by delaying the request until the user stops typing.

### API Integration
- Integrated with the REST Countries API to fetch country data dynamically.
- Utilized error handling to manage cases like no results, API failures, and network issues.

### State Management
- Used GetX for state management, navigation, and controller lifecycle handling.
- Managed UI updates dynamically based on API responses and user interactions.

### Error Handling and User Experience
- Displays appropriate messages like "No countries found" or "Unable to fetch data" in case of errors.
- Includes a loading indicator for better user experience during API calls.

### Navigation
- Added a splash screen with a 2-second delay before navigating to the search screen using GetX routing.

---

## How to Run the app 
- Flutter pub get (to install all the required packages)
- Select your real time / virtual device 
- Hit "flutter run" in terminal


