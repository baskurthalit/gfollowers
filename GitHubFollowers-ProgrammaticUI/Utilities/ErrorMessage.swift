//
//  ErrorMessage.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 27.06.2022.
//

import Foundation

enum GFError : String, Error {
    case invalidUsername = "This username created an invalid request. Please try again. \n❗️"
    case unableToComplete = "Unable to complete your request. Please chech your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again. 🌍"
    case invalidData = "The data received from the server was invalid. please try again."
    
}
