//
//  LocalDBModel.swift
//  StudentsDataApp
//
//  Created by kumar on 01/04/22.
//

import Foundation
import CoreData

struct StudentsData {
    
    var name:String?
    var dept:String?
    var subject1:String?
    var subject2:String?
    var subject3:String?
    var mark1:String?
    var mark2:String?
    var mark3:String?
    var total:String?
    
    init(_ studentDetails: Students_Data) {
        
        self.name = studentDetails.value(forKey: "student_Name") as? String
        self.dept = studentDetails.value(forKey: "student_Dept") as? String
        self.subject1 = studentDetails.value(forKey: "student_Sub1") as? String
        self.subject2 = studentDetails.value(forKey: "student_Sub2") as? String
        self.subject3 = studentDetails.value(forKey: "student_Sub3") as? String
        self.mark1 = studentDetails.value(forKey: "student_Mark1") as? String
        self.mark2 = studentDetails.value(forKey: "student_Mark2") as? String
        self.mark3 = studentDetails.value(forKey: "student_Mark3") as? String
        self.total = studentDetails.value(forKey: "student_total") as? String
    }
}
