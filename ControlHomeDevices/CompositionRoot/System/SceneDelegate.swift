//
//  SceneDelegate.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 26/12/2024.
//

import UIKit
import Firebase
import FirebaseMessaging

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator!
    var appFactory: AppFactory!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        FirebaseApp.configure()
        window = UIWindow(windowScene: scene as! UIWindowScene)
        let navigation = UINavigationController()
        appFactory = AppFactoryImp()
        appCoordinator = AppCoordinator(navigation: navigation, appFactory: appFactory, window: window)
        appCoordinator.start()

        // Request notification permissions
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self

        // Register for remote notifications (push notifications)
        registerForPushNotifications()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print("Permission denied for notifications.")
            }
        }
    }
}

extension SceneDelegate: UNUserNotificationCenterDelegate {
    // Handle notifications when the app is in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Display notifications while the app is in the foreground
        completionHandler([.alert, .badge, .sound])
    }

    // Handle notification tap events
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Handle the action when a notification is tapped
        completionHandler()
    }
}

extension SceneDelegate: MessagingDelegate {
    // This method is called when a new FCM token is generated.
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let fcmToken = fcmToken else { return }
    }

    // Optional: You can handle incoming messages here if you want to process the message while the app is in the foreground.
    /*func messaging(_ messaging: Messaging, didReceive remoteMessage: RemoteMessage) {
        // Handle the incoming remote message here
        print("Received remote message: \(remoteMessage.appData)")
    }*/
}

