//
//  Constants.swift
//  YoutubeVideo
//
//  Created by Mahmoud Aziz on 8/12/20.
//  Copyright © 2020 Mahmoud Aziz. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyBUT7ERPGC2WTbdS4_sa7JPMvRHhlh28FA"
    static var PLAYLIST_ID = "PLHFlHpPjgk70oyFU2DHn0mqXZxqUxySsb"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEO_ID = "VideoCell"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}
