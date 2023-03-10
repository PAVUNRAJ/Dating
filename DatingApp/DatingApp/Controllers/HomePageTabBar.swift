//
//  HomePageTabBar.swift
//  DatingApp
//
//  Created by PavunRaj on 10/03/23.
//

import UIKit

class HomePageTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        
        let attributes = [NSAttributedString.Key.font: CustomFont.CustomFontGilroySemiBold(size: 12)]
           UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
            UITabBar.appearance().tintColor = UIColor.black
     

    }
    

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == ConstantFile.discover {
            if let rootView = self.viewControllers![0] as? UINavigationController {
                rootView.popToRootViewController(animated: false)
            }
        } else if item.title == ConstantFile.noteTxt {
            if let rootView = self.viewControllers![1] as? UINavigationController {
                rootView.navigationBar.tintColor = UIColor.blue

                rootView.popToRootViewController(animated: false)
            }
        } else if item.title == ConstantFile.matches {
            if let rootView = self.viewControllers![2] as? UINavigationController {
                rootView.navigationBar.tintColor = UIColor.blue
                rootView.popToRootViewController(animated: false)
            }
        } else if item.title == ConstantFile.profile{
            if let rootView = self.viewControllers![3] as? UINavigationController {
                rootView.navigationBar.tintColor = UIColor.blue
                rootView.popToRootViewController(animated: false)
            }
        }
    }

}

