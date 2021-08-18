//
//  URLSessionHPPTClientTests.swift
//  EssentialFeedTests
//
//  Created by Yaroslav Pasternak on 19.08.2021.
//

import XCTest

class URLSessionHTTPClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func get(from url: URL) {
        session.dataTask(with: url) { _, _, _ in
        }
    }
}

class URLSessionHPPTClientTests: XCTestCase {

    func test() {
        let url = URL(string: "http://any-url.com")!
        let session = URLSessionSpy()
        
        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url)
        
        XCTAssertEqual(session.receivedURLs, [url])
    }

    // MARK: helpers
    
    private class URLSessionSpy: URLSession {
        var receivedURLs: [URL] = []
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            receivedURLs.append(url)
            return FakeURLSessionDataTask()
        }
    }
    
    private class FakeURLSessionDataTask: URLSessionDataTask {}
}
