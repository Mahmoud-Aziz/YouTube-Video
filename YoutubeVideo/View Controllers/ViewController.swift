//
//  ViewController.swift
//  YoutubeVideo
//
//  Created by Mahmoud Aziz on 8/12/20.
//  Copyright © 2020 Mahmoud Aziz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //confirm that video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //get a refrence for the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //get a refrence to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        //set the video property of the detail vview controler
        detailVC.video = selectedVideo
    }
    
    //MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        //set the returned videos to our video property
        self.videos = videos
        
        //refresh the tableview
        tableView.reloadData()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
    //MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEO_ID , for: indexPath) as! VideoTableViewCell
        
        //get the title for the video
        let video = self.videos[indexPath.row]
        
        
        cell.setCell(video)
        
        //return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}

