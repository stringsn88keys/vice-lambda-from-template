function handler () {
  EVENT_DATA=$2

  cd vice-package

  ./x128 -silent -sound -ntsc -keybuf "10 graphic 1
    20 scnclr
    30 circle 1,100,100,20
    run
  " +warp -limitcycles 8000000 -exitscreenshotvicii /tmp/$1.png 2>&1 >/dev/null
  cd ..


  RESPONSE="{\"isBase64Encoded\": true, \"headers\": {\"Content-type\": \"image/png\", \"content-disposition\":\"attachment; filename=$1.png\"}, \"statusCode\":200, \"body\":\"`base64 /tmp/$1.png`\"}"

  echo $RESPONSE
}

