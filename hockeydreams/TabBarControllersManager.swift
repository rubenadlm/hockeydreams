//
//  TabBarControllersManager.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit

class TabBarControllersManager {
    static let sharedInstance = TabBarControllersManager()
    private init() {} //This prevents others from using the default '()' initializer for this class.

    func viewControllers() -> [UIViewController] {
        let listViewController = ListViewController()
        listViewController.title = "List"
        listViewController.tabBarItem.image = ThemeImage.list.rawImage()
        let settingsViewController = SettingsViewController()
        settingsViewController.title = "Settings"
        settingsViewController.tabBarItem.image = ThemeImage.settings.rawImage()
        
        return [listViewController, settingsViewController]
    }
}
