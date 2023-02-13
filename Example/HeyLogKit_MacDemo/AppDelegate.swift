//
//  AppDelegate.swift
//  HeyLogKit_MacDemo
//
//  Created by black2w on 2023/2/9.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Cocoa
import HeyLogKit

@available(macOS 13.0, *)
@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        var windowController = WindowController()
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



