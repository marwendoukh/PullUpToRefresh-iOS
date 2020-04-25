//
//  CustomBottomView.swift
//  PullUpToRefresh
//
//  Created by Marwen Doukh on 4/21/20.
//  Copyright © 2020 Marwen Doukh. All rights reserved.
//

import UIKit

class CustomBottomView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "The end !"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(label)
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
