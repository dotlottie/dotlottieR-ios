//
//  DotLottieAnimation.swift
//  dotLottie-ios
//
//  Created by Evandro Hoffmann on 05/08/2020.
//  Copyright (c) 2020 dotLottie. All rights reserved.
//
import Foundation
import dotLottieLoader
import SDWebImageLottieCoder
import SDWebImage

public class dotLottieR {
    
    /// Enables log printing
    public static var isLogEnabled: Bool {
        get {
            dotLottieUtils.isLogEnabled
        }
        set {
            dotLottieUtils.isLogEnabled = newValue
        }
    }
    
}
