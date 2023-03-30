//
//  ViewController.swift
//  Notice
//
//  Created by juhoon lee on 2023/03/30.
//

import UIKit
import FirebaseRemoteConfig


class ViewController: UIViewController {

    var remoteConfig: RemoteConfig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remoteConfig = RemoteConfig.remoteConfig()
        
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        
        remoteConfig?.configSettings = setting
        remoteConfig?.setDefaults(fromPlist: "RemoteConfigDefaults")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNotice()
    }
}

//RemoteConfig
extension ViewController {
    func getNotice() {
        guard let remoteConfig = remoteConfig else {return}
        
        remoteConfig.fetch {[weak self] status, _ in
            if status == .success {
                remoteConfig.activate()
            }else{
                print("ERROR: Config not fetched")
            }
            
            guard let self = self else {return}
            
            if !self.isNoticeHidden(remoteConfig){
                let noticeVC = NoticeViewController(nibName: "NoticeViewController", bundle: nil)
                noticeVC.modalPresentationStyle = .custom
                noticeVC.modalTransitionStyle = .crossDissolve
                
                let title = (remoteConfig["title"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                let detail = (remoteConfig["detail"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                let date = (remoteConfig["date"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                noticeVC.noticeContents = (title: title, detail: detail, date: date)
                self.present(noticeVC, animated: true)
            }
        }
    }
    
    func isNoticeHidden(_ remoteConfig: RemoteConfig) -> Bool {
        return remoteConfig["isHidden"].boolValue
    }
}
