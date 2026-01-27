import SwiftUI

public struct OnboardingPageView<OnboardingModel, OnboardingView: View>: View {
    @Environment(\.dismiss) private var dismiss

    /// The builder used to create a page view for each model.
    private let viewBuilder: (OnboardingModel) -> OnboardingView
    /// The paging state that tracks the current page.
    @State private var viewState: PagingViewState<OnboardingModel>

    /// Creates an onboarding view with page models and a view builder.
    public init(
        pages: [OnboardingModel],
        viewBuilder: @escaping (OnboardingModel) -> OnboardingView
    ) {
        self.viewBuilder = viewBuilder
        _viewState = State(
            initialValue: PagingViewState(pages: pages)
        )
    }

    public var body: some View {
        NavigationStack {
            #if os(macOS)
            MacOnboardingPage(
                $viewState,
                viewBuilder: viewBuilder
            )
            .padding(16)
            #else
            OnboardingPage(
                $viewState,
                viewBuilder: viewBuilder
            )
            .padding(.bottom, 8)
            #endif
        }
    }
}

// MARK: - Preview

private enum DummyPage: String, CaseIterable {
    case first, second, third
}

#Preview {
    @Previewable @State var isShowingOnboarding = false

    Button("Show Onboarding") {
        isShowingOnboarding = true
    }
    .sheet(isPresented: $isShowingOnboarding) {
        OnboardingPageView(pages: DummyPage.allCases) { dummyPage in
            Text(dummyPage.rawValue)
        }
    }
}
