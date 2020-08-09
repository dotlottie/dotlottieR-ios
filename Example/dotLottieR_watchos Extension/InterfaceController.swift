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

class AnimationRow: NSObject {
    @IBOutlet weak var image: WKInterfaceImage!
    var animator: DotLottieRAnimator?
    var animationUrl: URL? {
        didSet {
            guard let url = animationUrl else { return }
            animator = DotLottieRAnimator(url: url, imageView: image)
            animator?.loopMode = .loop
            animator?.pause()
        }
    }
}

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    private var animations: [String] = [
        "https://dotlottie.io/sample_files/animation.lottie",
        "https://assets8.lottiefiles.com/private_files/lf30_ouK85t.json",
        "https://assets8.lottiefiles.com/packages/lf20_qCGBcc.json",
        "https://assets8.lottiefiles.com/packages/lf20_8SfnRn.json",
        "https://assets1.lottiefiles.com/packages/lf20_OmysYw.json",
        "https://assets8.lottiefiles.com/packages/lf20_hqZux3.json"
    ]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        tableView.setNumberOfRows(animations.count, withRowType: "AnimationRow")
           
        for i in 0..<animations.count {
            if let row = tableView.rowController(at: i) as? AnimationRow {
                row.animationUrl = URL(string: animations[i])
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        guard let row = table.rowController(at: rowIndex) as? AnimationRow else { return }
        row.animator?.togglePlay()
    }
    
//    override func didAppear() {
//        animators.forEach({
//            $0.loopMode = .loop
//            $0.play()
//        })
//        super.didAppear()
//    }
//
//    override func willDisappear() {
//        animators.forEach({ $0.pause() })
//        super.willDisappear()
//    }

}
