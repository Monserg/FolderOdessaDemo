//
//  QuestionShowRouter.swift
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

// MARK: - Input & Output protocols
@objc protocol QuestionShowRoutingLogic {
    func routeToFolderShowScene()
}

protocol QuestionShowDataPassing {
    var dataStore: QuestionShowDataStore? { get }
}

class QuestionShowRouter: NSObject, QuestionShowRoutingLogic, QuestionShowDataPassing {
    // MARK: - Properties
    weak var viewController: QuestionShowViewController?
    var dataStore: QuestionShowDataStore?
    
    
    // MARK: - Routing
    func routeToFolderShowScene() {
        let destinationVC = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "FolderShowVC")) as! FolderShowViewController
        var destinationDS = destinationVC.router!.dataStore!
        
        passDataToFolderShowScene(source: dataStore!, destination: &destinationDS)
        navigateToFolderShowScene(source: viewController!, destination: destinationVC)
    }
    
    
    // MARK: - Navigation
    func navigateToFolderShowScene(source: QuestionShowViewController, destination: FolderShowViewController) {
        source.handlerFindSuccessfullCompletion!()
        source.dismissViewController(source)
    }
    
    
    // MARK: - Passing data
    func passDataToFolderShowScene(source: QuestionShowDataStore, destination: inout FolderShowDataStore) {
        destination.folderURL = source.folderURL!
    }
}
