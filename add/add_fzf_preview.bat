@echo off
set "file=%1"
set "file=%file:/=\%"
type %file%
