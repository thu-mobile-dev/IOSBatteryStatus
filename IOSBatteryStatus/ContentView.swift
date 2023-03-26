import SwiftUI
import UIKit

class BatteryStatus {
    var isCharging: Bool? {
        UIDevice.current.isBatteryMonitoringEnabled = true
        if UIDevice.current.batteryState == .unknown {
            return nil
        } else if UIDevice.current.batteryState == .charging || UIDevice.current.batteryState == .full {
            return true
        } else {
            return false
        }
    }

    var value: Float? {
        UIDevice.current.isBatteryMonitoringEnabled = true
        if UIDevice.current.batteryState == .unknown {
            return nil
        } else {
            return UIDevice.current.batteryLevel
        }
    }
}

struct ContentView: View {
    let batteryStatus = BatteryStatus()
    var body: some View {
        HStack {
            if batteryStatus.isCharging == nil {
                Image(systemName: "questionmark")
            } else if batteryStatus.isCharging! {
                Image(systemName: "bolt.fill")
            }
            if batteryStatus.value == nil {
                Image(systemName: "questionmark")
            } else {
                Text("\(Int(batteryStatus.value! * 100))")
                    .bold()
            }
        }
        .padding()
    }
}
