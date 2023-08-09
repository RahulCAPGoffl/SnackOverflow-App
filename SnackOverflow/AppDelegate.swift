//  AppDelegate.swift
//  SnackOverflow

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {                         /// new class name AppDelegate which conforms UIApplicationDelegate protocol
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }                                                              ///function is called when app finishes launcing---> returns boolean value to specify whether the launch was successful
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }                                                              ///function is a part of UISceneSession Lifecycle, this is called when a new scene is created
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }                                                              ///function written when system discards one or more scene session or when a user closes a specific scene.....no function is written here----can be added if required
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {                              ///NSPersistentContainer is a property type which is a part of core data framework
        
        let container = NSPersistentContainer(name: "SnackOverflow")                     ///new instance of NSPersistentContainer is created with the name "SnackOverflow"
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in ///this method is called on container to load persistent stores
            if let error = error as NSError? {                                           /// to check if any error occurs during loading persistent stores
                fatalError("Unresolved error \(error), \(error.userInfo)")               /// if there is an error app will crash
            }
        })
        return container                                                                 /// if is successful the NSPersistentContainer is returned
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {                                                                /// for saving changes inn coredata
        let context = persistentContainer.viewContext                                    ///object context is the main object in coredata
        if context.hasChanges {                                                          /// checks whether context has any unsaved changes
            do {
                try context.save()                                                       /// if there are unsaved changes, .save() saves them to persistent store
            } catch {                                                                    /// if there is an error in saving operation it goes to catch block
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")           /// app is crashed
            }
        }
    }
    
}
