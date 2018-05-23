//
//  AppActions.swift
//  AnodaTurnTimer
//
//  Created by Pavel Mosunov on 5/22/18.
//  Copyright © 2018 Oksana Kovalchuk. All rights reserved.
//

import Foundation
import ReSwift
import protocol ReSwift.Action

struct TimerAppLaunchAction: Action {
    var beepInterval: Int
    var timeInterval: Int
    var wasLaunched: Bool
}

struct TimerUpdateSettings: Action {
    var timeInterval: Int
    var beepInterval: Int
}

struct TimerIsOutAction: Action {
    var timerSecondsValue: Int
    var beepValue: Int
}

struct TimerInitialAction: Action { var timer: TimeInterval}

struct RoundStopAction: Action { var state: TimerState }
struct RoundRunningAction: Action { var state: TimerState }
struct RoundPausedActioin: Action { var state: TimerState  }
struct RoundReplayAcrion: Action { var state: TimerState  }

struct RoundProgress: Action { var progress: CGFloat}


