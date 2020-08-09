//
//  InterfaceController.swift
//  dotLottieR_watchos Extension
//
//  Created by Evandro Harrison Hoffmann on 06/08/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import WatchKit
import Foundation
import dotLottieR

class InterfaceController: WKInterfaceController {
    @IBOutlet weak var image1: WKInterfaceImage!
    @IBOutlet weak var image2: WKInterfaceImage!
    @IBOutlet weak var image3: WKInterfaceImage!
    @IBOutlet weak var image4: WKInterfaceImage!
    
    private var animators: [DotLottieRAnimator] = []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        //truck
        animators.append(.init(url: URL(string: "https://assets8.lottiefiles.com/private_files/lf30_ouK85t.json")!, imageView: image1))
        
        //camera fish
        animators.append(.init(url: URL(string: "https://assets8.lottiefiles.com/packages/lf20_qCGBcc.json")!, imageView: image2))
        
        //van
        animators.append(.init(url: URL(string: "https://assets8.lottiefiles.com/packages/lf20_8SfnRn.json")!, imageView: image3))
        
        // hang in there
        animators.append(.init(url: URL(string: "https://assets8.lottiefiles.com/packages/lf20_hqZux3.json")!, imageView: image4))
    }
    
    override func didAppear() {
        animators.forEach({
            $0.loopMode = .loop
            $0.play()
        })
        super.didAppear()
    }
    
    override func willDisappear() {
        animators.forEach({ $0.pause() })
        super.willDisappear()
    }

}
