//
//  FolderShowInteractor.swift
//  FolderOdessaDemo
//
//  Created by msm72 on 04.10.2017.
//  Copyright (c) 2017 RemoteJob. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Cocoa

// MARK: - Business Logic protocols
protocol FolderShowBusinessLogic {
    func doSomething(request: FolderShowModels.Something.RequestModel)
}

protocol FolderShowDataStore {
    //var name: String { get set }
}

class FolderShowInteractor: FolderShowBusinessLogic, FolderShowDataStore {
    // MARK: - Properties
    var presenter: FolderShowPresentationLogic?
    var worker: FolderShowWorker?
    //var name: String = ""
    
    
    // MARK: - Business logic implementation
    func doSomething(request: FolderShowModels.Something.RequestModel) {
        worker = FolderShowWorker()
        worker?.doSomeWork()
        
        let responseModel = FolderShowModels.Something.ResponseModel()
        presenter?.presentSomething(response: responseModel)
    }
}
