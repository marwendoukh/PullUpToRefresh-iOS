//
//  ViewController.swift
//  PullUpToRefresh
//
//  Created by Marwen Doukh on 25.07.19.
//  Copyright © 2019 Marwen Doukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PullUpToRefreshDelegate {
    
    @IBOutlet weak var tableview: PullUpToRefreshTableview?
    let bottom = CustomBottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the distance required to scroll , after that the DidPullUp will be fired
        self.tableview?.refreshThreshold = 20
        // set the distance required to scroll , after that the bottomView will show up
        self.tableview?.differenceThreshold = 100
        // set the bottom view frame
        self.bottom.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50)
        self.tableview?.bottomView = self.bottom
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? MyCustomCell
        cell?.label?.text = "cell \(indexPath.row)"
        return cell ?? UITableViewCell()
    }
    
    func tableviewDidPullUp() {
        debugPrint("did pull up")
    }
    
    func tableviewDidScroll() {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}

