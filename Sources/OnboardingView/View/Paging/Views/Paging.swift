//
//  Paging.swift
//  OnboardingView
//
//  Created by 丹羽雄一朗 on 2026/01/27.
//

import SwiftUI

@available(macOS, unavailable)
struct Paging<PageView: View>: View {
    @Environment(\.pagingViewAnimation) private var pagingViewAnimation

    /// The page views to display.
    let pages: [PageView]
    /// The current page index binding.
    @Binding var pageIndex: Int

    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(0..<pages.count, id: \.self) { index in
                pages[index]
                    .tag(index)
            }
        }
        .tabViewStyle(
            .page(indexDisplayMode: .never)
        )
        .animation(
            pagingViewAnimation,
            value: pageIndex
        )
    }
}
