//
//  SettingsVC.swift
//  AnodaGameTimer
//
//  Created by Oksana Kovalchuk on 9/10/17.
//  Copyright © 2017 Oksana Kovalchuk. All rights reserved.
//

import Foundation
import UIKit
import SwiftyUserDefaults
import Crashlytics

class SettingsVC: UIViewController {
    
    let contentView = SettingsView()
    
    var timeInterval: Int = 0
    var beepInterval: Int = 0
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeInterval = store.state.timerAppState.timeInterval
        beepInterval = store.state.timerAppState.beepInterval
        
        contentView.roundDurationSection.picker.timeInterval = Double(timeInterval)
        contentView.beepSection.picker.timeInterval = Double(beepInterval)
        
        contentView.roundDurationSection.picker.addTarget(self,
                                                          action: #selector(timeChanged(_:)),
                                                          for: .valueChanged)
        
        contentView.beepSection.picker.addTarget(self,
                                                 action: #selector(beepChanged(_:)),
                                                 for: .valueChanged)
        
        contentView.backButton.addTargetClosure { [unowned self] (button) in
            
        store.dispatch(TimerUpdateSettings(timeInterval: self.timeInterval,
                                           beepInterval: self.beepInterval,
                                           settingsVC: self))
        }
        
        contentView.shareButton.addTargetClosure { (button) in
            let message = "turn.timer".localized
            if let link = NSURL(string: "http://itunes.apple.com/app/id1282215925") {
                let objectsToShare: [Any] = [message, link]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                activityVC.excludedActivityTypes = [.airDrop, .openInIBooks, .addToReadingList, .assignToContact, .saveToCameraRoll]
                self.present(activityVC, animated: true, completion: nil)
            }
        }
    }
    
    func timeChanged(_ picker: LETimeIntervalPicker) {
        timeInterval = Int(picker.timeInterval)
    }
    
    func beepChanged(_ picker: LETimeIntervalPicker) {
        beepInterval = Int(picker.timeInterval)
    }
}
