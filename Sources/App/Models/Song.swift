//
//  File.swift
//  
//
//  Created by Admin on 05/04/22.
//

import Fluent
import Vapor
import Foundation

final class Song: Model, Content {
    static let schema: String = "songs" //nombre de nuestra tab;a
    
    @ID(key: .id) //aqui es como si hcieramos @State en ios
    var id: UUID? //lave  primaria
    
    @Field(key: "title")
    var title: String
    
    init (){
        
    }
    
    init(id: UUID? = nil, title: String){
        self.id = id
        self.title = title
    }
    
}
