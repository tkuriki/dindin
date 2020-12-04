//
//  Transaction.swift
//  Dindin
//
//  Created by Thiago Kuriki on 03/12/20.
//

import Foundation

enum TransactionType: String, Codable {
    case input = "INPUT"
    case output = "OUTPUT"
    
    var description: String {
        switch self {
        case .input:
            return "Entrada"
        case .output:
            return "Saída"
        }
    }
}

enum TransactionCategory: String, Codable {
    case pix = "PIX"
    case uam = "UAM"
    case ted = "TED"
    case pagSeguro = "PagSeguro"
}

struct Transaction: Codable {
    var type: TransactionType = .input
    var value: String = ""
    var category: TransactionCategory = .pix
    var date: String = ""
}
