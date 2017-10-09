//
//  FileManager+Ext.swift
//  FolderOdessaDemo
//
//  Created by msm72 on 06.10.2017.
//  Copyright © 2017 RemoteJob. All rights reserved.
//

import Foundation

extension FileManager.SearchPathDirectory {
    /*
     // Supported applications (/Applications).
     case applicationDirectory                      =   1
     
     // Unsupported applications and demonstration versions.
     case demoApplicationDirectory                  =   2
     
     // Developer applications (/Developer/Applications).
     case developerApplicationDirectory             =   3
     
     // System and network administration applications.
     case adminApplicationDirectory                 =   4
     
     // Various user-visible documentation, support, and configuration files (/Library).
     case libraryDirectory                          =   5
     
     // Developer resources (/Developer).
     case developerDirectory                        =   6
     
     // User home directories (/Users).
     case userDirectory                             =   7
     
     // Documentation.
     case documentationDirectory                    =   8
     
     // Document directory.
     case documentDirectory                         =   9
     
     // Location of core services (System/Library/CoreServices).
     case coreServiceDirectory                      =   10
     
     // Location of user’s autosaved documents Library/Autosave Information
     case autosavedInformationDirectory             =   11
     
     // Location of user’s desktop directory.
     case desktopDirectory                          =   12
     
     // Location of discardable cache files (Library/Caches).
     case cachesDirectory                           =   13
     
     // Location of application support files (Library/Application Support).
     case applicationSupportDirectory               =   14
     
     // Location of the user’s downloads directory.
     case downloadsDirectory                        =   15
     
     // Location of Input Methods (Library/Input Methods)
     case inputMethodsDirectory                     =   16
     
     // Location of user's Movies directory (~/Movies)
     case moviesDirectory                           =   17
     
     // Location of user's Music directory (~/Music)
     case musicDirectory                            =   18
     
     // Location of user's Pictures directory (~/Pictures)
     case picturesDirectory                         =   19
     
     // Location of system's PPDs directory (Library/Printers/PPDs)
     case printerDescriptionDirectory               =   20
     
     // Location of user's Public sharing directory (~/Public)
     case sharedPublicDirectory                     =   21
     
     // Location of the PreferencePanes directory for use with System Preferences (Library/PreferencePanes)
     case preferencePanesDirectory                  =   22
     
     // Location of the user scripts folder for the calling application (~/Library/Application Scripts/<code-signing-id>
     case applicationScriptsDirectory               =   23
     
     // Passed to the FileManager method url(for:in:appropriateFor:create:) in order to create a temporary directory.
     case itemReplacementDirectory                  =   99
     
     // All directories where applications can occur.
     case allApplicationsDirectory                  =   100
     
     // All directories where resources can occur.
     case allLibrariesDirectory                     =   101
     
     // Location of the trash directory.
     case trashDirectory                            =   102
     */
    
    static let allValues = [    [1: "applicationDirectory"],
                                [2: "demoApplicationDirectory"],
                                [3: "developerApplicationDirectory"],
                                [4: "adminApplicationDirectory"],
                                [5: "libraryDirectory"],
                                [6: "developerDirectory"],
                                [7: "userDirectory"],
                                [8: "documentationDirectory"],
                                [9: "documentDirectory"],
                                [10: "coreServiceDirectory"],
                                [11: "autosavedInformationDirectory"],
                                [12: "desktopDirectory"],
                                [13: "cachesDirectory"],
                                [14: "applicationSupportDirectory"],
                                [15: "downloadsDirectory"],
                                [16: "inputMethodsDirectory"],
                                [17: "moviesDirectory"],
                                [18: "musicDirectory"],
                                [19: "picturesDirectory"],
                                [20: "printerDescriptionDirectory"],
                                [21: "sharedPublicDirectory"],
                                [22: "preferencePanesDirectory"],
                                [23: "applicationScriptsDirectory"],
                                [99: "itemReplacementDirectory"],
                                [100: "allApplicationsDirectory"],
                                [101: "allLibrariesDirectory"],
                                [102: "trashDirectory"]
                            ]
}

