//
//  AppModel.swift
//  PreFetchLoading
//
//  Created by MACBOOK on 08/07/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import Foundation

//MARK: - AppModel
class AppModel: NSObject {
    static let shared = AppModel()
//    var currentUser: User!
    var isSocialLogin: Bool = Bool()
    var isGuestUser: Bool = Bool()
    var fcmToken: String = ""
    var token = ""
}
