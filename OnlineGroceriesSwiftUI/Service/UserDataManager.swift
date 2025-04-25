//
//  SaveUserData.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Isuru Manawadu on 2025-04-25.
//

import Foundation

class UserDataManager {
    static let shared = UserDataManager()

//    private let firstNameKey = "firstName"
//    private let lastNameKey = "lastName"
//    private let emailKey = "email"
//    private let userIdKey = "userId"
    
    var id: Int = 0
    var username: String = "userName"
    var name: String = "name"
    var email: String = "email"
    var mobile: String = "mobile"
    var mobileCode: String = "mobileCode"
    var authToken: String = "authToken"

    private init() {}

    // Save user data
    func saveUser(user: UserModel) {
//        UserDefaults.standard.set(user.id, forKey: id)
        UserDefaults.standard.set(user.username, forKey: username)
        UserDefaults.standard.set(user.name, forKey: name)
        UserDefaults.standard.set(user.email, forKey: email)
        UserDefaults.standard.set(user.mobile, forKey: mobile)
        UserDefaults.standard.set(user.mobileCode, forKey: mobileCode)
        UserDefaults.standard.set(user.authToken, forKey: authToken)
        
    }

    // Fetch user data
    func getUserData() -> UserModel {
        let username = UserDefaults.standard.string(forKey: username) ?? ""
        let name = UserDefaults.standard.string(forKey: name) ?? ""
        let email = UserDefaults.standard.string(forKey: email) ?? ""
        let mobile = UserDefaults.standard.string(forKey: mobile) ?? ""
        let mobileCode = UserDefaults.standard.string(forKey: mobileCode) ?? ""
        let authToken = UserDefaults.standard.string(forKey: authToken) ?? ""

        return UserModel(dict: <#NSDictionary#>)
    }
    
    func getCurrentUserID() -> String {
        let userId = UserDefaults.standard.string(forKey: username) ?? ""
        return userId
    }

    // Clear user data
    func clearUserData() {
        UserDefaults.standard.removeObject(forKey: username)
        UserDefaults.standard.removeObject(forKey: name)
        UserDefaults.standard.removeObject(forKey: email)
        UserDefaults.standard.removeObject(forKey: mobile)
        UserDefaults.standard.removeObject(forKey: mobileCode)
        UserDefaults.standard.removeObject(forKey: authToken)
    }
}
