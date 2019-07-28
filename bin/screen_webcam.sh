#!/bin/bash
mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -geometry 100%:100% -fps 24 -noborder
