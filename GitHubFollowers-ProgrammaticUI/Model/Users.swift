//
//  Users.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 26.06.2022.
//

import Foundation

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
