//
//  Pagination.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation

/**
# Responsibility - This class handle infinite paging
*/

class Pagination<T> {
    
    enum PageType {
        case COUNT
        case EMPTY_OR_LESS
        case UNKNOWN_COUNT
    }
    
    private(set) var pageSize: Int = 20
    private(set) var page: Int = 1
    private(set) var isLoading: Bool = false
    private var hasMore: Bool = true
    private(set) var data: [T] = []
    private(set) var total: Int = 0
    
    private var pageType: PageType = .EMPTY_OR_LESS
    private var maxData: Int = -1
    
    convenience init(pageType: PageType = .EMPTY_OR_LESS) {
        self.init(pageSize: 10, pageType: pageType, maxData: -1)
    }
    
    init(pageSize: Int, pageType: PageType = .EMPTY_OR_LESS, maxData: Int = -1) {
        self.pageSize = pageSize
        switch pageType {
        case .UNKNOWN_COUNT:
            break
        case .EMPTY_OR_LESS:
            self.pageSize = pageSize
            break
        case .COUNT:
            self.maxData = maxData
            break
        }
        self.pageType = pageType
        self.maxData = maxData
    }
    
    func isFirstPage() -> Bool {
        return page == 1
    }
    
    func getPageStartCount() -> Int {
        return (page - 1)  * 10
    }
    
    func getPageEndCount() -> Int {
        return getPageStartCount() + pageSize
    }
    
    func reset() {
        isLoading = false
        hasMore = true
        page = 1
        total = 0
        data.removeAll()
    }
    
    func canLoadNow(index: Int) -> Bool {
        return (index == total - 1) && !isLoading && hasMore
    }
    
    func start() {
        isLoading = true
    }
    
    func stop() {
        isLoading = false
    }
    
    func success(objects: [T]) {
        data.append(contentsOf: objects)
        total = data.count
        page = page + 1
        isLoading = false
        
        switch pageType {
        case .UNKNOWN_COUNT:
            hasMore = objects.count > 0
            break
        default:
            hasMore = objects.count == pageSize
        }
    }
    
    func failed() {
        isLoading = false
    }
}

