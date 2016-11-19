//
//  User.swift
//  MyProject
//
//  Created by alfian on 19/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserModel: Mappable {
    var id: Int?
    var name: String?
    var username: String?
    var htmlUrl: String?
    var avatarUrl: String?
    var bio: String?
    var location:String?
    var links:LinksModel?
    var bucketsCount: Int?
    var commentsReceivedCount: Int?
    var followersCount: Int?
    var followingsCount: Int?
    var likesCount: Int?
    var likesReceivedCount: Int?
    var projectsCount: Int?
    var reboundsReceivedCount: Int?
    var teamsCount: Int?
    var canUploadShot: Bool?
    var type: String?
    var pro: Bool?
    var bucketsUrl: String?
    var followersUrl: String?
    var followingUrl: String?
    var likesUrl: String?
    var shotsUrl: String?
    var teamsUrl: String?
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        htmlUrl <- map["html_url"]
        avatarUrl <- map["avatar_url"]
        bio <- map["bio"]
        location <- map["location"]
        links <- map["links"]
        bucketsCount <- map["buckets_count"]
        commentsReceivedCount <- map["comments_received_count"]
        followersCount <- map["followers_count"]
        followingsCount <- map["followings_count"]
        likesCount <- map["likes_count"]
        likesReceivedCount <- map["likes_received_count"]
        projectsCount <- map["projects_count"]
        reboundsReceivedCount <- map["rebounds_received_count"]
        teamsCount <- map["teams_count"]
        canUploadShot <- map["can_upload_shot"]
        type <- map["type"]
        pro <- map["pro"]
        bucketsUrl <- map["buckets_url"]
        followersUrl <- map["followers_url"]
        followingUrl <- map["following_url"]
        likesUrl <- map["likes_url"]
        shotsUrl <- map["shots_url"]
        teamsUrl <- map["teams_url"]
    }
}