# Country Search App

A Flutter application to search for countries dynamically using the REST Countries API. The app features real-time search suggestions, error handling, and a user-friendly UI.

---

## Approach

### Dynamic Search with Debouncing
- Implemented a search bar with real-time suggestions for country names.
- Debouncing logic ensures minimal API calls by delaying the request until the user stops typing.

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

## Getting Started

### Prerequisites
1. Install Flutter SDK: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
2. Set up your development environment (Android Studio, VS Code, IntelliJ IDEA, etc.).
3. Ensure you have a connected emulator or physical device.

### Installation
1. **Clone the repository**:
   ```bash
   git clone <repository-link>
   cd <repository-folder>
