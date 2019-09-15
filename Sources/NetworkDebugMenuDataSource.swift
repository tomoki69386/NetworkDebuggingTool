//
//  NetworkDebugMenuDataSource.swift
//  NetworkDebuggingTool
//
//  Created by 築山朋紀 on 2019/09/15.
//  Copyright © 2019 tomoki69386. All rights reserved.
//

import UIKit

public final class NetworkDebugMenuDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    public typealias Action = ((NetworkDebugSchema) -> Void)
    public var action: Action!
    
    public convenience init(with tableView: UITableView, action: @escaping Action) {
        self.init()
        self.action = action
        tableView.delegate = self
        tableView.dataSource = self
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return networkDebugSchemas.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = networkDebugSchemas[indexPath.row].url?.path
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let schema = networkDebugSchemas[indexPath.row]
        self.action(schema)
    }
}
