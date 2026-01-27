//
//  DemoPage.swift
//  OnboardingViewDemo
//
//  Created by 丹羽雄一朗 on 2026/01/28.
//

import SwiftUI

struct DemoPage {
    static let samplePages: [DemoPage] = [
        DemoPage(
            systemImage: "sparkles",
            title: "Minimal Setup",
            subtitle: "OnboardingPageView に pages と viewBuilder を渡すだけ。",
            tint: .blue
        ),
        DemoPage(
            systemImage: "apple.logo",
            title: "Works Everywhere",
            subtitle: "iOS / macOS / visionOS に対応。",
            tint: .indigo
        ),
        DemoPage(
            systemImage: "slider.horizontal.3",
            title: "Customize Paging",
            subtitle: "アニメーションや UI を用途に合わせて調整。",
            tint: .teal
        ),
    ]

    let systemImage: String
    let title: String
    let subtitle: String
    let tint: Color
}
