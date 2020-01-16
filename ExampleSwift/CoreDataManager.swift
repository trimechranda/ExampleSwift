//
//  CoreDataManager.swift
//  ExampleSwift
//
//  Created by TRIMECH on 14/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class CoreDataManager: NSObject{
    /// save previsions into CoreData
    
    func savePrevisionData(_ previsions: [PrevisionModel]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        deleteAllRecords()

        for prevision in previsions {
            let newprevision = NSEntityDescription.insertNewObject(forEntityName: "Prevision", into: context)

            newprevision.setValue(prevision.humidite, forKey: "humidite")
            newprevision.setValue(prevision.pression, forKey: "pression")
            newprevision.setValue(prevision.temperature, forKey: "temperature")
            newprevision.setValue(prevision.vent_moyen, forKey: "vent_moyen")
            newprevision.setValue(prevision.dateString, forKey: "dateString")
       
        }
        do {
            try context.save()
            print("Success")
        } catch {
            print("Error saving: \(error)")
        }
    }
    
    ///Get previsons array from entity Prevision coreData
    func retrieveSavedPrevisions() -> [PrevisionModel]? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Prevision")
        request.returnsObjectsAsFaults = false
        var retrievedPrevisions: [PrevisionModel] = []
        do {
            let results = try context.fetch(request)
            if !results.isEmpty {
                for result in results as! [NSManagedObject] {
                    guard let humidite = result.value(forKey: "humidite") as? Int else { return nil }
                    guard let pression = result.value(forKey: "pression") as? Int else { return nil }
                    guard let temperature = result.value(forKey: "temperature") as? Int else { return nil }
                    guard let vent_moyen = result.value(forKey: "vent_moyen") as? Int else { return nil }
                    guard let dateString = result.value(forKey: "dateString") as? String else { return nil }
                    let previsionsData = PrevisionModel (dateString : dateString,temperature: temperature , pression: pression , humidite:humidite , vent_moyen :vent_moyen )
                    retrievedPrevisions.append(previsionsData)
                }
            }
        } catch {
            print("Error retrieving: \(error)")
        }
        return retrievedPrevisions

    }
    func deleteAllRecords() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Prevision")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }

}
