//
//  LocalDataBase.swift
//  StudentsDataApp
//
//  Created by  kumar on 01/04/22.
//

import Foundation
import CoreData

class LocalDataBase {
    
    static let shared = LocalDataBase()
    
    var appName = Bundle.main.infoDictionary?["CFBundleName"] as? String

    var studentsData = [StudentsData]()

    func fetchStudentDetails() {
        let fetchRequest: NSFetchRequest<Students_Data> = Students_Data.fetchRequest()
        do {
            let users = try self.persistentContainer.viewContext.fetch(fetchRequest)

            self.studentsData.removeAll()
            for user in users {
                self.studentsData.append(StudentsData(user))
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
    
    
    func storestudentDetails(_ studentDetails: [[String: String]], currentUser: Students_Data?) {
        var user = currentUser ?? Students_Data(context: self.persistentContainer.viewContext)
   
        print(studentDetails)
        studentDetails.forEach() {
            user.student_Name = $0["name"]
            user.student_Dept = $0["dept"]
            user.student_Sub1 = $0["subject1"]
            user.student_Sub2 = $0["subject2"]
            user.student_Sub3 = $0["subject3"]
            user.student_Mark1 = $0["mark1"]
            user.student_Mark2 = $0["mark2"]
            user.student_Mark3 = $0["mark3"]
            user.student_total = $0["total"]
        }
        
        do {
            try context.save()
            print("saved!")
            self.fetchStudentDetails()
        }
        catch let error {
            print("Could not save \(error), \(error.localizedDescription)")
        }
    
    }
    func updatestudentDetails(_ studentDetails: [[String:String]]) {
        let fetchRequest: NSFetchRequest<Students_Data> = Students_Data.fetchRequest()
        do {
            let users = try self.persistentContainer.viewContext.fetch(fetchRequest)
            for user in users {
                self.storestudentDetails(studentDetails, currentUser: user)
            }
        }
        catch let error {
            print("ERROR  : \(error)")
        }
    }
    
    func deletestudentDetails() {
        do {
            let fetchRequest: NSFetchRequest<Students_Data> = Students_Data.fetchRequest()
            do {
                let objects  = try context.fetch(fetchRequest)
                _ = objects.map{ context.delete($0) }
                try context.save()
                self.studentsData.removeAll()
                print("Deleted!")
            }
            catch let error {
                print("ERROR DELETING : \(error)")
            }
        }
    }

    // MARK: - Core Data Saving support
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StudentsDataApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
