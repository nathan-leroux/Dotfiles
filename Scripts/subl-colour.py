#!/bin/python3

# python script to sync color settings for sublime text
#
import subprocess as sp
import json

CONFIG_PATH = "/home/nath/.config/sublime-text/Packages/dynamic.sublime-color-scheme"
# load in xresources vars
def load_xresources():
	def trim_and_pair(field):
		#to be used as argument to map()
		# take the first field and split
		pair = field.split(sep="\t")

		# return pair of values
		# if not able to be split, ignore
		if len(pair) == 2:
			return tuple(pair)
		else:
			return None

	def is_colour(field):
		def is_universal(field):
			return field[0][0] == "*"

		def is_relevent(field):
			# this is vom
			relevent = ["color", "foreground", "background"]
			for key in relevent:
				if key in field[0]:
					return True
			return False

		# if it is not a pair, return false
		if field is None:
			return False

		# if it is a universal var (starts with *) return True
		return is_universal(field) and is_relevent(field)

	def clean_key(field):
		return field[0].strip("*:"), field[1]


	# split the query into each field
	query = sp.run(["xrdb", "-query"], capture_output=True, text=True).stdout
	query = query.split(sep='\n')

	#for each field, remove whitespace and return as a pair
	return dict(map(clean_key, filter(is_colour, map(trim_and_pair,query))))



# read the json object in
# file is located at .config/sublime-text/Packages
def read_config():
	with open(CONFIG_PATH) as config_file:
		return json.load(config_file)
		
def edit_config(config, new_vars):
	#config is in the form of a json
	config["variables"] = new_vars
	return config

def write_config(config):
	with open(CONFIG_PATH, mode='w') as config_file:
		json.dump(config, config_file)



# write the variables to the json
# have option for written syntax differantly
# write out the rest of the file
if __name__ == '__main__':
	new_vars = load_xresources()
	config = read_config()
	write_config( edit_config(config, new_vars))
