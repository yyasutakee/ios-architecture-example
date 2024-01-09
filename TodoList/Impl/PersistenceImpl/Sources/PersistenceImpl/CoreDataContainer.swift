//
//  CoreDataContainer.swift
//
//
//  Created by Yuhei Yasutake on 26.11.23.
//

import CoreData

class CoreDataContainer {
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let modelURL = Bundle.module.url(forResource: "Model", withExtension: "momd")!
        
        let model = NSManagedObjectModel(contentsOf: modelURL)!
        
        let container = NSPersistentContainer(name: "Model", managedObjectModel: model)
                
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
}


