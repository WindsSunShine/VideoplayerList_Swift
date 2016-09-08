//
//  ViewController.swift
//  VideoListSwift
//
//  Created by 张建军 on 16/9/7.
//  Copyright © 2016年 张建军. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,VideoTabViewCellDelegate {

    
    //  创建播放的数据源
    
    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width

    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    var videoTableView = UITableView(frame:CGRectMake(0, 0, 0, 0),style: .Plain)
    
    var playViewController = AVPlayerViewController()
    
    var playerView = AVPlayer()
    
    let playerBtn = UIButton(type: .Custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "PlayVideo"
        self.setupTableView()
        
    }
    
    
    func setupTableView() {
        
        videoTableView.frame =  CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        
        videoTableView.delegate = self
        videoTableView.dataSource = self
    // 注册自定义的cell
        
    videoTableView.registerClass(VideoTableViewCell.self, forCellReuseIdentifier: "VideoTableViewCell")
    
    self.view.addSubview(videoTableView)
        
    }

    
// 代理方法
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = VideoTableViewCell(style: .Default, reuseIdentifier: "VideoTableViewCell")
        
        let video = data[indexPath.row]
        
        cell.delegate = self
        cell.videoTitleLabel.text = video.title
     cell.videoScreenshot.image = UIImage(named: video.image)
        cell.videoSourceLabel.text = video.source
        return cell

    }
    
    // tableView Delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 220
        
    }
    
    // videoCellDelegate  ---- 实现代理方法
    
    func ButtonDidClcik() {
       
        
        // 获取本地视频的路径
        let path = NSBundle.mainBundle().pathForResource("emojizone", ofType: "mp4")
        
        playerView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        
        playViewController.player = playerView
        
        self.presentViewController(playViewController, animated: true) { 
            self.playViewController.player?.play()
        }
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

