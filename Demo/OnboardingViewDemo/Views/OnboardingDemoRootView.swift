//
//  OnboardingDemoRootView.swift
//  OnboardingViewDemo
//
//  Created by 丹羽雄一朗 on 2026/01/28.
//

import SwiftUI

struct OnboardingDemoRootView: View {
    private enum DemoDestination: String, Identifiable {
        case onboardingPage
        case changingAnimation
        case customPagingView

        var id: String { rawValue }
    }

    @State private var selectedDemo: DemoDestination?

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Button("Onboarding Page Demo") {
                    selectedDemo = .onboardingPage
                }

                Button("Changing Animation Demo") {
                    selectedDemo = .changingAnimation
                }

                Button("Custom Paging Demo View") {
                    selectedDemo = .customPagingView
                }
            }
            .sheet(item: $selectedDemo) { destination in
                switch destination {
                case .onboardingPage:
                    OnboardingPageDemo()
                        .frame(minHeight: 300)

                case .changingAnimation:
                    ChangingAnimationDemo()
                        .frame(minHeight: 300)

                case .customPagingView:
                    CustomPagingDemoView()
                        .frame(minHeight: 300)

                }
            }
        }
    }
}

#Preview {
    OnboardingDemoRootView()
}
