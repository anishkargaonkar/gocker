#!/bin/sh

if [ "$GO_DEP" = true ]; then
  go get -u github.com/golang/dep/cmd/dep
  # dep init
  dep ensure
else
  go install -v .
fi

if [ "$DEBUG" = true ] ; then
  go get -u github.com/go-delve/delve/cmd/dlv
  go get -u github.com/cortesi/modd/cmd/modd
  modd -f ./modd-debug.conf
fi

if [ "$WATCH" = true ] ; then
  go get -u github.com/cortesi/modd/cmd/modd
  modd
fi

if [ "$BUILD" = true ] ; then
  go build -o $BIN_NAME .
  if [ "$EXEC" = true ] ; then
    ./$BIN_NAME
  fi
fi
