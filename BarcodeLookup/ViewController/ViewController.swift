//
//  ViewController.swift
//  BarcodeLookup
//
//  Created by Nghia Nguyen on 5/28/18.
//  Copyright © 2018 Nghia Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let dataResultPresenter = DataResultPresenter(service: LookupService.shared)
    private var dataResultViewData: DataResultViewData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataResultPresenter.attachView(view: self)
        dataResultPresenter.fillUpcData(upcCode: "0885909950805")
    }
}

extension ViewController: DataResultView {
    func startLoading() {
        print("Start loading...")
    }
    
    func finishLoading() {
        print("End loading...")
    }
    
    func setUpcData(_ upc: Upc) {
        dataResultViewData = DataResultViewData(upc: upc)
        print(dataResultViewData?.upc)
    }
}
