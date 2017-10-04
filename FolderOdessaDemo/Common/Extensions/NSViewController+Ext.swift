//
//  NSViewController+Ext.swift
//  FolderOdessaDemo
//
//  Created by msm72 on 04.10.2017.
//  Copyright © 2017 RemoteJob. All rights reserved.
//

import Cocoa

extension NSViewController {
    func alertViewShow() {
        let alert = NSAlert()
        alert.alertStyle = .informational
        alert.messageText = NSLocalizedString("Info", comment: "Info title message")
        alert.informativeText = NSLocalizedString("Please enter any folder name", comment: "Alert informative text")
        alert.addButton(withTitle: NSLocalizedString("Ok", comment: "Find alert action button"))
        
        alert.beginSheetModal(for: self.view.window!) { (returnCode) in
            print ("returnCode: ", returnCode)
        }
    }
}
