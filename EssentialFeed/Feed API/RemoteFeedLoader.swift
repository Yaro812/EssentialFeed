//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Yaroslav Pasternak on 17.08.2021.
//

import Foundation


public protocol HTTPClient {
    func get(from: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error?, HTTPURLResponse?) -> Void) {
        client.get(from: url) { error, response in
            if response != nil {
                completion(.invalidData, nil)
            } else {
                completion(.connectivity, nil)
            }
        }
    }
}
