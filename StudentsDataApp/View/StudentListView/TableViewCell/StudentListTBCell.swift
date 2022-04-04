//
//  StudentListTBCell.swift
//  StudentsDataApp
//
//  Created by  kumar on 01/04/22.
//

import UIKit

class StudentListTBCell: UITableViewCell {
    
    var viewContent = UIView()
    var studentNameLbl = UILabel()
    var studentDeptLbl = UILabel()
    
    var studentSubjLbl1 = UILabel()
    var studentSubjLbl2 = UILabel()
    var studentSubjLbl3 = UILabel()
    
    var studentMarkLbl1 = UILabel()
    var studentMarkLbl2 = UILabel()
    var studentMarkLbl3 = UILabel()

    var studentTotalLbl = UILabel()
    var studentTotalMarkLbl = UILabel()

    var layoutDict = [String:AnyObject]()

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       setUpViews()
    }
  
    func setUpViews() {

        viewContent.layer.cornerRadius = 5
        viewContent.layer.borderColor = UIColor.red.cgColor
        viewContent.layer.borderWidth = 0.5
        viewContent.backgroundColor = .white
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["viewContent"] = viewContent
        self.addSubview(viewContent)
        
        studentNameLbl.font = UIFont.boldSystemFont(ofSize: 15)
        studentNameLbl.textAlignment = .center
        studentNameLbl.textColor = .black
        studentNameLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentNameLbl"] = studentNameLbl
        viewContent.addSubview(studentNameLbl)
        
        studentDeptLbl.font = UIFont.boldSystemFont(ofSize: 13)
        studentDeptLbl.textAlignment = .center
        studentDeptLbl.textColor = .magenta
        studentDeptLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentDeptLbl"] = studentDeptLbl
        viewContent.addSubview(studentDeptLbl)
        
        studentSubjLbl1.font = UIFont.systemFont(ofSize: 13)
        studentSubjLbl1.textAlignment = .center
        studentSubjLbl1.textColor = .lightGray
        studentSubjLbl1.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentSubjLbl1"] = studentSubjLbl1
        viewContent.addSubview(studentSubjLbl1)
        
        studentSubjLbl2.font = UIFont.systemFont(ofSize: 13)
        studentSubjLbl2.textAlignment = .center
        studentSubjLbl2.textColor = .lightGray
        studentSubjLbl2.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentSubjLbl2"] = studentSubjLbl2
        viewContent.addSubview(studentSubjLbl2)
        
        studentSubjLbl3.font = UIFont.systemFont(ofSize: 13)
        studentSubjLbl3.textAlignment = .center
        studentSubjLbl3.textColor = .lightGray
        studentSubjLbl3.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentSubjLbl3"] = studentSubjLbl3
        viewContent.addSubview(studentSubjLbl3)
        
        studentMarkLbl1.font = UIFont.systemFont(ofSize: 13)
        studentMarkLbl1.textAlignment = .center
        studentMarkLbl1.textColor = .black
        studentMarkLbl1.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentMarkLbl1"] = studentMarkLbl1
        viewContent.addSubview(studentMarkLbl1)
        
        studentMarkLbl2.font = UIFont.systemFont(ofSize: 13)
        studentMarkLbl2.textAlignment = .center
        studentMarkLbl2.textColor = .black
        studentMarkLbl2.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentMarkLbl2"] = studentMarkLbl2
        viewContent.addSubview(studentMarkLbl2)
        
        studentMarkLbl3.font = UIFont.systemFont(ofSize: 13)
        studentMarkLbl3.textAlignment = .center
        studentMarkLbl3.textColor = .black
        studentMarkLbl3.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentMarkLbl3"] = studentMarkLbl3
        viewContent.addSubview(studentMarkLbl3)
        
        
        studentTotalLbl.font = UIFont.systemFont(ofSize: 13)
        studentTotalLbl.textAlignment = .center
        studentTotalLbl.textColor = .black
        studentTotalLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentTotalLbl"] = studentTotalLbl
        viewContent.addSubview(studentTotalLbl)
        
        studentTotalMarkLbl.font = UIFont.systemFont(ofSize: 15)
        studentTotalMarkLbl.textAlignment = .center
        studentTotalMarkLbl.textColor = .black
        studentTotalMarkLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["studentTotalMarkLbl"] = studentTotalMarkLbl
        viewContent.addSubview(studentTotalMarkLbl)
        
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[viewContent]-5-|", options: [], metrics: nil, views: layoutDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[viewContent]-5-|", options: [], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[studentNameLbl(22)]-5-[studentDeptLbl(22)]-5-[studentSubjLbl1(22)]-5-[studentMarkLbl1(22)]-5-[studentTotalLbl(22)]-5-[studentTotalMarkLbl(22)]-10-|", options: [], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[studentNameLbl]-10-|", options: [], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[studentDeptLbl]-10-|", options: [], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[studentSubjLbl1]-5-[studentSubjLbl2(==studentSubjLbl1)]-5-[studentSubjLbl3(==studentSubjLbl1)]-5-|", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[studentMarkLbl1]-5-[studentMarkLbl2(==studentMarkLbl1)]-5-[studentMarkLbl3(==studentMarkLbl1)]-5-|", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: layoutDict))

        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[studentTotalLbl]-10-|", options: [], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[studentTotalMarkLbl]-10-|", options: [], metrics: nil, views: layoutDict))

    }

}
