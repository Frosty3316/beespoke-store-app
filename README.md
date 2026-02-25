# Beespoke Store App – Flutter Build Challenge

## Overview

This Flutter application demonstrates API integration, state management, local persistence, and in-app browsing with history tracking.

The app fetches product data from FakeStoreAPI and allows users to interact with products through like/dislike functionality. It also includes an in-app WebView with persistent browsing history.

---

## Features

### 1. Product Feed
- Fetches products from FakeStoreAPI
- Displays image, title, and price
- Handles loading and error states

### 2. Like / Dislike Interaction
- Users can like or dislike products
- UI updates instantly
- Preferences are stored locally using Hive
- Data persists after app restart

### 3. In-App Browser
- Opens product-related external webpage inside WebView
- Tracks visited URLs
- Stores browsing history locally
- History persists across sessions
- Clear history option available

---

## State Management

Riverpod was used for state management because:
- It provides clean separation of concerns
- It is scalable and testable
- It simplifies async data handling
- It reduces boilerplate compared to traditional approaches

---

## Data Persistence

Hive was used for local storage because:
- Lightweight and fast
- No SQL overhead
- Simple key-value storage ideal for preferences and history

---

## Architecture

The app follows a feature-based folder structure:

lib/
- core/
- services/
- features/
  - products/
  - browser/
  - history/

This structure keeps business logic separated from UI and improves maintainability.

---

## Error & Loading Handling

- CircularProgressIndicator for loading state
- Graceful error message display for API failures

---

## What I Would Improve With More Time

- Add pagination for large datasets
- Improve UI polish and animations
- Add search & filtering
- Implement unit and widget tests
- Introduce repository abstraction for better testability
- Add timestamp to browsing history

---

## Approximate Time Spent

~8–10 hours (including environment setup and debugging Android toolchain issues)

---

## How to Run

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run`

APK file is included in submission.