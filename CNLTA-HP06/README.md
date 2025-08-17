# Simple Greeting Card Creator (MVP) 🎉

A minimal viable product (MVP) of a greeting card creation app built with SwiftUI. This initial version focuses on core functionalities, allowing users to select a background, enter a custom message, and change the text color, with a live preview.

## 🌟 Features (MVP)

*   🖼️ **Select Background Image:** Choose from a predefined set of 3-5 background images.
*   ✍️ **Custom Greeting Message:** Input a personalized message for the card.
*   🎨 **Change Text Color:** Select from a few basic text colors (e.g., Black, White, Red).
*   👀 **Live Preview:** See the card update алкоголь (dynamically) as you make changes.

## 🛠️ Tech Stack & Core SwiftUI Concepts Used

*   **SwiftUI Framework:** For building the user interface declaratively.
*   **`@State` Property Wrapper:** To manage the local state of UI elements such as:
    *   Selected background image name.
    *   Current greeting text.
    *   Selected text color.
*   **Layout Containers:**
    *   `VStack`: To arrange elements vertically (main layout, controls).
    *   `HStack`: To arrange elements horizontally (e.g., color selection buttons).
    *   `ZStack`: To overlay the text on top of the background image for the card preview.
*   **UI Components:**
    *   `Image`: To display background images.
    *   `Text`: To display the greeting message.
    *   `TextField`: For user input of the greeting message.
    *   `Button` (or `View.onTapGesture` on other views like `Image` or `Circle`): For handling user interactions like selecting a background or color.
*   **Basic Modifiers:**
    *   `.resizable()` and `.scaledToFit()` (or `.aspectRatio(contentMode: .fit)`): For image display.
    *   `.foregroundColor()`: To set the text color.
    *   `.textFieldStyle(.roundedBorder)`: For basic `TextField` styling.
    *   `.padding()`: For adding spacing around elements.

## 🚀 Getting Started

1.  **Clone the repository (or create a new Xcode project).**
2.  **Add Assets:** Place 3-5 background images (e.g., `background_1.jpg`, `background_2.jpg`, `default_background.jpg`) into your `Assets.xcassets` catalog. Make sure the names match those used in the code.
3.  **Open in Xcode:** Open the `.xcodeproj` or `.swiftpm` file in Xcode.
4.  **Build and Run:** Select a simulator or a physical device and run the app.

## 🧑‍💻 How to Use (MVP Flow)

1.  **Launch the App:** You'll see a default card.
2.  **Change Background:** Tap one of the background selection buttons/images. The card's background will update.
3.  **Enter Message:** Tap into the `TextField` and type your desired greeting message. The text on the card will update as you type.
4.  **Change Text Color:** Tap one of the color selection buttons. The color of the greeting text on the card will change.

## 📸 Screenshots/GIF

<!-- TODO: Add a screenshot or a short GIF of the app in action here! -->
<!-- Example: ![App Screenshot](link_to_your_screenshot.png) -->

## 🔮 Future Enhancements (Post-MVP)

*   More background image options (e.g., from photo library).
*   Font selection and size adjustment.
*   More color choices (e.g., using `ColorPicker`).
*   Ability to save the card as an image.
*   Ability to share the card.
*   Refactor UI into `Custom Components` for better organization.

## 📝 License

This project is licensed under the MIT License - see the `LICENSE.md` file for details (if you choose to add one).

---

_This README is tailored for the initial, super-simple version of the app. As features are added, this document should be updated accordingly._
