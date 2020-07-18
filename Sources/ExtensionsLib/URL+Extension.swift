//
//  Created by TCS.
//  Copyright © 2020 TCS. All rights reserved.
// 

import Foundation

extension URL {
    
    /// Category for URL
    /// - Parameter category: String Type
    static public func news(for category: String) -> URL {
        makeForEndpoint("\(category)")
    }
    
    /// News URL Endpoint
    /// - Parameter category: String Type
    static public func makeForEndpoint(_ category: String) -> URL {
        URL(string: "https://newsapi.org/v2/top-headlines?category=\(category)&country=us&apiKey=6a3ce0a5c952460fb0ea2fd9163d9ddf")!
    }
}
