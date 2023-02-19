{
  "resourceType": "GMSequence",
  "resourceVersion": "1.4",
  "name": "seq_intro",
  "autoRecord": true,
  "backdropHeight": 144,
  "backdropImageOpacity": 0.5,
  "backdropImagePath": "",
  "backdropWidth": 256,
  "backdropXOffset": 0.0,
  "backdropYOffset": 0.0,
  "events": {
    "resourceType": "KeyframeStore<MessageEventKeyframe>",
    "resourceVersion": "1.0",
    "Keyframes": [],
  },
  "eventStubScript": {
    "name": "seq_intro_Events13",
    "path": "scripts/seq_intro_Events13/seq_intro_Events13.yy",
  },
  "eventToFunction": {
    "0": "seq_intro_event_create",
    "1": "seq_intro_event_destroy",
    "2": "seq_intro_event_clean_up",
    "3": "seq_intro_event_step",
    "4": "seq_intro_event_step_begin",
    "5": "seq_intro_event_step_end",
    "6": "seq_intro_event_async_system",
  },
  "length": 350.0,
  "lockOrigin": false,
  "moments": {
    "resourceType": "KeyframeStore<MomentsEventKeyframe>",
    "resourceVersion": "1.0",
    "Keyframes": [],
  },
  "parent": {
    "name": "seq_intro",
    "path": "folders/Sequences/seq_intro.yy",
  },
  "playback": 0,
  "playbackSpeed": 60.0,
  "playbackSpeedType": 0,
  "showBackdrop": true,
  "showBackdropImage": false,
  "spriteId": null,
  "timeUnits": 1,
  "tracks": [
    {"resourceType":"GMAudioTrack","resourceVersion":"1.1","name":"sn_BEAMDOWN","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AudioKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AudioKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AudioKeyframe","resourceVersion":"1.0","Id":{"name":"sn_BEAMDOWN","path":"sounds/sn_BEAMDOWN/sn_BEAMDOWN.yy",},"Mode":0,},},"Disabled":false,"id":"9357de50-f4d0-415a-b944-8112bdfaf2ce","IsCreationKey":false,"Key":0.0,"Length":351.0,"Stretch":false,},
        ],},"modifiers":[],"trackColour":4294073928,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"663a433f-242a-4393-91b8-fb0b512c3e24","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4294073928,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"1e51192e-e651-4743-914d-16545c987c94","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4294073928,"tracks":[],"traits":0,},
      ],"traits":0,},
    {"resourceType":"GMInstanceTrack","resourceVersion":"1.0","name":"obj_player","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AssetInstanceKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AssetInstanceKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AssetInstanceKeyframe","resourceVersion":"1.0","Id":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},},},"Disabled":false,"id":"75ec11e1-939a-4712-93f1-67a00d7733b8","IsCreationKey":false,"Key":0.0,"Length":351.0,"Stretch":false,},
        ],},"modifiers":[
        {"resourceType":"LockedModifier","resourceVersion":"1.0",},
      ],"trackColour":4282934514,"tracks":[
        {"resourceType":"GMColourTrack","resourceVersion":"1.0","name":"blend_multiply","builtinName":10,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<ColourKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<ColourKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"ColourKeyframe","resourceVersion":"1.0","AnimCurveId":null,"Colour":16777215,"EmbeddedAnimCurve":null,},},"Disabled":false,"id":"16a8ef55-4dab-4a5e-9257-dae3c2701678","IsCreationKey":false,"Key":0.0,"Length":1.0,"Stretch":false,},
              {"resourceType":"Keyframe<ColourKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"ColourKeyframe","resourceVersion":"1.0","AnimCurveId":null,"Colour":16777215,"EmbeddedAnimCurve":null,},},"Disabled":false,"id":"3f5c671c-6805-4815-8af6-064114971235","IsCreationKey":false,"Key":179.0,"Length":1.0,"Stretch":false,},
              {"resourceType":"Keyframe<ColourKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"ColourKeyframe","resourceVersion":"1.0","AnimCurveId":null,"Colour":4294967295,"EmbeddedAnimCurve":null,},},"Disabled":false,"id":"94f543a9-625c-443e-894c-7862b09a5b9d","IsCreationKey":false,"Key":180.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4282934514,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"6c17d128-acf1-4bf9-b157-af68da34f5e6","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4282934514,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"Position","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":0.0,"th1":0.072000004,"tv0":0.0,"tv1":0.0,"x":0.0,"y":-80.0,},
                            {"th0":-0.072000004,"th1":0.128,"tv0":0.0,"tv1":0.0,"x":0.36,"y":-80.0,},
                            {"th0":-0.128,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":-80.0,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":0.0,"th1":0.072000004,"tv0":0.0,"tv1":0.0,"x":0.0,"y":-79.8667,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.35400936,"y":-80.65147,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.3603879,"y":-80.9827,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.5370737,"y":21.919264,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.6982855,"y":32.407463,},
                            {"th0":-0.08071213,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":32.058876,},
                          ],"visible":true,},
                      ],"function":1,},"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":0.0,"th1":0.072000004,"tv0":0.0,"tv1":0.0,"x":0.0,"y":-80.0,},
                            {"th0":-0.072000004,"th1":0.128,"tv0":0.0,"tv1":0.0,"x":0.36,"y":-80.0,},
                            {"th0":-0.128,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":-80.0,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":0.0,"th1":0.072000004,"tv0":0.0,"tv1":0.0,"x":0.0,"y":-79.8667,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.35400936,"y":-80.65147,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.3603879,"y":-80.9827,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.5370737,"y":21.919264,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.6982855,"y":32.407463,},
                            {"th0":-0.08071213,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":32.058876,},
                          ],"visible":true,},
                      ],"function":1,},"RealValue":0.0,},},"Disabled":false,"id":"18931434-da6a-466e-83bd-c18b73447dd0","IsCreationKey":false,"Key":0.0,"Length":500.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4282934514,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"6b825323-4840-4b83-b1fc-a174d10c0369","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4282934514,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},},"Disabled":false,"id":"47045253-527f-4ff5-bd75-021bff499de0","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[
            {"resourceType":"LockedModifier","resourceVersion":"1.0",},
          ],"trackColour":4282934514,"tracks":[],"traits":0,},
      ],"traits":0,},
  ],
  "visibleRange": {
    "x": 0.0,
    "y": 349.9999,
  },
  "volume": 1.0,
  "xorigin": 0,
  "yorigin": 0,
}