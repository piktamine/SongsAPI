//
//  SongController.swift
//  
//
//  Created by Admin on 05/04/22.
//

import Foundation
import Vapor

struct SongController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        let songs = routes.grouped("songs")
        songs.get(use: index)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Song]> {
        return Song.query(on: req.db).all()
    }
    
}
