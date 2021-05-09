### Running on the host
Assuming you're on Debian 10 in root bash, do:
```
wget -O /tmp/install.sh https://raw.githubusercontent.com/alepar/chia-plotman/HEAD/install.sh && source /tmp/install.sh
```

### Checking state
Inside cloned 'chia-plotman' directory do:
- `. ./chia.sh`

This will get you into virtalenv, that contains all tools (chia, plotman, supervisor). Once inside, you can poke around, eg:
- `plotman status`
- `plotman interactive`
- `chia plots check`
etc

### Stopping
- `./stop.sh` - This will stop plotman. Any already running plots will be kept.
- `plotman kill ...` - This will kill explicitly listed plots
