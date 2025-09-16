// Test-script for Emacs integration

// Boot the server
s.boot;

// A simple sine wave synth
(
SynthDef(\sin_tone, {
    |out=0, freq=440, amp=0.5, gate=1|
    var env = EnvGen.kr(Env.adsr(0.01, 0.5, 0.8, 0.5), gate, doneAction: 2);
    var sig = SinOsc.ar(freq) * env * amp;
    Out.ar(out, sig ! 2);
}).add;
)

// Play a tone at 440 Hz
x = Synth(\sin_tone, [\freq, 440]);

// Stop the tone after 5 seconds
x.set(\gate, 0);
