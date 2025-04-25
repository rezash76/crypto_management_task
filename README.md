# 🚀 Crypto Management Task

A modern, scalable Flutter application for managing cryptocurrencies, built with **Clean Architecture** principles and robust **Bloc state management**.  
This project demonstrates best practices in **Domain-Driven Design**, **Dependency Injection**, **Validation**, and **Separation of Concerns**.

---

## 📚 Table of Contents

- [Features](#features)
- [Architecture & State Management](#architecture--state-management)
- [Tech Stack & Tools](#tech-stack--tools)
- [Setup & Installation](#setup--installation)
- [Running the Application](#running-the-application)
- [Testing](#testing)

---

## ✨ Features

- ✅ User authentication and secure token storage
- 🔍 View coins and favorite coins
- 👤 Profile management with value object validation
- 🌗 Light & dark theme support (system adaptive)
- 🧼 Clean, maintainable, and documented codebase

---

## 🧠 Architecture & State Management

### 🧱 Clean Architecture Layers

- **Domain Layer**: Business rules (Entities, Value Objects)
- **Application Layer**: Use Cases, DTOs, Transactions
- **Infrastructure Layer**: External dependencies (API, storage, mapping)
- **Presentation Layer**: UI + Bloc (state management)

> ✅ Benefits: testability, scalability, separation of concerns

---

### 🧠 Bloc State Management

- **All ui logic** handled by `flutter_bloc`
- **Unidirectional data flow** ensures predictable state
- **Optimistic UI**: actions like favoriting coin reflect immediately in UI and roll back on failure

---

## 🛠 Tech Stack & Tools

| Tool | Usage |
|------|-------|
| [Flutter](https://flutter.dev) | Cross-platform UI framework |
| [Dart](https://dart.dev) | Type-safe modern language |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc) | State management |
| [injectable](https://pub.dev/packages/injectable) + get_it | Dependency injection |
| [dio](https://pub.dev/packages/dio) | HTTP client & Interceptors |
| [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) | Secure token storage |
| [shared_preferences](https://pub.dev/packages/shared_preferences) | Persistent local storage |
| **Value Objects** | Strong validation (Email, Phone, etc.) |
| **Custom Validators** | Regex shared across domain/UI |

---

## ⚙️ Setup & Installation

### 1. Clone the repo

```bash
git clone https://github.com/YOUR_USERNAME/crypto_management_task.git
cd crypto_management_task
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Generate Dependency Injection code

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## ▶️ Running the Application

```bash
flutter run
```
• Theme follows system by default
•	Toggle light/dark from home page

## 🧪 Testing

Run all tests with:

```bash
flutter run
```

Includes (some):
	•	Value object validation tests
	•	Bloc & Cubit unit tests
	•	Repository mocks
	•	Use case transaction tests

