DoorstopAlien
=============

This is a funny and professional Morser application.


Wiki Documents
=============
http://code.google.com/p/doorstop-alien/

TODO
=============
1.Using cocos-builder to simplify the UI definment;

2.Apply the morse code play implementation;

3.Game play scene functionality apply;

...

About
=============

Morse's interest in electricity, aroused in his college days, was further stimulated by the lectures of James F. Dana in 1827 and later by contacts with university faculty. Learning in 1832 of Ampère's idea for the electric telegraph, Morse worked for the next 12 years, with the aid of the chemist Leonard Gale, physicist Joseph Henry, and machinist Alfred Vail to perfect his own version of the instrument. So many phases of the telegraph, however, had already been anticipated by other inventors, especially in Great Britain, Germany, and France, that Morse's originality as the inventor of telegraphy has been questioned; even the Morse code did not differ greatly from earlier codes, including the semaphore. In any case, in 1844 Morse demonstrated to Congress the practicability of his instrument by transmitting the famous message “What hath God wrought” over a wire from Washington to Baltimore. Morse subsequently was compelled to defend his invention in court, although by then he commanded the acclaim of the world. He later experimented with submarine cable telegraphy. Both Morse and John Draper were instrumental in introducing the daguerreotype in the United States.

Overview
=============

The app provides software interfaces for implementing Morse audio features in applications we created for iOS. In iOS, Core Audio capabilities include recording, playback, sound effects, positioning, format conversion, and file stream parsing, as well as:

1.A built-in equalizer and mixer that you can use in our applications

2.Automatic access to Morse audio input and output hardware

Use cases
=============

Here are some scenarios that illustrate how to choose the audio session category that provides an audio experience users appreciate.

*Scenario 1: An educational app that helps people learn a new language(Morse code).* We provide:

1.Feedback sounds that play when users tap specific controls(some Morse simulators);

2.Translating/Recordings of words and phrases that play when users want to hear examples of correct pronunciation
_In this application, sound is essential to the primary functionality. People use this app to hear words and phrases in the language(MorseCode) they’re learning, so the sound should play even when the device locks or is switched to silent. Because users need to hear the sounds clearly, they expect other audio they might be playing to be silenced._

_To produce the audio experience users expect for this app, you would use the Playback category. Although this category can be refined to allow mixing with other audio, this app should use the default behavior to ensure that other audio does not compete with the educational content the user has explicitly chosen to hear?_

*Scenario 2: A Voice(MorseSound) over internet .* We provide:

1.The ability to accept audio input

2.The ability to play audio

_In this app, sound is essential to the primary functionality. People use this app to communicate with others, often while they’re currently using a different application. Users expect to be able to receive calls when they’ve switched their device to silent or the device is locked, and they expect other audio to be silent for the duration of a call. They also expect to be able to receive and continue calls when the app is in the background._

_To produce the expected user experience for this app, you would use the Play and Record category. In addition, you would be sure to activate your audio session only when you need it so that users can use other audio between calls._

*Scenario 3: A cloud app that allows users to upload their text(MorseCode) and graphics(MorseSoundEffect) to a website. *We provide:

1.A short startup sound file

2.Various short sound effects that accompany user actions (such as a sound that plays when a post has been uploaded)

3.An alert sound that plays when a posting fails

Use case in focus:
=============

