//
//  IDCardViewController.swift
//  CustomTabBar
//
//  Created by Ricky on 26/07/18.
//  Copyright © 2018 Ricky. All rights reserved.
//

import UIKit

class IDCardViewController: ViewController {

    @IBAction func onTapBtn(_ sender: Any) {
        myLabel.text = "Button Tapped"
        
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        //Instantiate View Controller
        let newViewController = storyboard.instantiateViewController(withIdentifier: "forgetpassvc") as! ForgetPassViewController
        
        self.navigationController?.pushViewController(newViewController, animated: false)
        
    }
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

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
