//
//  BuyViewController.swift
//  Astrology
//
//  Created by Rishabh Wadhwa on 24/11/15.
//  Copyright © 2015 Sunpac Solutions. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //To set the parameters of the sliding banner
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, 125)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        
        //To set all the images of the sliding banner
        let imgOne = UIImageView(frame: CGRectMake(0, 0,scrollViewWidth, 125))
        imgOne.image = UIImage(named: "bannerImage")
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0,scrollViewWidth, 125))
        imgTwo.image = UIImage(named: "careerProblems")
        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0,scrollViewWidth, 125))
        imgThree.image = UIImage(named: "bannerImage")
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        
        //To set the overall size of scroller
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 3, self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        
        //To auto slide the banner
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "moveToNextPage", userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //To update the page control as the banner slides
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        var currentPage:CGFloat = floor((scrollView.contentOffset.x+pageWidth/2)/pageWidth)
        if(currentPage==2) {
            currentPage=0
        }
        else {
            currentPage = currentPage+1
        }
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
    }
    
    //Auto slide the banner function
    func moveToNextPage (){
        scrollViewDidEndDecelerating(scrollView)
        let pageWidth:CGFloat = CGRectGetWidth(self.scrollView.frame)
        let maxWidth:CGFloat = pageWidth * 3
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth{
            slideToX = 0
        }
        self.scrollView.scrollRectToVisible(CGRectMake(slideToX, 0, pageWidth, CGRectGetHeight(self.scrollView.frame)), animated: true)
    }
}
