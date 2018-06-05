//
//  LockupService.swift
//  BarcodeLookup
//
//  Created by Nghia Nguyen on 6/5/18.
//  Copyright © 2018 Nghia Nguyen. All rights reserved.
//

import Foundation

class LookupService {
    public static let shared = LookupService()
    private init() { }
    
    let defaultSession = URLSession(configuration: .default)
    let upcProviderUrl = "https://api.upcitemdb.com/prod/trial/lookup?upc="
    
    public func lookup(upc: String, completed: @escaping (Upc?) -> Void) {
        let fullUrl = upcProviderUrl + upc
        let requestUrl = URLRequest(url: URL(string: fullUrl)!)
        let task = defaultSession.dataTask(with: requestUrl) { (data, respone, error) in
            if error == nil {
                let upc = try? JSONDecoder().decode(Upc.self, from: data!)
                completed(upc)
                return
            }
            completed(nil)
        }
        task.resume()
    }
}
