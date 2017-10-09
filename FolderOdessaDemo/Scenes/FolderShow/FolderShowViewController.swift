//
//  FolderShowViewController.swift
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
import PagedArray

// MARK: - Input & Output protocols
protocol FolderShowDisplayLogic: class {
    func displayLoadFolderContext(fromViewModel viewModel: FolderShowModels.Folder.ViewModel)
}

// MARK: - Pagination
let paginationDisplayedRows = 10
let paginationPageSize = 25
var paginationTotalCount = 2000

class FolderShowViewController: NSViewController {
    // MARK: - Properties
    var interactor: FolderShowBusinessLogic?
    var router: (NSObjectProtocol & FolderShowRoutingLogic & FolderShowDataPassing)?
    
    var displayedFiles: [FolderShowModels.Folder.ViewModel.DisplayedFolder] = []

    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: NSTableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    
    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }
    
    
    // MARK: - Setup
    private func setup() {
        let viewController          =   self
        let interactor              =   FolderShowInteractor()
        let presenter               =   FolderShowPresenter()
        let router                  =   FolderShowRouter()
        
        viewController.interactor   =   interactor
        viewController.router       =   router
        interactor.presenter        =   presenter
        presenter.viewController    =   viewController
        router.viewController       =   viewController
        router.dataStore            =   interactor
    }
    
    
    // MARK: - Routing
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show modal NSOpenPanel
        if let path = OpenPanelManager().open() {
            if FolderManager.instance.fileProvider == nil {
                FolderManager.instance.fileProviderCreate(withURL: path)
            }
            
            // Read selected folder context
            contextLoad()
            
            // Create folder observer
            FolderManager.instance.fileProvider.registerNotifcation(path: "/", eventHandler: {
                self.contextLoad()
            })
        }
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
    }
    
    
    // MARK: - Custom Functions
    func contextLoad() {
        let requestModel = FolderShowModels.Folder.RequestModel()
        self.interactor?.loadFolderContext(withRequestModel: requestModel)
    }
}


// MARK: - NSTableViewDataSource
extension FolderShowViewController: NSTableViewDataSource {
    fileprivate enum CellIdentifiers {
        static let NameCell = "NameCell"
        static let DateCell = "DateCell"
        static let SizeCell = "SizeCell"
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return displayedFiles.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var text: String = ""
        var cellIdentifier: String = ""
        
        let file = displayedFiles[row]

        switch tableColumn {
        // Name + icon
        case tableView.tableColumns[0]?:
            text = file.name
            cellIdentifier = CellIdentifiers.NameCell

        // Modify date
        case tableView.tableColumns[1]?:
            text = file.modifyDate
            cellIdentifier = CellIdentifiers.DateCell

        // Size
        case tableView.tableColumns[2]?:
            text = file.size
            cellIdentifier = CellIdentifiers.SizeCell

        default:
            break
        }
        
        // Cell config
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            
            if tableColumn == tableView.tableColumns[0] {
                cell.imageView?.image = file.isFolder ? NSImage(named: NSImage.Name(rawValue: "icon-folder")) : NSWorkspace.shared.icon(forFileType: file.ext)
            }
            
            print(row)
            return cell
        }
     
        return nil
    }
}


// MARK: -
extension FolderShowViewController: NSTableViewDelegate {
    
}


// MARK: - FolderShowDisplayLogic
extension FolderShowViewController: FolderShowDisplayLogic {
    func displayLoadFolderContext(fromViewModel viewModel: FolderShowModels.Folder.ViewModel) {
        displayedFiles = viewModel.displayedFolders
        paginationTotalCount = displayedFiles.count
        
        DispatchQueue.main.async {
            
//                        self.tableView.reloadData(forRowIndexes: IndexSet(integersIn: Range(0...90)),
//                                      columnIndexes: IndexSet(integersIn: Range(0..<self.tableView.numberOfColumns)))


            self.tableView.reloadData()
        }
    }
}
