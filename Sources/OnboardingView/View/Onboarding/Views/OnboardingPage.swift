//
//  OnboardingPage.swift
//  OnboardingView
//
//  Created by 丹羽雄一朗 on 2026/01/27.
//

import SwiftUI

@available(macOS, unavailable)
struct OnboardingPage<OnboardingModel, OnboardingView: View>: View {
    @Environment(\.dismiss) private var dismiss

    private let viewBuilder: (OnboardingModel) -> OnboardingView
    @Binding private var viewState: PagingViewState<OnboardingModel>

    /// Creates a paging container for onboarding on non-macOS platforms.
    init(
        _ viewState: Binding<PagingViewState<OnboardingModel>>,
        viewBuilder: @escaping (OnboardingModel) -> OnboardingView
    ) {
        _viewState = viewState
        self.viewBuilder = viewBuilder
    }

    var body: some View {
        VStack(spacing: 24) {
            PagingView(viewState) { onboardingModel in
                viewBuilder(onboardingModel)
            }

            PageIndicatorView(
                pageCount: viewState.pages.count,
                pageIndex: viewState.pageIndex
            )

            nextButton
                .padding(.horizontal)
        }
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button("Skip", action: dismiss.callAsFunction)
            }
        }
    }

    private var nextButton: some View {
        Button(action: showNextPageOrDismiss) {
            Text(viewState.isLastPage ? "StartNow" : "Next")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }

    private func showNextPageOrDismiss() {
        if viewState.isLastPage {
            dismiss()
        }

        viewState.showNextPage()
    }
}
