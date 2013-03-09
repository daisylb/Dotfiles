############
# FIRST THING FIRST, LOCK DOWN AND BACK UP
# - Set up a firmware password
# - Install Prey
# - Install CrashPlan

import os, sys
import urllib
from cStringIO import StringIO
from zipfile import ZipFile
from subprocess import check_call, check_output
from tempfile import mkdtemp

def app_zip(app_bundle, zip_url, open_if_installed=False):
	if os.path.exists('/Applications/' + app_bundle):
		print "{} was already installed".format(app_bundle)
		return
	print "Installing {}... ".format(app_bundle),
	sys.stdout.flush()
	
	temp_dir = mkdtemp()
	temp_zip = temp_dir + "/arch.zip"
	urllib.urlretrieve(zip_url, temp_zip)
	
	zf = ZipFile(temp_zip)
	zf.extract(app_bundle, temp_dir)
	check_call(('rm', '-rf', temp_dir))
	print "Done."
	if open_if_installed:
		check_call(('open', '/Applications/{}'.format(app_bundle)))

def app_dmg(app_bundle, dmg_url, open_if_installed=False):
	pass

def pkg_dmg(file_to_check, dmg_url):
	pass

def pkg_url(file_to_check, url):
	pass

def py_basics():
	if not os.path.exists('/usr/local/bin/virtualenv'):
		check_call(('sudo', 'easy_install', 'virtualenv'))
	if not os.path.exists('/usr/local/bin/pip'):
		check_call(('sudo', 'easy_install', 'pip'))

def py_pkg(package_name):
	"""Installs a Python package globally.
	
	Will not work if Pip is not present. Note that Python packages used
	for development should be installed in virtualenvs.
	"""
	check_call(('sudo', 'pip', 'install', package_name))

def brew_basics():
	if not os.path.exists('/usr/local/bin/brew'):
		check_call(('bash', '-c', 'ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"'))

_homebrew_list = None

def brew_pkg(package_name):
	global _homebrew_list
	
	# generate list of packages
	if _homebrew_list is None:
		output = check_output(('brew', 'list'))
		_homebrew_list = [x for x in output.split('\n') if x != '']
	
	if package_name not in _homebrew_list:
		print "Installing {} using Homebrew".format(package_name)
		check_call(('brew', 'install', package_name))
	else:
		print "{} was already installed".format(package_name)

def node_pkg(package_name):
	pass

def symlink(dest, link_name, force=False):
	exists = os.path.exists(link_name)
	if exists and force:
		os.unlink(link_name)
	if force or not exists:
		os.symlink(dest, link_name)

################################################################################

ROOT = os.path.abspath(os.path.dirname(__file__))

# Frameworks
py_basics()
brew_basics()
pkg_url("/usr/local/bin/node", "http://nodejs.org/dist/v0.8.18/node-v0.8.18.pkg")

# System Utilities
app_zip("Alfred.app", "http://cachefly.alfredapp.com/alfred_1.3.2_265.zip", True)
app_zip("BetterTouchTool.app", "http://www.boastr.de/BetterTouchTool.zip", True)
app_zip("Keyboard Maestro.app", "http://www.keyboardmaestro.com/action/download?km-kmi-2-j", True)
app_dmg("RescueTime.app", "https://www.rescuetime.com/setup/installer?os=mac", True)
app_zip("The Unarchiver.app", "http://theunarchiver.googlecode.com/files/TheUnarchiver3.6.1.zip")
app_dmg("Dropbox.app", "https://www.dropbox.com/download?plat=mac", True)
pkg_dmg("/Applications/Sophos Anti-Virus.app", "http://downloads.sophos.com/home-edition/savosx_80_he.10.8+.dmg")
pkg_dmg("/Applications/VirtualBox.app", "http://download.virtualbox.org/virtualbox/4.2.6/VirtualBox-4.2.6-82870-OSX.dmg")
app_zip("gfxCardStatus.app", "http://codykrieger.com/downloads/gfxCardStatus-2.3.zip", True)
brew_pkg("gnutls")
py_pkg('openmeta')
brew_pkg("wkhtmltopdf")

# Software Development
app_zip("Chocolat.app", "http://files.fileability.net/Chocolat_1.4.3.zip")
app_dmg("IntelliJ IDEA 12.app", "http://download.jetbrains.com/idea/ideaIU-12.0.1.dmg")
app_dmg("Kaliedoscope.app", "https://updates.blackpixel.com/latest?app=ks")
app_dmg("SourceTree.app", "http://downloads.atlassian.com/software/sourcetree/SourceTree_1.5.7.1.dmg")
brew_pkg("git")
py_pkg('bpython')
py_pkg('httpie')
node_pkg("less")
node_pkg("coffee-script")
node_pkg("editr")

# Databases
brew_pkg("postgresql")
# check_call(("ln", "-sfv", "/usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents"))
# initdb /usr/local/var/postgres -E utf8
# createdb adam
# check_call(("launchctl", "load", "~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"))
# check_call(("launchctl", "start", "homebrew.mxcl.postgresql"))
brew_pkg("mysql")
# need to link in launch agent for this too
# set -e TMPDIR
# mysql_install_db --verbose --user=(whoami) --basedir=(brew --prefix mysql) --datadir=/usr/local/var/mysql --tmpdir=/tmp
# Admin Party! grant all on *.* to ''@'localhost' with grant option;

# Servers
# these will only install after databases
# brew_pkg('httpd', tap='homebrew/dupes') # doesn't work
brew_pkg('php52', tap='josegonzalez/homebrew-php', options=('--with-pgsql', '--with-mysql'))

# Media
app_zip("MPlayerX.app", "http://mplayerx.googlecode.com/files/MPlayerX-1.0.17.zip")
app_dmg("Adapter.app", "http://www.macroplant.com/release/Adapter-1.4.3.dmg")

# Organisation
app_zip("Itsycal.app", "https://s3.amazonaws.com/itsycal/Itsycal-0.2.0.zip", True)

# Communication
app_zip("Colloquy.app", "http://colloquy.info/downloads/colloquy-latest.zip")
pkg_dmg("", "http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.4.dmg") # required for gtk
#check_call(('open', '-a', 'Firefox', 'https://www.rescuetime.com/installers/rescuetime-firefox-extension.xpi'))

# Miscellaneous
pkg_dmg("/usr/local/bin/pandoc", "http://pandoc.googlecode.com/files/pandoc-1.9.4.2.dmg")
node_pkg("kanso")

# Add symlinks
for f in os.listdir(os.path.join(ROOT, "launch_agents")):
	link_path = os.path.expanduser("~/Library/LaunchAgents/{}".format(f))
	agent_id = f.replace('.plist', '')
	symlink(os.path.join(ROOT, "launch_agents", f), link_path)
	check_call(('launchctl', 'load', link_path))
	check_call(('launchctl', 'start', agent_id))