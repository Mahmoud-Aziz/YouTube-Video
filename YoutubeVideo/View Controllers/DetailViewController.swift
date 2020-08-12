//
//  DetailViewController.swift
//  YoutubeVideo
//
//  Created by Mahmoud Aziz on 8/12/20.
//  Copyright © 2020 Mahmoud Aziz. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    

    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var webView: WKWebView!
    
    
    @IBOutlet weak var textField: UITextView!
    
    var video:Video?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textField.text = "" 
        
        //check if there's a video
        guard video != nil else {
            return
        }
        
        //create the embed URL
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        //load it into the webview
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //set the title
        titleLabel.text = video!.title
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //set the description
        textField.text = video!.description
        
        
    }
    


}
