//
//  Alert.swift
//  Food
//
//  Created by mohammad on 29/03/2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let badURL = AlertItem(title: Text("Server Error"), message: Text("Data received is not bad"), dismissButton: .default(Text("OK")))
    
    static let badResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from server"), dismissButton: .default(Text("OK")))
    
    static let badData = AlertItem(title: Text("Server Error"), message: Text("Invalid url"), dismissButton: .default(Text("OK")))
    
    static let notComplete = AlertItem(title: Text("Server Error"), message: Text("Data is not complete"), dismissButton: .default(Text("OK")))
}
