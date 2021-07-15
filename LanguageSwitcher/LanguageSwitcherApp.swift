//
//  LanguageSwitcherApp.swift
//  LanguageSwitcher
//
//  Created by 范武 on 2021/7/14.
//

import SwiftUI

@main
struct LanguageSwitcherApp: App {
    //connect to App Delegate
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate{
    //status bar item
    var statusItem: NSStatusItem?
    
    //Popover
    var popOver = NSPopover()
    func applicationDidFinishLaunching(_ notificaiton:Notification) {
        // Menu View
        let menuView = ContentView()
        popOver.behavior = .transient
        popOver.animates = true
        popOver.contentViewController = NSHostingController(rootView: menuView)
        popOver.contentSize = NSSize(width: 500, height: 500)
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        //safe check isf status Button is Available or not
        if let menuButton = statusItem?.button{
            menuButton.image = NSImage(named: "icon")
            menuButton.action = #selector(togglePopover(_:))
            
        }
        
    }
    
    @objc func togglePopover(_ sender: AnyObject){
        if let button = statusItem?.button{
            if popOver.isShown{
                popOver.performClose(sender)
            }else{
                popOver.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
