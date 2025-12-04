# 📱 Flutter Mobile Challenge

[cite_start]This project is a comprehensive Flutter application built to demonstrate proficiency across several core mobile development areas: advanced API interaction, modern state management, robust platform integration, and clean code architecture[cite: 28].

## ✨ Key Features Implemented

### [cite_start]I. Flutter Coding & API Interaction [cite: 3]

[cite_start]The app uses the GoREST public API [cite: 5] to manage user data, focusing on efficiency and user experience.

* [cite_start]**Add New User:** Implements a `POST` request to add a new user [cite: 8, 9] [cite_start]with validation for fields like name, gender, email, and status[cite: 13, 14, 15, 16].
* [cite_start]**Paginated Fetching:** Retrieves users using a `GET` request with pagination parameters (`page` and `per_page`)[cite: 17, 18].
* [cite_start]**Infinite Scroll:** Automatically loads the next page of users when the user scrolls to the bottom of the list (lazy loading)[cite: 20].
* [cite_start]**Pull-to-Refresh:** Allows the user to refresh the entire list via a standard pull-down gesture[cite: 21].
* [cite_start]**Graceful Error Handling:** Provides user-friendly feedback for API issues (e.g., duplicate email submissions, invalid tokens)[cite: 22].

### II. [cite_start]Native Platform Integration (Android/iOS) [cite: 29]

[cite_start]Platform Channels are utilized to access device-specific features, ensuring functionality on both Android and iOS[cite: 38].

* [cite_start]**Device Storage Info:** Implements a **MethodChannel** [cite: 37] [cite_start]to fetch and display the available (free) space and total space on the device[cite: 30, 33].
    * [cite_start]*Native Implementation:* Uses the **Android StatFs API** [cite: 31] [cite_start]and **iOS URLResource Values (FileManager)**[cite: 32].
* [cite_start]**Native Permission Handling:** Requests **camera permission** directly via native code [cite: 35] [cite_start]and returns the current permission status back to the Flutter UI[cite: 35].

## 🚀 Technical Stack & Architecture

[cite_start]This project is built using mandatory modern Flutter patterns to ensure maintainability, scalability, and adherence to professional standards[cite: 23].

| Category | Technology / Pattern | Purpose |
| :--- | :--- | :--- |
| **State Management** | [cite_start]**Cubit/Bloc** [cite: 26] | Predictable, reactive, and separated business logic. |
| **Networking** | [cite_start]**Dio with Interceptors** [cite: 24] | [cite_start]Robust HTTP client for API communication, configured with interceptors to inject the mandatory Bearer Token[cite: 5, 6]. |
| **Navigation** | [cite_start]**Go Router** [cite: 27] | Declarative routing solution for deep linking and flow management. |
| **Architecture** | [cite_start]**Dependency Injection** [cite: 25] | Used for managing service lifetimes and abstracting dependencies for better testability (e.g., repository, data source). |
| **Native Bridge** | [cite_start]**MethodChannel** [cite: 37] | [cite_start]Bi-directional communication between Flutter and native codebases[cite: 39]. |

## ⚙️ GoREST API Configuration

* **Base URL:** `https://gorest.co.in/public/v2/`
* [cite_start]**Authorization:** All necessary API calls are authenticated using a Bearer Token[cite: 5].

## ✅ Getting Started

### Prerequisites

* Flutter SDK (v3.16+)
* iOS/Android Native Development Environment (to properly test Platform Channel features)

### Installation

1.  Clone the repository using the new name:
    ```bash
    git clone [https://github.com/YOUR_USERNAME/flutter-mobile-challenge.git](https://github.com/YOUR_USERNAME/flutter-mobile-challenge.git)
    ```
2.  Navigate into the directory:
    ```bash
    cd flutter-mobile-challenge
    ```
3.  Install dependencies:
    ```bash
    flutter pub get
    ```
4.  Run the application on a device or simulator:
    ```bash
    flutter run
    ```

---

## 🌟 Bonus Tasks (Optional)

If the bonus sections were completed, include this section to showcase the extra effort.

* [cite_start]**Offline Support:** Implemented caching with **Hive/SQLite** [cite: 42][cite_start], loading users from the cache when offline, and refreshing the cache when connectivity is restored[cite: 41, 43, 44].
* [cite_start]**Native UI Feedback:** A platform channel is used to trigger native-specific feedback (Android → Toast, iOS → UIAlertController) from the Flutter layer[cite: 45, 46, 47, 48].
