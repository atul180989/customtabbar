//
//  ViewController.swift
//  CustomTabBar
//
//  Created by Ricky on 7/25/18.
//  Copyright © 2018 Ricky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    
    
    @IBAction func onTapButton(_ sender: Any) {
        
        print("Button Tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.navigationController?.navigationBar.topItem?.title = "Login"
        
        // Do any additional setup after loading the view.
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
