//
//  OnboardingDemo.swift
//  OnboardingViewDemo
//
//  Created by 丹羽雄一朗 on 2026/01/28.
//

import OnboardingView
import SwiftUI

struct OnboardingPageDemo: View {
    var body: some View {
        OnboardingPageView(pages: DemoPage.samplePages) { page in
            DemoOnboardingPage(page: page)
                .padding()
        }
    }
}

struct ChangingAnimationDemo: View {
    var body: some View {
        OnboardingPageView(pages: DemoPage.samplePages) { page in
            DemoOnboardingPage(page: page)
                .padding()
        }
        .onboardingPageViewAnimation(.default)
    }
}

struct CustomPagingDemoView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var state: PagingViewState<DemoPage>

    init() {
        _state = State(initialValue: PagingViewState(pages: DemoPage.samplePages))
    }

    var body: some View {
        VStack {
            PagingView(state) { page in
                DemoOnboardingPage(page: page)
                    .padding()
            }

            PageIndicatorView(
                pageCount: state.pages.count,
                pageIndex: state.pageIndex
            )

            Group {
                Button(action: state.showNextPage) {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(state.isLastPage)

                Button(action: dismiss.callAsFunction) {
                    Text("Close")
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
    }
}

private struct DemoOnboardingPage: View {
    let page: DemoPage

    var body: some View {
        VStack {
            Image(systemName: page.systemImage)
                .font(.system(size: 48, weight: .bold))
                .foregroundStyle(.white)
                .padding(24)
                .background(
                    Circle()
                        .fill(page.tint)
                )

            Text(page.title)
                .font(.title2.bold())
                .multilineTextAlignment(.center)

            Text(page.subtitle)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                colors: [
                    page.tint.opacity(0.15),
                    page.tint.opacity(0.04),
                    Color(.systemGray).opacity(0.05)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}
