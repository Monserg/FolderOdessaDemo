//
//  FolderShowWorker.swift
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
import FilesProvider

class FolderShowWorker {
    // MARK: - Business Logic
    func loadFolderContext(_ completion: @escaping (_ data: [FileObject]) -> ()) {
        // Get list of files in a directory
        FolderManager.instance.fileProvider.contentsOfDirectory(path: "/", completionHandler: { contents, error in
            var files = [FileObject]()
            
            for file in contents {
                print("Name: \(file.name)")
                print("Size: \(file.size)")
                print("Creation Date: \(String(describing: file.creationDate))")
                print("Modification Date: \(String(describing: file.modifiedDate))")
                print("Path: \(String(describing: file.path))")

                files.append(file)
            }
            
            completion(files)
        })
    }
}
