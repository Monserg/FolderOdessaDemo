//
//  FolderManager.swift
//  FolderOdessaDemo
//
//  Created by msm72 on 05.10.2017.
//  Copyright © 2017 RemoteJob. All rights reserved.
//

import Foundation
import FilesProvider

final class FolderManager {
    // MARK: - Properties
    static let instance = FolderManager()
    
    var fileProvider: LocalFileProvider! {
        didSet {
            fileProvider!.delegate = self
        }
    }

    
    // MARK: - Class Initialization
    private init() {}
    
    
    // MARK: - Class Functions
    func fileProviderCreate(withURL pathURL: URL) {
        fileProvider = LocalFileProvider(baseURL: pathURL)
    }
}


// MARK: - FileProviderDelegate
extension FolderManager: FileProviderDelegate {
    func fileproviderSucceed(_ fileProvider: FileProviderOperations, operation: FileOperationType) {
        switch operation {
        case .copy(source: let source, destination: let dest):
            print("\(source) copied to \(dest).")
            
        case .remove(path: let path):
            print("\(path) has been deleted.")
            
        default:
            print("\(operation.actionDescription) from \(operation.source) to \(String(describing: operation.destination)) succeed")
        }
    }
    
    func fileproviderFailed(_ fileProvider: FileProviderOperations, operation: FileOperationType, error: Error) {
        switch operation {
        case .copy(source: let source, destination: _):
            print("copy of \(source) failed.")
            
        case .remove:
            print("file can't be deleted.")
            
        default:
            print("\(operation.actionDescription) from \(operation.source) to \(String(describing: operation.destination)) failed")
        }
    }
    
    func fileproviderProgress(_ fileProvider: FileProviderOperations, operation: FileOperationType, progress: Float) {
        switch operation {
        case .copy(source: let source, destination: let dest):
            print("Copy\(source) to \(dest): \(progress * 100) completed.")
            
        default:
            break
        }
    }
}
