//
//  PagingView.swift
//  OnboardingView
//
//  Created by 丹羽雄一朗 on 2026/01/27.
//

import SwiftUI

public struct PagingView<PageView: View>: View {
    @Environment(\.dismiss) private var dismiss

    /// The page views to display.
    private let pages: [PageView]
    /// The current page index binding.
    @Binding private var pageIndex: Int

    /// Creates a paging view from a paging state and a view builder.
    public init<PagingModel>(
        _ viewState: PagingViewState<PagingModel>,
        viewBuilder: (PagingModel) -> PageView
    ) {
        pages = viewState.pages.map { viewBuilder($0) }
        _pageIndex = .init(
            get: { viewState.pageIndex },
            set: { viewState.pageIndex = $0 }
        )
    }

    public var body: some View {
        #if os(macOS)
        MacPaging(
            pages: pages,
            pageIndex: pageIndex
        )
        #else
        Paging(
            pages: pages,
            pageIndex: $pageIndex
        )
        #endif
    }
}
