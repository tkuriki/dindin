//
//  Constants.swift
//  Dindin
//
//  Created by Thiago Kuriki on 02/12/20.
//

import UIKit

final public class Constants {
    public static let cornerRadius: CGFloat = 4
    
    public enum Colors: String {
        case primary
        case secondary
        case success
        case error
    }
    
    public enum Fonts: CGFloat {
        case smallSize = 14
        case defaultSize = 16
        case mediumSize = 18
        case largeSize = 24
        case extraLargeSize = 30
    }
    
    public enum Spaces: CGFloat {
        case smallSize = 8
        case defaultSize = 16
        case extraLargeSize = 32
    }
}
