//
//  NewsSourcesTableCell.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import UIKit

final class NewsSourcesTableCell: UITableViewCell {
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        selectionStyle = .none
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: NewsSourcesMediaModel) {
        titleLbl.text = model.name
    }
    
    private func setupConstraints() {
        
        contentView.addSubview(titleLbl)
        
        titleLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(10)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
