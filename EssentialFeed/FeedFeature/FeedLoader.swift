//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Yaroslav Pasternak on 17.08.2021.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedItem], Error>

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
