//
//  AppDelegate.swift
//  HeyLogKit_MacDemo
//
//  Created by black2w on 2023/2/9.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var windowController = WindowController()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let wc = WindowController.init(windowNibName: "WindowController")
        wc.window?.makeKeyAndOrderFront(nil)
        windowController = wc
    }
    
    
    
   

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}



