//
//  Calculator_iOSApp.swift
//  Calculator-iOS
//
//  Created by Madison Isfan on 10/26/22.
//

import SwiftUI

@main
struct Calculator_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainScreen()
            
            /*
            VStack {
                Button("one"){}
                    .background()
            }*/
        }
    }
}
