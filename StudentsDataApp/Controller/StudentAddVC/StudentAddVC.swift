//
//  StudentAddVC.swift
//  StudentsDataApp
//
//  Created by kumar on 01/04/22.
//

import UIKit

class StudentAddVC: UIViewController {

    var studentAddview = StudentAddView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        self.pickerViewTools()
    }
    
    func setupViews() {
        self.studentAddview.setupViews(Base: self.view)
        self.setupTarget()
    }


    func setupTarget() {
        studentAddview.studentDeptTxtFld.itemList = ["CSE","ECE","MECH","CIVIL"]
        studentAddview.btnSave.addTarget(self, action: #selector(btnSavePressed(_ :)), for: .touchUpInside)

    }
    

}

extension StudentAddVC {
    @objc func btnSavePressed(_ sender: UIButton) {

        if self.studentAddview.studentNameTxtFld.text == ""  {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Enter your name?")
            
        } else if self.studentAddview.studentNameTxtFld.text!.count < 3 || self.studentAddview.studentNameTxtFld.text!.count > 16 {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Enter your valid name?")

        } else if self.studentAddview.studentDeptTxtFld.text == "" {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Select Dept")

        } else if self.studentAddview.subjectMarkLbl1.text == "" || self.studentAddview.subjectMarkLbl2.text == "" || self.studentAddview.subjectMarkLbl3.text == "" {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Enter your subject mark?")

            
        } else if self.studentAddview.subjectMarkLbl1.text!.count == 0 || self.studentAddview.subjectMarkLbl1.text!.count > 3 {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Enter your valid subject mark?")

        } else if self.studentAddview.subjectMarkLbl2.text!.count == 0 || self.studentAddview.subjectMarkLbl2.text!.count > 3 {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Enter your valid subject mark?")

        } else if self.studentAddview.subjectMarkLbl3.text!.count == 0 || self.studentAddview.subjectMarkLbl3.text!.count > 3 {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Enter your valid subject mark?")

        } else {
            self.updateStudent()
        }

    }
    
    func updateStudent() {
        var studentDetails = [String: String]()
        studentDetails["name"] = self.studentAddview.studentNameTxtFld.text
        studentDetails["dept"] = self.studentAddview.studentDeptTxtFld.text
        studentDetails["subject1"] = self.studentAddview.subjectLbl1.text
        studentDetails["subject2"] = self.studentAddview.subjectLbl2.text
        studentDetails["subject3"] = self.studentAddview.subjectLbl3.text
        studentDetails["mark1"] = self.studentAddview.subjectMarkLbl1.text
        studentDetails["mark2"] = self.studentAddview.subjectMarkLbl2.text
        studentDetails["mark3"] = self.studentAddview.subjectMarkLbl3.text

        let mark1 = Int(self.studentAddview.subjectMarkLbl1.text!) ?? 0
        let mark2 = Int(self.studentAddview.subjectMarkLbl2.text!) ?? 0
        let mark3 = Int(self.studentAddview.subjectMarkLbl3.text!) ?? 0

        let total = mark1 + mark2 + mark3
        studentDetails["total"] = "\(total)"

        LocalDataBase.shared.storestudentDetails([studentDetails], currentUser: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
extension StudentAddVC {
    
    func pickerViewTools() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.cancelTapped))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        studentAddview.studentDeptTxtFld.inputAccessoryView = toolBar
    }
    
    @objc func donePicker() {
        self.studentAddview.studentDeptTxtFld.resignFirstResponder()
        self.studentAddview.subMarkView.isHidden = false
        if studentAddview.studentDeptTxtFld.text == "CSE" {
            studentAddview.subjectLbl1.text = "C language"
            studentAddview.subjectLbl2.text = "Java"
            studentAddview.subjectLbl3.text = "Data structure"
        } else if studentAddview.studentDeptTxtFld.text == "ECE" {
            studentAddview.subjectLbl1.text = "Digital electronics"
            studentAddview.subjectLbl2.text = "Maths"
            studentAddview.subjectLbl3.text = "Microprocessor"
        } else if studentAddview.studentDeptTxtFld.text == "MECH" {
            studentAddview.subjectLbl1.text = "Nanotechnology"
            studentAddview.subjectLbl2.text = "Biometrics"
            studentAddview.subjectLbl3.text = "Acoustics"
        } else if studentAddview.studentDeptTxtFld.text == "CIVIL" {
            studentAddview.subjectLbl1.text = "Material science"
            studentAddview.subjectLbl2.text = "Construction Engineering"
            studentAddview.subjectLbl3.text = "Hydraulic science"
        } else {
            self.studentAddview.subMarkView.isHidden = true
        }

    }

    @objc func cancelTapped() {
        self.studentAddview.studentDeptTxtFld.resignFirstResponder()
    }
}

