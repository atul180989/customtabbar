
//
//  MoreViewController.swift
//  CustomTabBar
//
//  Created by Ricky on 7/25/18.
//  Copyright © 2018 Ricky. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    var items = ["first",
                 "first2",
                 "first3",
                 "first4",
                 "first5",
                 "first6",
                 "first7",
                 ]
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)

      //  view.backgroundColor = UIColor.clear
      //  view.isOpaque = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
