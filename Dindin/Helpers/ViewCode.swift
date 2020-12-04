//
//  ViewCode.swift
//  Dindin
//
//  Created by Thiago Kuriki on 03/12/20.
//

protocol ViewCode {
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {
    }
}
