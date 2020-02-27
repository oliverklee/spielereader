\version "2.18.2"
\language "english"

\header {
%   title = "Gubutanz"
  tagline = ""
}

\paper{
  indent=0\mm
  line-width=120\mm
  oddFooterMarkup=##f
  oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  scoreTitleMarkup = ##f
}

global = {
  \key c \major
  \time 4/4
%   \tempo 4 = 120
  % 1.0 would be the default value, but bigger values tend to make the lyrics
  % a lot more readable.
  \override Lyrics.LyricSpace.minimum-distance = #2.0
}

% 20 would be the default size.
#(set-global-staff-size 19)

melody = \relative c' {
  c8 c c e g4 r | g8 e g e c4 r | \break
  c8 c c e g4 r | g8 e g e c4 r | \break
  \override NoteHead.style = #'cross
  c'4 r8 c c4 r8 c | c c r4 c16 c8 c16~ c4 |
  r1 | \break
}

words = \lyricmode {
  If you look at me,
  Gu -- bu you will see.
  If you stand by me,
  Gu -- bu you can be.
  Hey! Gu -- bu!
  At -- ten -- tion!
  Look at me! __
}

music = {
  \new Staff = "voice" \with {midiInstrument = #"voice oohs"} <<
    \new Voice = "melody" {
      \repeat volta 2 {
        \melody
      }
    }
    \new Lyrics \lyricsto "melody" \words
  >>
}

\score {
  <<
    \music
  >>

  \layout {}
}
