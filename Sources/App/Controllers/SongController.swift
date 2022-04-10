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
        let songs = routes.grouped("songs")//Esto obtiene todas las rutas que tienen el prefijo "songs"
        songs.get(use: index)
        songs.post(use: create)
    }
    
    //Esta funcion regresa una cancion
    func index(req: Request) throws -> EventLoopFuture<[Song]> {
        return Song.query(on: req.db).all()
    }
    
    //Esta funcion regresa un HTTPStatus mediante el generico EventLoopFuture
    //porque va a regresar solo el estado si se creo o no
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let song = try req.content.decode(Song.self)//obtenemos nuestra cancion
        return song.save(on: req.db)//intentamos guardar en la bd
            .transform(to: .ok)//despues hacemos un map para transformar el tipo de dato y regresar un "ok(200 Status)"
    }
}
