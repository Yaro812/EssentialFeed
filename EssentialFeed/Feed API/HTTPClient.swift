//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Yaroslav Pasternak on 18.08.2021.
//

import Foundation

public typealias HTTPClientResult = Result<(Data, HTTPURLResponse), Error>

public protocol HTTPClient {
    func get(from: URL, completion: @escaping (HTTPClientResult) -> Void)
}
