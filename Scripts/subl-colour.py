#!/bin/python3

# python script to sync color settings for sublime text
#
import subprocess as sp
import json

_CONFIG_PATH = "/home/nath/.config/sublime-text/Packages"
SYNTAX_PATH = f"{_CONFIG_PATH}/dynamic.sublime-color-scheme"
THEME_PATH = f"{_CONFIG_PATH}/dynamic.sublime-theme"

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

	def is_hex(value):
		# for asserting that the values being writen to the json
		# are actually hex values
		hash = value[0] == "#"
		valid_values = all(map((lambda x: x in "0123456789abcdef"), value[1:]))
		length = len(value) == 7
		return hash and valid_values and length

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
	result = dict(map(clean_key, filter(is_colour, map(trim_and_pair,query))))

	# check for success
	assert all(map(is_hex, result.values()))

	return result



# read the json object in
# read, edit and write should be generic

# file is located at .config/sublime-text/Packages
def read_config(path):
	with open(path) as config_file:
		return json.load(config_file)
		
def edit_config(config, new_vars, location):
	assert isinstance(location, list)
	assert isinstance(config, dict)

	# target is where to update values
	og = config.copy()

	target = config
	for key in location:
		target = target[key]

	# update
	target = new_vars

	#return the whole json
	assert og != config
	return config


def write_config(path, config):
	with open(path, mode='w') as config_file:
		json.dump(config, config_file, indent=4)

def update_config(path, vars, key):
	config_json = read_config(path)
	write_config(path, edit_config(config_json, vars, key))


def dummy_run(new_vars):
	theme = "/home/nath/Scripts/dummy-theme.json"
	colors = "/home/nath/Scripts/dummy-color-scheme.json"
	update_config(theme, new_vars, ["variables", "colors"])
	update_config(colors, new_vars, ["variables"])

	print(read_config(theme["variables"]))
	print(read_config(colors))

if __name__ == '__main__':
	# load and clean xresources
	new_vars = load_xresources()

	dummy_run(new_vars)
	# update syntax an theme colors
	#update_config(SYNTAX_PATH, new_vars)
	#update_config(THEME_PATH, new_vars)
