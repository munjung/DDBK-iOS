//
//  AppDelegate.swift
//  team2z
//
//  Created by 김대섭 on 2019. 1. 20..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit
import DropDown
import IQKeyboardManagerSwift

protocol AppSplashController {
    var splashView: UIView { get }
    
    func toggleSplashView(hide: Bool)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppSplashController {

    var window: UIWindow?
    
    private lazy var baseViewController = {
        BaseViewController()
    }()

    var splashView: UIView = UIView()
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        DropDown.startListeningToKeyboard()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 사용자 검색 기록 초기화
        if UserDefaults.standard.array(forKey: "homeSearchHistory") == nil {
            UserDefaults.standard.set([], forKey: "homeSearchHistory")
            print("사용자 검색 기록 배열을 초기화 하였습니다.")
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = baseViewController
        window?.makeKeyAndVisible()
        
//        displaySplashAnimation()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarTintColor = .white
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
        IQKeyboardManager.shared.placeholderFont = UIFont(name: "Times New Roman", size: 13)
//        IQKeyboardManager.shared.text
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//        toggleSplashView(hide: false)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    private func displaySplashAnimation() {
        let splashView = self.splashView
//        splashView.backgroundColor = UIColor(cgColor: )
        window!.addSubview(splashView)
        splashView.snp.makeConstraints { make in
            make.edges.equalTo(window!)
        }
        
//        let circleView = UIView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(259), height: CGFloat(259)))
//        circleView.backgroundColor = .white
//        circleView.layer.borderWidth = 0
//        circleView.layer.masksToBounds = false
//        circleView.layer.cornerRadius = circleView.frame.height/2
//        circleView.clipsToBounds = true
//        //0.675
//        splashView.addSubview(circleView)
//        circleView.snp.makeConstraints { make in
//            make.center.equalTo(splashView)
//        }
        
        let logoImage = UIImageView(image: UIImage(named: "logo_image"))
        splashView.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.center.equalTo(splashView)
        }
        
        let animationDuration = 0.25
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: UIView.AnimationOptions(), animations: {
            logoImage.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1.0)
        }, completion: { success in
            UIView.animate(withDuration: animationDuration, delay: 0.0, options: UIView.AnimationOptions(), animations: {
                splashView.alpha = 0
                logoImage.layer.transform = CATransform3DMakeScale(2.0, 2.0, 1.0)
            }, completion: { success in
                splashView.isHidden = true
                logoImage.layer.transform = CATransform3DIdentity
            })
        })
    }

    func toggleSplashView(hide: Bool) {
        let duration = 0.25
//        splashView.animateHidden(hide, duration: duration)
        
        if !hide {
//            browserViewController.deactivateUrlBarOnHomeView()
        } else {
//            browserViewController.activateUrlBarOnHomeView()
        }
    }
}

