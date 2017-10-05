//
//  QuestionShowWorker.swift
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

class QuestionShowWorker {
    // MARK: - Business Logic
    func folderExists(atPath path: String) -> Bool {
        var isFolder = ObjCBool(true)
        let exists = FileManager.default.fileExists(atPath: path, isDirectory: &isFolder)
        
        return exists && isFolder.boolValue
    }
    
    func doSomeWork() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        do {
            let items = try fm.contentsOfDirectory(atPath: path)
            
            for item in items {
                print("Found \(item)")
            }
        } catch {
            // failed to read directory – bad permissions, perhaps?
        }
    }
}
