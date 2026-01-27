//
//  File.swift
//  OnboardingView
//
//  Created by 丹羽雄一朗 on 2026/01/27.
//

import SwiftUI

extension EnvironmentValues {
    /// The animation used by OnboardingView.
    @Entry var pagingViewAnimation = Animation.snappy(duration: 0.25)
}

public extension View {
    /// Sets the animation used by OnboardingView.
    func pagingViewAnimation(_ value: Animation) -> some View {
        environment(\.pagingViewAnimation, value)
    }

    /// Sets the animation used by OnboardingView.
    func onboardingPageViewAnimation(_ value: Animation) -> some View {
        environment(\.pagingViewAnimation, value)
    }
}
