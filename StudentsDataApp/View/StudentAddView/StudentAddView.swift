//
//  StudentAddView.swift
//  StudentsDataApp
//
//  Created by  kumar on 01/04/22.
//

import UIKit

class StudentAddView: UIView {


    var studentNameTxtFld = UITextField()
    var studentDeptTxtFld = PickerViewTextField()

    let subMarkView = UIView()
    
    let subjectLbl1 = UILabel()
    let subjectLbl2 = UILabel()
    let subjectLbl3 = UILabel()
    
    let subjectMarkLbl1 = UITextField()
    let subjectMarkLbl2 = UITextField()
    let subjectMarkLbl3 = UITextField()

    var btnSave = UIButton()

    var layoutDict = [String: AnyObject]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(Base baseView: UIView) {
        baseView.backgroundColor = .white
        
        studentNameTxtFld.layer.cornerRadius = 5
        studentNameTxtFld.layer.borderWidth = 1
        studentNameTxtFld.layer.borderColor = UIColor.lightGray.cgColor
        studentNameTxtFld.placeholder = "Student Name"
        studentNameTxtFld.font = UIFont.boldSystemFont(ofSize: 15)
        studentNameTxtFld.textAlignment = .center
        studentNameTxtFld.textColor = .black
        studentNameTxtFld.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentNameTxtFld"] = studentNameTxtFld
        baseView.addSubview(studentNameTxtFld)
        
        studentDeptTxtFld.layer.cornerRadius = 5
        studentDeptTxtFld.layer.borderWidth = 1
        studentDeptTxtFld.layer.borderColor = UIColor.lightGray.cgColor
        studentDeptTxtFld.placeholder = "Select Department"
        studentDeptTxtFld.font = UIFont.boldSystemFont(ofSize: 15)
        studentDeptTxtFld.textAlignment = .center
        studentDeptTxtFld.textColor = .black
        studentDeptTxtFld.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentDeptTxtFld"] = studentDeptTxtFld
        baseView.addSubview(studentDeptTxtFld)
        
        
        subMarkView.isHidden = true
        
        subMarkView.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["subMarkView"] = subMarkView
        baseView.addSubview(subMarkView)
        
        layoutDict["subjectLbl1"] = subjectLbl1
        subMarkView.addSubview(subjectLbl1)
        
        layoutDict["subjectLbl2"] = subjectLbl2
        subMarkView.addSubview(subjectLbl2)
        
        layoutDict["subjectLbl3"] = subjectLbl3
        subMarkView.addSubview(subjectLbl3)
        
        [subjectLbl1,subjectLbl2,subjectLbl3].forEach( {
            $0.font = UIFont.boldSystemFont(ofSize: 13)
            $0.textAlignment = .left
            $0.textColor = .black
            $0.translatesAutoresizingMaskIntoConstraints = false
        })

        layoutDict["subjectMarkLbl1"] = subjectMarkLbl1
        subMarkView.addSubview(subjectMarkLbl1)

        layoutDict["subjectMarkLbl2"] = subjectMarkLbl2
        subMarkView.addSubview(subjectMarkLbl2)

        layoutDict["subjectMarkLbl3"] = subjectMarkLbl3
        subMarkView.addSubview(subjectMarkLbl3)
        
        [subjectMarkLbl1,subjectMarkLbl2,subjectMarkLbl3].forEach( {
            $0.keyboardType = .numberPad
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.placeholder = "Mark"
            $0.font = UIFont.boldSystemFont(ofSize: 13)
            $0.textAlignment = .center
            $0.textColor = .black
            $0.translatesAutoresizingMaskIntoConstraints = false

        })
        
        btnSave.setTitle("Save".uppercased(), for: .normal)
        btnSave.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btnSave.setTitleColor(UIColor.white, for: .normal)
        btnSave.backgroundColor = UIColor.black
        btnSave.layer.cornerRadius = 5
        btnSave.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["btnSave"] = btnSave
        baseView.addSubview(btnSave)
        
        studentNameTxtFld.topAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        btnSave.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnSave.bottomAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true

        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[studentNameTxtFld(50)]-10-[studentDeptTxtFld(50)]-10-[subMarkView]", options: [], metrics: nil, views: layoutDict))
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[studentNameTxtFld]-15-|", options: [], metrics: nil, views: layoutDict))
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[studentDeptTxtFld]-15-|", options: [], metrics: nil, views: layoutDict))
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subMarkView]-0-|", options: [], metrics: nil, views: layoutDict))

        subMarkView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[subjectLbl1(50)]-10-[subjectLbl2(50)]-10-[subjectLbl3(50)]-5-|", options: [], metrics: nil, views: layoutDict))

        subMarkView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[subjectLbl1]-10-[subjectMarkLbl1(==subjectLbl1)]-15-|", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: layoutDict))
        subMarkView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[subjectLbl2]-10-[subjectMarkLbl2(==subjectLbl2)]-15-|", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: layoutDict))
        subMarkView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[subjectLbl3]-10-[subjectMarkLbl3(==subjectLbl3)]-15-|", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: layoutDict))

        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[btnSave]-16-|", options: [], metrics: nil, views: layoutDict))

    }
}
