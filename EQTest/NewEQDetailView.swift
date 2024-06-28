//
//  NewEQDetailView.swift
//  EQTest
//
//  Created by 김민종 on 6/28/24.
//

import UIKit

import SnapKit
import Then

class NewEQDetailView: UIView {
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let tableView = UITableView().then {
        $0.separatorStyle = .none
    }
    
    let saveButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    lazy var saveButtonView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.text = "확인"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        view.addSubview(saveButton)
        
        view.addSubview(label)
        view.layer.cornerRadius = 30
        
        view.backgroundColor = .label
        label.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        
        saveButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }()
    
    lazy var bottomView = UIView().then {
        
        $0.backgroundColor = .systemBackground
        $0.addSubview(saveButtonView)
        saveButtonView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }

    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUp() {
        let screenSize: CGRect = UIScreen.main.bounds

        backgroundColor = .systemBackground

        addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        
        contentView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(bottomView)
        bottomView.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(screenSize.height * 0.2)
            $0.leading.trailing.equalToSuperview()
        }
        
        
    }
    
}
