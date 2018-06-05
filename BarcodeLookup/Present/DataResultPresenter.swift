//
//  DataResultPresenter.swift
//  BarcodeLookup
//
//  Created by Nghia Nguyen on 6/5/18.
//  Copyright © 2018 Nghia Nguyen. All rights reserved.
//

import Foundation

class DataResultPresenter {
    private let lookupService: LookupService
    weak private var dataResultView: DataResultView?
    
    init(service: LookupService) {
        self.lookupService = service
    }
    
    func attachView(view: DataResultView) {
        dataResultView = view
    }
    
    func detachView() {
        dataResultView = nil
    }
    
    func fillUpcData(upcCode: String) {
        dataResultView?.startLoading()
        lookupService.lookup(upc: upcCode) { [unowned self ](upc) in
            self.dataResultView?.finishLoading()
            self.dataResultView?.setUpcData(upc!)
        }
    }
}
