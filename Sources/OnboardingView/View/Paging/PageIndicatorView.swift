//
//  PageIndicatorView.swift
//  OnboardingView
//
//  Created by 丹羽雄一朗 on 2026/01/27.
//

import SwiftUI

public struct PageIndicatorView: View {
    private enum Const {
        static let pageIndicatorSpacing: CGFloat = 6
        static let selectedPageIndicatorWidth: CGFloat = 18
        static let unselectedPageIndicatorWidth: CGFloat = 6
        static let pageIndicatorHeight: CGFloat = 6
    }

    @Environment(\.pagingViewAnimation) private var pagingViewAnimation

    /// The total number of pages.
    private let pageCount: Int
    /// The currently selected page index.
    private let pageIndex: Int

    /// Creates an indicator view for a given page count and index.
    public init(pageCount: Int, pageIndex: Int) {
        self.pageCount = pageCount
        self.pageIndex = pageIndex
    }

    public var body: some View {
        HStack(spacing: Const.pageIndicatorSpacing) {
            ForEach(0..<pageCount, id: \.self) { index in
                Capsule(style: .continuous)
                    .fill(
                        index == pageIndex
                            ? Color.primary
                            : Color.secondary.opacity(0.3)
                    )
                    .frame(
                        width: index == pageIndex
                            ? Const.selectedPageIndicatorWidth
                            : Const.unselectedPageIndicatorWidth,
                        height: Const.pageIndicatorHeight
                    )
                    .animation(
                        pagingViewAnimation,
                        value: pageIndex
                    )
            }
        }
    }
}
