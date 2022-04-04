//
//  StudentListView.swift
//  StudentsDataApp
//
//  Created by kumar on 01/04/22.
//

import UIKit

class StudentListView: UIView {

    let studentTbl = UITableView()

    var layoutDict = [String: AnyObject]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(Base baseView: UIView) {
        baseView.backgroundColor = .white
        
        studentTbl.tableFooterView = UIView()
        studentTbl.separatorStyle = .none
        studentTbl.alwaysBounceVertical = false
        studentTbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentTbl"] = studentTbl
        baseView.addSubview(studentTbl)
        
        studentTbl.topAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.topAnchor).isActive = true
        studentTbl.bottomAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[studentTbl]|", options: [], metrics: nil, views: layoutDict))

        
    }

}
