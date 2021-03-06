//
//  SetupViewController.swift
//  team2z
//
//  Created by 정인호 on 18/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class SetupViewController: UIViewController {
    let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    let menuLabels: [String] = ["사용가이드", "문의하기", "약관 및 정책", "로그아웃", "버전 1.6.0"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "설정"
        // custom back button 설정
//        let backbutton = UIButton(type: .custom)
//        backbutton.setImage(UIImage(named: "left_arrow.png"), for: .normal) // Image can be downloaded from here below link
//        backbutton.setTitle("", for: .normal)
//        backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor
//        backbutton.addTarget(self, action: #selector("backActionTest"), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        
        // 테이블뷰 생성 및 설정
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.isScrollEnabled = false
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        
        //        let subview = UIView()
        //        view.addSubview(subview)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        
        let nibName_0 = UINib(nibName: "TableViewCell", bundle: nil)
        myTableView.register(nibName_0, forCellReuseIdentifier: "SetupTableViewCell")
    }

    func makeBackButton() -> UIButton {
//        let backButtonImage = UIImage(named: "left_arrow.png")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "left_arrow.png"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    @objc func backButtonPressed() {
//        dismiss(animated: true, completion: nil)
                navigationController?.popViewController(animated: true)
    }
}


extension SetupViewController: UITableViewDelegate {
    
}
extension SetupViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SetupTableViewCell") as! TableViewCell
        
        cell.setupLabel?.text = menuLabels[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "   "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.navigationController?.pushViewController(SetupViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @objc func handleTap_0(sender: UITapGestureRecognizer) {
        print("tap0 in mpvc")
        self.navigationController?.pushViewController(GradeViewController(), animated: true)
    }
}
