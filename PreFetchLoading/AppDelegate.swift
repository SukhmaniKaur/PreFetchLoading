//
//  AppDelegate.swift
//  PreFetchLoading
//
//  Created by MACBOOK on 06/07/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var activityLoader : NVActivityIndicatorView!
    var backView: UIView!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    //MARK:- showLoader
    func showLoader()
    {
        removeLoader()
        backView?.isUserInteractionEnabled = false
        backView = UIView(frame: UIScreen.main.bounds)
        backView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        activityLoader = NVActivityIndicatorView(frame: CGRect(x: ((backView?.frame.size.width)!-50)/2, y: ((backView?.frame.size.height)!-50)/2, width: 50, height: 50))
        activityLoader.type = .ballScaleMultiple
        activityLoader.color = AppColors.LoaderColor
        backView.addSubview(activityLoader)
        activityLoader.startAnimating()
        UIApplication.shared.keyWindow?.addSubview(backView)
        UIApplication.shared.keyWindow?.bringSubviewToFront(backView)
        
    }
    
    //MARK: - removeLoader
    func removeLoader()
    {
        
        backView?.isUserInteractionEnabled = true
        if activityLoader == nil
        {
            return
        }
        activityLoader.stopAnimating()
        backView.removeFromSuperview()
        activityLoader = nil
    }
    
    //MARK: - sharedDelegate
    func sharedDelegate() -> AppDelegate
    {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

