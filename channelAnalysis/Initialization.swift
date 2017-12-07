//
//  Initialization.swift
//  channelAnalysis
//
//  Created by Peng Cheng on 07/12/2017.
//  Copyright © 2017 Peng Cheng. All rights reserved.
//

import SafariServices

public class ChannelAnalysis:UIViewController,SFSafariViewControllerDelegate,UIApplicationDelegate {
    
    var safari: SFSafariViewController?
    var parentVC: UIViewController?
    var data:Dictionary<String,Any>?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override public func viewDidLoad() {
        let safari = SFSafariViewController(url: URL(string: "https://dev.xiangx.net:8443/api/v1/client/qrcode/new_branch/service/test")!)
        safari.modalPresentationStyle = .overCurrentContext
        safari.view.alpha = 0.05
        safari.delegate = self
        self.safari = safari
        self.view.isHidden = true
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let safari = safari {
            OperationQueue.main.addOperation {
                self.present(safari, animated: false, completion: nil)
            }
        }
    }
    
    public func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        dismiss(animated: false, completion: nil)
        self.view.isHidden = false
    }
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let items = (urlComponents?.queryItems)! as [NSURLQueryItem]
        if (url.scheme == "newbranch") {
            if let _ = items.first, let propertyName = items.first?.name, let propertyValue = items.first?.value {
                print(propertyName)
                print(propertyValue)
                self.data?.updateValue(propertyValue, forKey: propertyName)
            }
        }
        return false
    }
    
    public func getData() -> Dictionary<String,Any> {
        return self.data!
    }
}
