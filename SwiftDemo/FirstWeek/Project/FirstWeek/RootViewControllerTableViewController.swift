//
//  RootViewControllerTableViewController.swift
//  FirstWeek
//
//  Created by 刘浩 on 2017/10/16.
//  Copyright © 2017年 HarwordLiu. All rights reserved.
//

import UIKit

class RootViewControllerTableViewController: UITableViewController {
    
    let dataSources = ["First", "Second", "Third", "Fourth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSources.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rootCellReuseIdentifier", for: indexPath)
        cell.textLabel?.text = dataSources[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let controllerClass:AnyClass = NSClassFromString(nameSpace + "." + dataSources[indexPath.row] + "ViewController")!
        let realClass = controllerClass as! UIViewController.Type
        let viewController = realClass.init()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
