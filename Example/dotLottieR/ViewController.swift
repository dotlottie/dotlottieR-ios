//
//  ViewController.swift
//  dotLottieR
//
//  Created by eharrison on 08/05/2020.
//  Copyright (c) 2020 eharrison. All rights reserved.
//

import UIKit
import dotLottieR

class AnimationCell: UITableViewCell {
    @IBOutlet weak var animationImageView: UIImageView!
    var animator: DotLottieRAnimator?
    var animationUrl: URL? {
        didSet {
            guard let url = animationUrl else { return }
            animator = DotLottieRAnimator(url: url, imageView: animationImageView)
            animator?.loopMode = .loop
        }
    }
}

class ViewController: UITableViewController {
    
    private var animations: [String] = [
        "https://dotlottie.io/sample_files/animation.lottie",
        "https://assets8.lottiefiles.com/private_files/lf30_ouK85t.json",
        "https://assets8.lottiefiles.com/packages/lf20_qCGBcc.json",
        "https://assets8.lottiefiles.com/packages/lf20_8SfnRn.json",
        "https://assets1.lottiefiles.com/packages/lf20_OmysYw.json",
        "https://assets8.lottiefiles.com/packages/lf20_hqZux3.json"
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animation", for: indexPath) as! AnimationCell
        cell.animationUrl = URL(string: animations[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

