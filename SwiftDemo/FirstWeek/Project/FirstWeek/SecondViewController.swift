//
//  SecondViewController.swift
//  FirstWeek
//
//  Created by 刘浩 on 2017/10/16.
//  Copyright © 2017年 HarwordLiu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dataSources = ["A" : ["1234", "2345"],
                       "B" : ["1234123", "41234123412341"],
                       "K" : ["1234413123", "41221343412341"],
                       "M" : ["1234123", "412341112342342341"],
                       "N" : ["123414123", "41234123412341"],
                       "D" : ["123412ASDF3", "41212343412341"],
                       "F" : ["12341ASDF23", "41212343412341"],
                       "U" : ["1234ASDF123", "41212343412341"],
                       "L" : ["123WAER4123", "4121234QWE3412341"],
                       "Z" : ["123ZSCV4123", "412QWER3412341"],
                       "P" : ["1234123", "41234QWERSFF12341"],]
    var dataKeys: Array<String>? = []
    var dataValues: Array<Array<String>>? = []
    
    var tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initData() {
        dataKeys = dataSources.keys.sorted()
        for key in dataKeys! {
            dataValues?.append(dataSources[key]!)
        }
    }
    
    func initUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionFooterHeight = 0
        tableView.sectionHeaderHeight = 30
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SecondViewControllerCell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "SecondViewControllerHeader")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (dataKeys?.count)!
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataValues![section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SecondViewControllerHeader")
        header?.textLabel?.text = dataKeys?[section]
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondViewControllerCell")
        cell?.textLabel?.text = dataValues![indexPath.section][indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataKeys
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
