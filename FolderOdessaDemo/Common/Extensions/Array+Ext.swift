//
//  Array+Ext.swift
//  FolderOdessaDemo
//
//  Created by msm72 on 12.10.2017.
//  Copyright © 2017 RemoteJob. All rights reserved.
//

import Foundation
import FilesProvider

extension Array {
    func orderedBy(_ orderedBy: String, ascending: Bool) -> [FileObject] {
        var sortedFiles: [FileObject] = []
       
        switch orderedBy {
        case "name":
            sortedFiles = (self as! [FileObject]).sorted {
                return sortMetadata(lhsIsFolder: true,
                                    rhsIsFolder: true,
                                    ascending: ascending,
                                    attributeComparation: itemComparator(lhs: $0.name, rhs: $1.name, ascending: ascending))
            }
        
        case "size":
            sortedFiles = (self as! [FileObject]).sorted {
                return sortMetadata(lhsIsFolder: true,
                                    rhsIsFolder: true,
                                    ascending: ascending,
                                    attributeComparation: itemComparator(lhs: $0.size, rhs: $1.size, ascending: ascending))
            }
        
        case "modifyDate":
            sortedFiles = (self as! [FileObject]).sorted {
                return sortMetadata(lhsIsFolder: true,
                                    rhsIsFolder: true,
                                    ascending: ascending,
                                    attributeComparation: itemComparator(lhs: $0.modifiedDate!, rhs: $1.modifiedDate!, ascending: ascending))
            }
       
        default:
            break
        }
        
        return sortedFiles
    }

    func sortMetadata(lhsIsFolder: Bool, rhsIsFolder: Bool,  ascending: Bool, attributeComparation: Bool) -> Bool {
        if (lhsIsFolder && !rhsIsFolder) {
            return ascending ? true : false
        } else if (!lhsIsFolder && rhsIsFolder) {
            return ascending ? false : true
        }
        
        return attributeComparation
    }

    func itemComparator<T: Comparable>(lhs: T, rhs: T, ascending: Bool) -> Bool {
        return ascending ? (lhs < rhs) : (lhs > rhs)
    }

//    static public func ==(lhs: self, rhs: self) -> Bool {
//        if lhs.compare(rhs) == .orderedSame {
//            return true
//        }
//
//        return false
//    }
//
//    static public func <(lhs: Date, rhs: Date) -> Bool {
//        if lhs.compare(rhs) == .orderedAscending {
//            return true
//        }
//
//        return false
//    }
}
