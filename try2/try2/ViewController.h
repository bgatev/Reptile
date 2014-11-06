//
//  ViewController.h
//  try2
//
//  Created by admin on 10/26/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Reachability.h"

@interface ViewController : UIViewController {
    IBOutlet UIButton *playPauseButton; //Toggles the playback state
    IBOutlet UISlider *volumeControl; //Sets the volume for the audio player
    IBOutlet UILabel *alertLabel; //The alert label showing the status of the loading of the file
    
    AVAudioPlayer *audioPlayer; //Plays the audio
}

@property (nonatomic, retain) IBOutlet UIButton *playPauseButton;
@property (nonatomic, retain) IBOutlet UISlider *volumeControl;
@property (nonatomic, retain) IBOutlet UILabel *alertLabel;

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

- (IBAction)volumeDidChange:(id)slider; //handle the slider movement
- (IBAction)togglePlayingState:(id)button; //handle the button tapping

- (void)playAudio; //play the audio
- (void)pauseAudio; //pause the audio
- (void)togglePlayPause; //toggle the state of the audio


- (IBAction)swipeBackLeft:(UIStoryboardSegue *)segue;

- (IBAction)swipeBackRight:(UIStoryboardSegue *)otherSegue;


@end

