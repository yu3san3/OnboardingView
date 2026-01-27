//
//  File.swift
//  OnboardingView
//
//  Created by 丹羽雄一朗 on 2026/01/27.
//

import SwiftUI

@Observable
public class PagingViewState<PagingModel> {
    /// The models used to build each page.
    public let pages: [PagingModel]
    /// The currently visible page index.
    public var pageIndex = 0

    /// Creates state with a list of page models.
    public init(pages: [PagingModel]) {
        self.pages = pages
    }

    /// Returns true when the current page is the first page.
    public var isFirstPage: Bool {
        pageIndex == 0
    }

    /// Returns true when the current page is the last page.
    public var isLastPage: Bool {
        pageIndex == (pages.count - 1)
    }

    /// Advances to the next page if possible.
    public func showNextPage() {
        if isLastPage { return }

        pageIndex += 1
    }

    /// Moves back to the previous page if possible.
    public func showPreviousPage() {
        if isFirstPage { return }

        pageIndex -= 1
    }
}
