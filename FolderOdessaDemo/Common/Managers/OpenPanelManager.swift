//
//  OpenPanelManager.swift
//  FolderOdessaDemo
//
//  Created by msm72 on 06.10.2017.
//  Copyright © 2017 RemoteJob. All rights reserved.
//

import Cocoa

class OpenPanelManager {
    // MARK: - Class Functions
    func open() -> URL? {
        let fileDialog = NSOpenPanel()
        fileDialog.prompt = "Select Folder"
        fileDialog.worksWhenModal = true
        fileDialog.allowsMultipleSelection = false
        fileDialog.canChooseDirectories = true
        fileDialog.canChooseFiles = false
        fileDialog.resolvesAliases = true
        fileDialog.runModal()
        
        return fileDialog.url
    }
}
