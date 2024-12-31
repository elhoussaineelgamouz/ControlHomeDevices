//
//  UserEntity.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 31/12/2024.
//

/*import CoreData

@objc(UserEntity)
public class UserEntity: NSManagedObject {
    @NSManaged public var userId: String?
    @NSManaged public var userFirstName: String?
    @NSManaged public var userLastName: String?
}*/

extension UserEntity {
    func toUser() -> User {
        return User(
            userId: self.userId ?? "",
            userFirstName: self.userFirstName ?? "",
            userLastName: self.userLastName ?? ""
        )
    }
}
