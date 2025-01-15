
# SGConfDemo

Welcome to **SGConfDemo**, a SwiftUI-based demo app that showcases the power of **App Intents**, **Live Activities**, and modern iOS features. This app is designed for iOS developers interested in integrating App Intents into their applications to enhance user engagement, automation, and system integration.

---

## Features

### 1. **App Intents**
- **Toggle Favorite Session**: Mark a session as a favorite with Siri or Shortcuts.
- **Get Next Session**: Retrieve details about your next scheduled session.
- **Go to Session**: Navigate directly to a specific session.
- **Open Speaker**: Access details of a specific speaker.
- **Get Session**: Retrieve information about a specific session.

### 2. **Live Activities**
- Track a session in real-time on the Lock Screen and Dynamic Island.
- Automatically update session details and speaker images during the activity.

### 3. **Speaker & Session Management**
- View session details, including speaker information and session times.
- Favorite sessions to access them quickly.
- See a list of sessions hosted by a particular speaker.

---

## Demo Walkthrough

### App Intents in Action
1. **Favorite Session**:
   - Use Siri: _"Favorite this session for SGConfDemo"_
   - Shortcut Example:
     - Add a favorite toggle in the Shortcuts app.

2. **Live Activities**:
   - Start a Live Activity for a session and see it update dynamically on the Lock Screen or Dynamic Island.

3. **Session Navigation**:
   - _"Open session for SGConfDemo"_ or deep link directly to a session.

### App Shortcuts
Predefined shortcuts include:
- **Favorite Session**: Quickly mark a session as a favorite.
- **Open Speaker**: Access speaker details directly.
- **Get Next Session**: Retrieve your next scheduled session.

---

## Installation

### Prerequisites
- Xcode 15 or later
- iOS 17.0+
- A physical device is required for testing Live Activities.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/SGConfDemo.git
   cd SGConfDemo
   ```
2. Open the project in Xcode:
   ```bash
   open SGConfDemo.xcodeproj
   ```
3. Set up the App Group for Live Activities:
   - Enable the App Group capability in the Xcode project settings.
   - Replace `group.com.yourcompany.SGConfDemo` in the code with your app group's identifier.

4. Build and run the app on a device.

---

## Code Overview

### Key Files
- **`SessionAppShortcuts.swift`**: Defines App Shortcuts for Siri and the Shortcuts app.
- **`LiveActivitySessionView.swift`**: Implements Live Activity views for Lock Screen and Dynamic Island.
- **`SessionActivityAttributes.swift`**: Defines attributes and state for Live Activities.
- **`ImageHelper.swift`**: Handles downloading and caching speaker images.

### Mock Data
- `MockData.swift`: Provides mock sessions and speakers for testing purposes.

---

## Roadmap

### Future Enhancements
- Add more intents, such as sharing session details or resetting favorites.
- Expand Live Activity integration with richer UI updates.
- Include analytics to track user interactions with App Intents.

---

## Screenshots
Add screenshots or GIFs here to showcase the app.

---

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Author

**Vince Davis**  
iOS Engineer | [GitHub](https://github.com/vincedavis) | [X](https://x.com/vincedavis)
