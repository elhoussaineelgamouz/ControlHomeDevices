//
//  NotificationManager.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 31/12/2024.
//

import Foundation
import Firebase
import FirebaseMessaging
import Combine

class NotificationManager: ObservableObject {
    @Published var fcmToken: String?

    static let shared = NotificationManager()

    private init() {
       // Messaging.messaging().delegate = self
    }

    func fetchFCMToken() -> AnyPublisher<String, Error> {
        Future<String, Error> { promise in
            Messaging.messaging().token { token, error in
                if let error = error {
                    promise(.failure(error))
                } else if let token = token {
                    promise(.success(token))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - MessagingDelegate
/*extension NotificationManager: MessagingDelegate {
 func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
 self.fcmToken = fcmToken
 }
}*/
