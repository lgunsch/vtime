#! /usr/bin/env python
# encoding: utf-8

# the following two variables are used by the target "waf dist"
VERSION = '0.6'
APPNAME = 'vtime'

# these variables are mandatory ('/' are converted automatically)
top = '.'
out = 'build'

def options(opt):
	opt.load('compiler_c')
	opt.load('vala')

def configure(conf):
	conf.load('compiler_c vala')
	conf.check_vala(min_version=(0,10,0))
	conf.check_cfg(package='glib-2.0', uselib_store='GLIB', atleast_version='2.16.0', mandatory=1, args='--cflags --libs')
	conf.check_cfg(package='gtk+-2.0', uselib_store='GTK', atleast_version='2.16.0', mandatory=1, args='--cflags --libs')

def build(bld):
	bld.recurse('src')

