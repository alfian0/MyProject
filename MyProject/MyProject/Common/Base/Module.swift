//
//  Module.swift
//  TableStyle
//
//  Created by alfian on 16/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation

public enum Module{
    case    ToDoList,
            CreateTodo,
            EditTodo,
            SignUp,
            Profile,
            Login
    
    public var routePath: String {
        switch self {
        case .ToDoList:
            return "/Modules/ToDoList"
        case .CreateTodo:
            return "/Modules/CreateTodo"
        case .EditTodo:
            return "/Modules/EditTodo"
        case .SignUp:
            return "/Modules/SignUp"
        case .Profile:
            return "/Modules/Profile"
        case .Login:
            return "/Modules/Login"
        }
    }
}