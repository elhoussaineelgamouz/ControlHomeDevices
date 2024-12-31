//
//  CoreDataManager.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 31/12/2024.
//

import CoreData
import Combine

class CoreDataManager {
    public let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "UserEntity")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Failed to load Core Data stack: \(error)")
            }
        }
    }

    // Save user data
    func saveUser(user: UserEntity) {
        let context = container.viewContext
        do {
            try context.save()
        } catch {
            print("Error saving user to Core Data: \(error)")
        }
    }

    // Fetch all users from Core Data
    func fetchUsers() -> AnyPublisher<[UserEntity], Error> {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest() // Specific fetch request for UserEntity
        do {
            let users = try container.viewContext.fetch(request)
            return Just(users)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
}
