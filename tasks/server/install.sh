#!/usr/bin/env bash
cd $SERVER_APP_PATH && mix deps.get && mix deps.compile && cd $ROOT_APP_PATH