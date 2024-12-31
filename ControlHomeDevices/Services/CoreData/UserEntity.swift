//
//  UserEntity.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 31/12/2024.
//

extension UserEntity {
    func toUser() -> User {
        return User(
            userId: self.userId ?? "",
            userFirstName: self.userFirstName ?? "",
            userLastName: self.userLastName ?? ""
        )
    }
}
