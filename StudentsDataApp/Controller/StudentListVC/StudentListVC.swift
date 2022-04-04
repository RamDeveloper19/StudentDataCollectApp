//
//  StudentListVC.swift
//  StudentsDataApp
//
//  Created by kumar on 01/04/22.
//

import UIKit

class StudentListVC: UIViewController {

    var studentListView = StudentListView()
    
    var savedData = [StudentsData]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Students List"
        self.navigationController?.navigationBar.isHidden = false
        self.setupViews()
    }
    
    func setupViews() {
        
        self.studentListView.setupViews(Base: self.view)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ADD", style: .done, target: self, action: #selector(AddAction))
        self.setupTarget()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.savedData = LocalDataBase.shared.studentsData.reversed()
        self.studentListView.studentTbl.reloadData()
    }

    func setupTarget() {
        self.studentListView.studentTbl.register(StudentListTBCell.self, forCellReuseIdentifier: "StudentListTBCell")
        self.studentListView.studentTbl.delegate = self
        self.studentListView.studentTbl.dataSource = self
    }
    
}

extension StudentListVC {
    @objc func AddAction(sender: UIBarButtonItem) {
        
        let vc = StudentAddVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension StudentListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.savedData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historycell") as? StudentListTBCell ?? StudentListTBCell()
        
        cell.studentTotalLbl.text = "Total"

        cell.selectionStyle = .none
        
        let student = self.savedData
        cell.studentNameLbl.text = student[indexPath.row].name
        cell.studentDeptLbl.text = student[indexPath.row].dept
        cell.studentSubjLbl1.text = student[indexPath.row].subject1
        cell.studentSubjLbl2.text = student[indexPath.row].subject2
        cell.studentSubjLbl3.text = student[indexPath.row].subject3
        cell.studentMarkLbl1.text = student[indexPath.row].mark1
        cell.studentMarkLbl2.text = student[indexPath.row].mark2
        cell.studentMarkLbl3.text = student[indexPath.row].mark3
        cell.studentTotalMarkLbl.text = student[indexPath.row].total
        return cell
    }
}
