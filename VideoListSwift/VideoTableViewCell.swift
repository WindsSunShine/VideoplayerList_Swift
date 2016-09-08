//
//  VideoTableViewCell.swift
//  VideoListSwift
//
//  Created by 张建军 on 16/9/7.
//  Copyright © 2016年 张建军. All rights reserved.
//

import UIKit
// 创建结构体
struct video {
    
    let image: String
    let title: String
    let source: String
    
}
// 定义协议
//协议用于指定特定的实例属性或类属性，而不用指定是存储型属性或计算型属性。此外还必须指明是只读的还是可读可写的。
//协议中的通常用var来声明变量属性，在类型声明后加上{ set get }来表示属性是可读可写的，只读属性则用{ get }来表示 例如 ：
/**
 **
 protocol classa {

 var marks: Int { get set }
 var result: Bool { get }
 
 func attendance() -> String
 func markssecured() -> String
 
 }
**/

protocol VideoTabViewCellDelegate {
    
    func ButtonDidClcik()
    
}

class VideoTableViewCell: UITableViewCell {

    //声明实例变量
    // 设置一个代理变量
    var delegate: VideoTabViewCellDelegate?
    var videoScreenshot = UIImageView(image: UIImage.init(named: "videoScreenshot01"))
    
    var videoTitleLabel = UILabel()
    var videoSourceLabel = UILabel()
    var videoPlayBtn = UIButton(type: .Custom)
    let SCREEN_WITH = UIScreen.mainScreen().bounds.size.width
    let SCTREEN_HIEGTH = UIScreen.mainScreen().bounds.size.height

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: .Default, reuseIdentifier: nil)
        self.awakeFromNib()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // 初始化值
        videoSourceLabel.frame = CGRectMake(0, 197, SCREEN_WITH, 14)
        videoSourceLabel.font = UIFont.systemFontOfSize(10)
        videoSourceLabel.textAlignment = NSTextAlignment.Center
        videoSourceLabel.textColor = UIColor.greenColor()
        
        
        videoTitleLabel.frame = CGRectMake(0, 173, SCREEN_WITH, 16)
        videoTitleLabel.textColor = UIColor.greenColor()
        videoTitleLabel.font = UIFont.systemFontOfSize(14)
        videoTitleLabel.textAlignment = NSTextAlignment.Center
        
//         初始化话背景图
        
        videoScreenshot.frame = CGRectMake(0, 0, SCREEN_WITH, 220)
        videoScreenshot.backgroundColor = UIColor.greenColor()
        // 初始化播放按钮
        videoPlayBtn.frame = CGRectMake((SCREEN_WITH - 200)/2, 60, 200, 100)
        videoPlayBtn.setImage(UIImage(named: "playBtn"), forState: .Normal)
        
        videoPlayBtn.addTarget(self, action: #selector(self.videoBtnClick), forControlEvents: .TouchUpInside)
        // 将控件添加到cell 上 【添加顺序】
        self.addSubview(videoScreenshot)// 背景视图
        self.addSubview(videoPlayBtn)// 添加播放按钮
        self.addSubview(videoSourceLabel)// 添加Lable
        self.addSubview(videoTitleLabel)// 添加视频标题
        
        
        
        
        
    }
    
 // 代理方法的声明
    func videoBtnClick() {
        
        delegate?.ButtonDidClcik()
    }
    


}
