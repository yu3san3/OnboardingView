# 🎉 OnboardingView

OnboardingView is a lightweight SwiftUI package for building onboarding flows with paging.

## ✨ Features

- 🚀 Minimal setup, rich onboarding UI
- 🧩 Easy to compose with your own page content and layouts
- 🎛️ Fully Customizable paging UI
- 🍎 Works on iOS, iPadOS, macOS, and visionOS

## 📱 Screenshots

|iOS|iPadOS|
-|-
|<img width="300" alt="iPhone" src="https://github.com/user-attachments/assets/e938a9c9-bc30-4a8f-b4b8-1efa240c5560" />|<img width="500" alt="iPad" src="https://github.com/user-attachments/assets/03bf202e-195b-494c-994e-9696f06a4ca8" />|

|macOS|visionOS|
-|-
|<img width="500" alt="Mac" src="https://github.com/user-attachments/assets/c1c07bbe-dc7f-4287-a57b-8a1b057e9974" />|<img width="500" alt="Vision" src="https://github.com/user-attachments/assets/257a724e-41a3-4120-a0cc-3753e1671a1e" />|

## 🚀 Quick Start

### 1. Add `OnboardingPageView` to your UI

```swift
import OnboardingView
import SwiftUI

enum OnboardingStep: String, CaseIterable {
    case first
    case second
    case third
}

struct OnboardingView: View {
    var body: some View {
        OnboardingPageView(pages: OnboardingStep.allCases) { step in
            Text(step.rawValue)
        }
    }
}
```

### 2. Present it where you need onboarding

```swift
struct RootView: View {
    @State private var isShowingOnboarding = false

    var body: some View {
        Button("Show Onboarding") {
            isShowingOnboarding = true
        }
        .sheet(isPresented: $isShowingOnboarding) {
            OnboardingView()
        }
    }
}
```

## 🔍 Customization

### Paging animation

```swift
OnboardingPageView(pages: pages) { page in
    YourPageContent(page)
}
.onboardingPageViewAnimation(.snappy(duration: 0.3))
```

### Custom paging UI

If you want to build your own controls, use `PagingViewState`, `PagingView`, and `PageIndicatorView` directly.

```swift
struct YourCustomOnboardingView<PageModel, PageView: View>: View {
    private let viewBuilder: (PageModel) -> PageView
    @State private var state: PagingViewState<PageModel>

    init(
        pages: [PageModel],
        viewBuilder: @escaping (PageModel) -> PageView
    ) {
        _state = State(initialValue: PagingViewState(pages: pages))
        self.viewBuilder = viewBuilder
    }

    var body: some View {
        VStack {
            // Page content
            PagingView(state) { pageModel in
                viewBuilder(pageModel)
            }

            // Page indicators
            PageIndicatorView(
                pageCount: state.pages.count,
                pageIndex: state.pageIndex
            )

            // Page controls
            HStack {
                Button("Previous") {
                    state.showPreviousPage()
                }
                .disabled(state.isFirstPage)

                Button("Next") {
                    state.showNextPage()
                }
                .disabled(state.isLastPage)
            }
        }
    }
}
```

## 📦 Installation

### Swift Package Manager

1. In Xcode, open your project and navigate to `Project` > `Package Dependencies`.
2. Enter the repository URL:
```
https://github.com/yu3san3/OnboardingView.git
```

## 📢 License

See `LICENSE` for details.
