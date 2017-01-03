//
//  LeftView.swift
//  MyProject
//
//  Created by alfian on 28/12/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class LeftView: UIViewController {
    var presenter: IHomePresenter!
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        let nib = UINib(nibName: "MenuCell", bundle: nil)
        self.tableView?.registerNib(nib, forCellReuseIdentifier: "menuCell")
    }
}

extension LeftView: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath) as! MenuCell
        
        return cell
    }
}

extension LeftView: UITableViewDelegate {
    
}