Place short demo GIFs here (5-12s). GIFs are ideal for README demos but keep them small (<5MB) and looped.

Suggested tools:
- Peek (Linux GUI) for screen recording to GIF.
- asciinema + svg-term-cli for terminal recordings.
- ffmpeg to convert and optimize GIFs.

Example conversion (ffmpeg):

```bash
# record a short mp4 then convert to gif
ffmpeg -i demo.mp4 -vf "fps=15,scale=800:-1:flags=lanczos" -gifflags -transdiff -y demo.gif
```

Add GIFs and reference them from the top-level `README.md`.
