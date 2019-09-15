//
//  NetworkDebugMenu.swift
//  NetworkDebuggingTool
//
//  Created by 築山朋紀 on 2019/09/15.
//  Copyright © 2019 tomoki69386. All rights reserved.
//

import UIKit

final class NetworkDebugMenuViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Network debugging"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(cancel))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        
        _ = NetworkDebugMenuDataSource(with: tableView) { schema in
            print(schema)
        }
    }
    
    static func make() -> UINavigationController {
        let viewController = NetworkDebugMenuViewController()
        let navigationControlelr = UINavigationController(rootViewController: viewController)
        return navigationControlelr
    }
    
    @objc
    private func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
