//
//  MacOnboardingPage.swift
//  OnboardingView
//
//  Created by 丹羽雄一朗 on 2026/01/27.
//

import SwiftUI

private enum Const {
    static let toolbarButtonWidth: CGFloat = 80
}

struct MacOnboardingPage<OnboardingModel, OnboardingView: View>: View {
    @Environment(\.dismiss) private var dismiss

    private let viewBuilder: (OnboardingModel) -> OnboardingView
    @Binding private var viewState: PagingViewState<OnboardingModel>

    /// Creates a paging container for onboarding on macOS.
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
        }
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button(action: dismiss.callAsFunction) {
                    Text("Skip")
                        .frame(width: Const.toolbarButtonWidth)
                }
                .controlSize(.large)
            }

            if !viewState.isFirstPage {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: viewState.showPreviousPage) {
                        Text("Previous")
                            .frame(width: Const.toolbarButtonWidth)
                    }
                    .controlSize(.large)
                }
            }

            ToolbarItem(placement: .confirmationAction) {
                Button(action: showNextPageOrDismiss) {
                    Text(viewState.isLastPage ? "StartNow" : "Next")
                        .frame(width: Const.toolbarButtonWidth)
                }
                .controlSize(.large)
                .buttonStyle(.bordered)
            }
        }
    }

    private func showNextPageOrDismiss() {
        if viewState.isLastPage {
            dismiss()
        }

        viewState.showNextPage()
    }
}
