
//  AppDelegate.swift
//  NativX_2
//
//  Created by Sean Coleman on 5/17/16.
//  Copyright © 2016 Sean Coleman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FBSDKCoreKit
import FBSDKLoginKit
import TwitterKit
import Fabric

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //Configure Firebase
        FIRApp.configure()
        
        // Configure Facebook Login
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // Configure Twitter Login
        Twitter.sharedInstance().startWithConsumerKey("2FeaO2uQtMapdKfyYow4UWIBY", consumerSecret: "g0cwSiBhGhHhviwYY49mxAbe3KJevnvD1ziOLqDhy8J8jfAs61")
        
        Fabric.with([Twitter.self])
        
        UINavigationBar.appearance().barTintColor = nativxColor
        application.statusBarStyle = .LightContent
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

        
        // Override point for customization after application launch.
        return true
    }
    
    // Facebook URL
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        return FBSDKApplicationDelegate.sharedInstance().application(application,
                                                                     openURL: url,
                                                                     sourceApplication: sourceApplication,
                                                                     annotation: annotation)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
        FBSDKAppEvents.activateApp()
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

 
    }

    func loginButton(FoginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        // returning an error if facebook login does not work
        
        

    func didCompleteWithResult (application: UIApplication) {
        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
            // get a credential for each user that signs in
            
            FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
                // authenticate facebook login with firebase
            }
        }
        try! FIRAuth.auth()!.signOut()
        //call user to sign out from facebook

        }
    }
