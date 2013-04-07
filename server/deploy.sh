#!/bin/bash

bundle install && cap deploy:setup && cap deploy:migrations
