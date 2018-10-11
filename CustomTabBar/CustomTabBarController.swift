//
//  CustomTabBarController.swift
//  CustomTabBar
//
//  Created by Ricky on 7/25/18.
//  Copyright © 2018 Ricky. All rights reserved.
//

import UIKit
extension UIApplication {
    var screenShot: UIImage?  {
        return keyWindow?.layer.screenShot
    }
}
extension CALayer {
    var screenShot: UIImage?  {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshot
        }
        return nil
    }
}
extension UIImage {
    func getPixelColor(atLocation location: CGPoint, withFrameSize size: CGSize) -> UIColor {
        let x: CGFloat = (self.size.width) * location.x / size.width
        let y: CGFloat = (self.size.height) * location.y / size.height
        let pixelPoint: CGPoint = CGPoint(x: x, y: y)
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        let pixelIndex: Int = ((Int(self.size.width) * Int(pixelPoint.y)) + Int(pixelPoint.x)) * 4
        let r = CGFloat(data[pixelIndex]) / CGFloat(255.0)
        let g = CGFloat(data[pixelIndex+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelIndex+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelIndex+3]) / CGFloat(255.0)
        return UIColor(red: b, green: g, blue: r, alpha: a)
    }
}
class CustomTabBarController: UITabBarController,UITabBarControllerDelegate,UIPopoverPresentationControllerDelegate {
    
    var moreView:UIView!
    var moreVC:MoreViewController!
    var viewWidth:CGFloat = 0
    var viewHeight:CGFloat = 0
    let bottomBarHeight = CGFloat(50.0)
    var image:UIImage? = nil
    var color:UIColor? = nil
    var currentView: Int? = nil
    var prevView: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func captureScreen() -> UIImage? {
        if let window = UIApplication.shared.keyWindow {
            UIGraphicsBeginImageContextWithOptions(window.bounds.size, false,
                                                   UIScreen.main.scale)
            self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
            let theScreenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return theScreenshot
        }
        return nil
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return  .none
    }
    override func viewDidLayoutSubviews() {
        viewWidth = self.view.frame.width/2
        viewHeight = self.view.frame.height/3
        setupMoreView()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        prevView = tabBarController.selectedIndex
        if viewController.isKind(of: OtherViewController.self)
        {
            if let image = captureScreen()
            {
                self.image = image
                color = self.image?.getPixelColor(atLocation: CGPoint(x: 25, y: 25),withFrameSize: (self.image?.size)!)
            }//UIApplication.shared.screenShot
            self.moreView.isHidden = false
            return true
        }
        else
        {
            hideMoreView()
        }
         return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        currentView = tabBarController.selectedIndex
        if viewController.isKind(of: OtherViewController.self)
        {
            if let vc = viewController as? OtherViewController
            {
                vc.backgroundImage.image = self.image
                vc.view.backgroundColor = color
            }
        }
    }
    func setupMoreView()
    {
        moreView = UIView(frame: CGRect(x: self.view.frame.width - viewWidth, y: self.view.frame.height - viewHeight - 50, width: viewWidth, height: viewHeight))
        moreView.backgroundColor = UIColor.blue
        moreVC = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
        moreVC.view.frame = moreView.bounds
        addChildViewController(moreVC)
        moreView.addSubview(moreVC.view)
        moreVC.didMove(toParentViewController: self)
        self.view.addSubview(moreView)
        moreView.isHidden = true
    }
    func hideMoreView()
    {
        if moreView != nil
        {
            moreView.isHidden = true
        }
    }
}


