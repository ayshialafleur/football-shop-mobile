## Assignment 7
### 1. Widget Tree
A **widget tree** is the hierarchical structure that represents how UI elements are organized in a Flutter app.  
Each widget can contain other widgets — creating **parent-child relationships**, where:
- The **parent** defines the layout or structure.
- The **child** defines the content or behavior within that layout.

### 2. Widgets Used in This Project
- **MaterialApp** → Root of the app, provides theming, navigation, and structure.
- **Scaffold** → Provides basic visual layout (AppBar, body, FAB, etc.).
- **AppBar** → Displays the app title or actions at the top.
- **GridView / Column / Row** → Arranges widgets in a grid or linear layout.
- **Material** → Gives material design visuals (color, elevation, ripple).
- **InkWell** → Detects taps and shows ripple animations.
- **Container** → Used for padding, background color, and layout control.
- **Icon** → Displays an icon.
- **Text** → Displays text labels.
- **SnackBar** → Temporary message displayed at the bottom of the screen.
- **Center** → Centers its child widget.

### 3. Function of `MaterialApp`
`MaterialApp` sets up the **overall app environment**, including:
- Theme and color scheme
- Navigation and routes
- Localization
- Debug banner and title  
  It’s used as the **root widget** because it provides the Material Design foundation for all child widgets.

### 4. `StatelessWidget` vs `StatefulWidget`
- **StatelessWidget** → Immutable; UI doesn’t change after it’s built.  
  *Use it when content is static.*
- **StatefulWidget** → Has mutable state that can change during runtime via `setState()`.  
  *Use it when UI updates (e.g., counters, user input, animations).*

### 5. BuildContext
`BuildContext` is an object that represents **the location of a widget within the widget tree**.  
It allows widgets to access information about their position and the inherited data from ancestor widgets.

**Why it’s important:**
- It lets widgets access theme data (`Theme.of(context)`).
- It’s used for navigation (`Navigator.of(context)`).
- It connects a widget to the nearest `Scaffold` or `Provider`.

**Usage in the build method:**
```dart
@override
Widget build(BuildContext context) {
  return Text(
    'Hello',
    style: Theme.of(context).textTheme.bodyMedium,
  );
}
```

### 6. Hot Reload vs Hot Restart
- **Hot Reload** → Quickly updates the UI with your latest code changes **without losing the current app state**.  
  Useful for adjusting layouts, styles, or fixing small logic errors.
  - Example: Changing a button color or text — the app updates instantly.

- **Hot Restart** → Fully restarts the app and **rebuilds the widget tree from scratch**, clearing all state and variables.  
  Useful when you change initialization logic, app structure, or global variables.
  - Example: Adding a new variable in `main()` or modifying `initState()`.

---

## Assignment 8
### 1. Navigator.push() vs Navigator.pushReplacement()
- Navigator.push() adds a new screen on top of the current one, use it when you want users to go back.
- Navigator.pushReplacement() replaces the current screen, use it for pages like login or splash screens where going back isn’t needed

### 2. Using Scaffold, AppBar, and Drawer
They create a consistent layout across pages:
- Scaffold gives structure.
- AppBar keeps a uniform header.
- Drawer provides easy navigation.

### 3. Advantages of layout widgets (Padding, SingleChildScrollView, ListView)
- Padding: adds spacing for better readability.
- SingleChildScrollView: avoids overflow by allowing scrolling.
- ListView: efficiently displays multiple form fields or items.

## 4. Setting color theme for Football Shop
Define colors in ThemeData inside MaterialApp to ensure consistent branding across all pages (e.g., using the shop’s main color for primaryColor and AppBarTheme).
