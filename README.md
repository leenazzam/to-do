# To-Do App

A small Flutter app built to practice **BLoC/Cubit** state management and **Firebase Authentication** (Google & Facebook sign-in).

<img width="200"  alt="Screenshot_1785615063" src="https://github.com/user-attachments/assets/df471ffd-20e6-4048-b7d3-f6c0279c3d78" />

## Stack

- `flutter_bloc` + `equatable` — Cubit for state management
- `firebase_auth` — authentication
- `google_sign_in` / `flutter_facebook_auth` — social login

## Structure

```
lib/
├── core/            # shared widgets & theme
├── features/login/
│   ├── data/repo/           # AuthRepo
│   └── presentation/
│       ├── manger/cubit/    # AuthCubit + AuthState
│       └── ui/               # LoginScreen
└── main.dart
```

## What I learned

- Cubit with a sealed `AuthState` (Initial / Loading / Error / Success)
- `BlocListener` for side effects (dialogs, navigation) without rebuilding UI
- Building an `OAuthCredential` from a provider token and signing in with `signInWithCredential`
- Routing on app start based on `FirebaseAuth.instance.currentUser`
