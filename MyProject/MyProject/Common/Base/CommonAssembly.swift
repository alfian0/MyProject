//
//  CommonAssembly.swift
//  MyProject
//
//  Created by alfian on 18/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation
import Swinject

public class CommonAssembly: AssemblyType {
    
    public init(){
        
    }
    
    public func assemble(container: Container) {
        container.register(IService.self) { r in
            return Service(authManager: AuthManager.sharedManager)
        }
    }
    
}