//
//  MacPaging.swift
//  OnboardingView
//
//  Created by 丹羽雄一朗 on 2026/01/27.
//

import SwiftUI

struct MacPaging<PageView: View>: View {
    @Environment(\.pagingViewAnimation) private var pagingViewAnimation

    /// The page views to display.
    let pages: [PageView]
    /// The current page index.
    let pageIndex: Int

    var body: some View {
        pages[pageIndex]
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(
                pagingViewAnimation,
                value: pageIndex
            )
    }
}