![Screenshot of "MindMap"](http://www.lookbackon.com/MerePawn/Doorstop_Alien_mindo.png)

1.Learn the Morse code translation;

2.Practise typing the Morse code sound;

3.Share the Morse sound effect;

Use case proposal:
=============

1.Morse Code speech recognition;

2.Text to Morse Code speech;

3.Type user's first Morse Code letter;

SWOT analyst
=============

![Screenshot of "SWOT"] (https://github.com/yangboz/DoorstopAlien/blob/master/SWOT_DoorStopAlien.png)

High level design
=============

![Screenshot] (http://www.lookbackon.com/MerePawn/TetradOfArtGameDesign.jpg)

![Screenshot] (http://www.lookbackon.com/MerePawn/HighLevelDesign_game_scene_layout.jpg)

Low level design
=============

![Screenshot] (https://developer.apple.com/library/ios/documentation/MusicAudio/Conceptual/CoreAudioOverview/Art/core_audio_layers.jpg)

![Screenshot] (http://www.learn-cocos2d.com/api-ref/1.0/cocos2d-iphone-mac/html/interface_c_c_node__inherit__graph.png)

![Screenshot] (http://www.lookbackon.com/MerePawn/DoorstopAlien_low_level_design.jpg)

Data Model
=============

Learning Data Model
=============

Diagram:

![Screenshot] (http://www.lookbackon.com/MerePawn/learning_data_model.jpg)

Sample XML:

[http://www.lookbackon.com/MerePawn/learning_data_model.xml]

Practice Data Model
=============

Diagram:

![Screenshot] (http://www.lookbackon.com/MerePawn/practice_data_model.jpg)

Sample XML:

[http://www.lookbackon.com/MerePawn/practice_data_model.xml]

Game Data Model
=============

Diagram:

![Screenshot] (http://www.lookbackon.com/MerePawn/game_data_model.jpg)

Sample XML:

[http://www.lookbackon.com/MerePawn/game_data_model.xml]

Environment Requirement
=============

1.Intel-based Mac running Mac OS X Snow Leopard or later;

2.You must be registered as an Apple Developer;

3.XCode4+;

4.iPhone/iPad;

![Screenshot] (https://developer.apple.com/library/ios/documentation/Xcode/Conceptual/ios_development_workflow/art/ios_workflow_guide_intro.jpg)

Q&&A
=============

Q:What is a Morse code?

A:Morse code is a method of transmitting text information as a series of on-off tones, lights, or clicks that can be directly understood by a skilled listener or observer without special equipment.

Q:Why do people play Morse code?

A:At the time, Morse code was by far the easiest way of communication.

Q:What a taxonomy of Morse code?

A:

Q:How the computer as a Morse code technology?

A:

Q:What's the Morse code design sequence?

A:

Q:How to design techniques and ideals on Morse code?

A:

Q:How the future of Morse code?

A:

Q:The development of Excalibur?

A:Objective-c,cocos2d.

Technical Specifications
=============

1.iOS provides audio processing plug-ins that support mixing, equalization, format conversion, and realtime input/output for recording, playback, offline rendering, and live conversation such as for VoIP (Voice over Internet Protocol). You can dynamically load and use—that is, host—these powerful and flexible plug-ins, known as audio units, from your iOS application.

2.iOS flash light

3.The iOS sdk has two functions that would vibrate the iPhone. But Vibration hardware is present only on iPhones. So how will you alert your user who uses the app on iPad or iPod touches? Clearly, checking the model is not the way to go. There are two seemingly similar functions that take a parameter kSystemSoundID_Vibrate:

AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);

AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

Both the functions vibrate the iPhone. But when you use the first function on devices that don’t support vibration, it plays a beep sound. The second function on the other hand does nothing on unsupported devices.


Tools
=============

[http://www.mindomo.com/ Mindomo] Mindomo is a versatile Web-based mind mapping tool, with this tool you can create, edit mind maps, and share them with your colleagues or your friends.

[http://www.gliffy.com/ Gliffy] With Gliffy you can easily create professional-quality flowcharts, diagrams, floor plans, technical drawings, and more.

[http://icon-generator.net/ Icon-generator] Icon-generator online.

[http://cocosbuilder.com/ Cocos2d Scene Builder] CocosBuilder Drag And Drop Scene Builder For Cocos2D

[http://www.robertecker.com/hp/research/morse-generator.php] Morse Code: MIDI & Text Generator 

[http://www.politepix.com/openears] A shared library for voice recognition

[http://mudcu.be/labs/Thumbnail-Generator/] Online free thumbnail batch generator

[http://stackoverflow.com/questions/10523914/how-to-implement-the-string-scaudiostream-sound-cloud] Sound cloud

Tutorials
=============

[http://www.raywenderlich.com/tutorials] Tutorials for iPhone / iOS Developers and Gamers

[http://www.dribin.org/dave/blog/archives/2010/05/02/ipad_dev_camp_slides/] 2010 iPad Dev Camp Chicago

[http://www.codeproject.com/Articles/396252/Developing-an-app-that-sends-SMS-messages]

[http://www.raywenderlich.com/2361/how-to-create-and-optimize-sprite-sheets-in-cocos2d-with-texture-packer-and-pixel-formats]

[http://www.gskinner.com/gmodeler/app/run.html] free online UML diagramming and documentation tool

Resources
=============

[http://freegamedev.net/wiki/index.php/Free_3D_and_2D_art_and_audio_resources]

[http://letsmakegames.org/resources/art-assets-for-game-developers/]

[http://www.lostgarden.com/search/label/free%20game%20graphics]

[http://www.ironstarmedia.co.uk/resources/free-game-assets/browse/graphics] Free game arts

[http://freegamearts.tuxfamily.org/] Free game arts

[http://www.funplosion.com/free-assets.html] Free game assets

[http://www.soundjay.com/beep-sounds-1.html] Beep sounds

References
=============

[http://en.wikipedia.org/wiki/Morse_code] Wiki

[http://www.surina.net/soundtouch/] Open Source SoundTouch Audio Processing Library

[http://connect.creativelabs.com/openal/default.aspx] OpenAL

[http://css.dzone.com/articles/html5-remotely-vibrate-phone] DZone

[http://code.google.com/p/mobilesynth/] Open Source Synthesizer for the iPhone

[http://beausievers.com/synth/synthbasics/] Music synthesis basics

[http://www.sequencer.de/synthaudio/synthesizer-basics.html] Another music synthesis basics

[http://cocoawithlove.com/2010/10/ios-tone-generator-introduction-to.html]

[http://tech.slashdot.org/story/03/07/29/235254/Morse-Code-Migrating-To-The-Net]

Attribution
=============

[http://www.godsandidols.com/] www.GodsAndIdols.com
