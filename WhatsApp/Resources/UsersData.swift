//
//  UsersData.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 24/01/2022.
//

import Foundation

struct UserDataModel {
    let callData            : String
    let userName            : String
    let direction           : Bool
    let lastMessage         : String
    let lastConnection      : String
    let nonViewedMessage    : Int
    
    static func getList() -> [UserDataModel]{
        let list = [
            UserDataModel(callData: "18 de enero 14:24",  userName: "Jorge Pan",      direction: true,
                          lastMessage: "Chau",
                          lastConnection: "15:54", nonViewedMessage: 0 ),
            UserDataModel(callData: "7 de enero 17:57",   userName: "Pablito",        direction: false,
                          lastMessage: "No se", lastConnection: "15:54", nonViewedMessage: 0 ),
            UserDataModel(callData: "27/12/2021 07:42",   userName: "Uli",            direction: false,
                          lastMessage: "Vos decis?",
                          lastConnection: "15:54", nonViewedMessage: 3 ),
            UserDataModel(callData: "12/12/2021 23:01",   userName: "Sergio Gandara", direction: true,
                          lastMessage: "No te puedo creer hermano",
                          lastConnection: "15:54", nonViewedMessage: 2  ),
            UserDataModel(callData: "25/11/2021 10:12",   userName: "El presi",       direction: false,
                          lastMessage: "Mas te vale que no te encuentre",
                          lastConnection: "15:54", nonViewedMessage: 1 )
        ]
        return (list+list+list+list+list)
    }
}
