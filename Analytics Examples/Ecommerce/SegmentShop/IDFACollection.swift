//
//  IDFACollection.swift
//  SegmentShop
//
//  Created by Alan Charles on 5/1/24.
//

import Foundation
import UIKit
import Segment
import AdSupport
import AppTrackingTransparency

/**
 Plugin to collect IDFA values.  Users will be prompted if authorization status is undetermined.
 Upon completion of user entry a track event is issued showing the choice user made.
 
 Don't forget to add "NSUserTrackingUsageDescription" with a description to your Info.plist.
 */
class IDFACollection: Plugin {
    let type = PluginType.enrichment
    weak var analytics: Analytics? = nil
    @Atomic private var alreadyAsked = false
    
    func execute<T: RawEvent>(event: T?) -> T? {
        let status = ATTrackingManager.trackingAuthorizationStatus

        let trackingStatus = statusToString(status)
        var idfa = fallbackValue
        var adTrackingEnabled = false
        
        if status == .authorized {
            adTrackingEnabled = true
            idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }
                
        var workingEvent = event
        if var context = event?.context?.dictionaryValue {
            context[keyPath: "device.adTrackingEnabled"] = adTrackingEnabled
            context[keyPath: "device.advertisingId"] = idfa
            context[keyPath: "device.trackingStatus"] = trackingStatus
            
            workingEvent?.context = try? JSON(context)
        }

        return workingEvent
    }
}

extension IDFACollection: iOSLifecycle {
    func applicationDidBecomeActive(application: UIApplication?) {
        let status = ATTrackingManager.trackingAuthorizationStatus
        if status == .notDetermined && !alreadyAsked {
            // we don't know, so should ask the user.
            alreadyAsked = true
            askForPermission()
        }
    }
}

extension IDFACollection {
    var fallbackValue: String? {
        get {
            // fallback to the IDFV value.
            // this is also sent in event.context.device.id,
            // feel free to use a value that is more useful to you.
            return UIDevice.current.identifierForVendor?.uuidString
        }
    }
    
    func statusToString(_ status: ATTrackingManager.AuthorizationStatus) -> String {
        var result = "unknown"
        switch status {
        case .notDetermined:
            result = "notDetermined"
        case .restricted:
            result = "restricted"
        case .denied:
            result = "denied"
        case .authorized:
            result = "authorized"
        @unknown default:
            break
        }
        return result
    }
    
    func askForPermission() {
        ATTrackingManager.requestTrackingAuthorization { status in
            // send a track event that shows the results of asking the user for permission.
            self.analytics?.track(name: "IDFAQuery", properties: ["result": self.statusToString(status)])
        }
    }
}

