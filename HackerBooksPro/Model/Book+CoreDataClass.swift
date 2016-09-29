//
//  Book+CoreDataClass.swift
//  HackerBooksPro
//
//  Created by Carlos Delgado on 28/09/16.
//

import Foundation
import CoreData

@objc(Book)
public class Book: NSManagedObject {
    
    // Nombre que corresponde a la entidad de esta clase en el modelo
    static let entityName = "Book"
    
    
    // Inicializador de la clase
    // (de conveniencia para que CoreData pueda utilizar los super.init() desde fuera)
    convenience init(title: String, cover: Cover, pdf: Pdf, inContext context: NSManagedObjectContext) {
        
        // Obtenemos la entidad correspondiente al nombre anterior
        let ent = NSEntityDescription.entity(forEntityName: Book.entityName, in: context)!
        
        // Crear una nueva entidad del tipo obtenido, en el contexto
        self.init(entity: ent, insertInto: context)
        
        // Asignar valores iniciales a las propiedades
        self.title = title
        self.cover = cover
        self.pdf = pdf
    }
    
}

// Extensiones de la clase

extension Book {
    
    // Función que devuelve un string con los autores del libro, separados por comas
    func authorsToString() -> String {
        
        if self.authors == nil {
            
            return "< Sin autor registrado >"
        }
        
        var bookAuths = ""
        var i = 0
        
        for author in self.authors! {
            
            let authorName = (author as! Author).name
            
            bookAuths += authorName!
            
            i += 1
            if (i<(self.authors?.count)!) {  bookAuths += ", "   }
        }
        
        return bookAuths
    }
    
    
    // Función que devuelve un string con los tags del libro, separados por comas
    func tagsToString() -> String {
        
        if self.bookTags == nil {
            
            return "< Sin tags registrados >"
        }
        
        var tagString = ""
        var i = 0
        
        for bookTag in self.bookTags! {
            
            let tagName = (bookTag as! BookTag).tag?.name
            
            tagString += tagName!
            
            i += 1
            if (i<(self.bookTags?.count)!) {  tagString += ", "   }
        }
        
        return tagString
    }
    
}
