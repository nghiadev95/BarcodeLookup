//
//  DataResultView.swift
//  BarcodeLookup
//
//  Created by Nghia Nguyen on 6/5/18.
//  Copyright © 2018 Nghia Nguyen. All rights reserved.
//

import Foundation

protocol DataResultView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUpcData(_ upc: Upc)
}
