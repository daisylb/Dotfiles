import os
import urllib2
from cStringIO import StringIO
from zipfile import ZipFile
from subprocess import check_call

def app_zip(app_bundle, zip_url, open_if_installed=False):
	if os.path.exists('/Applications/' + app_bundle):
		print "{} was already installed".format(app_bundle)
		return
	print "Installing {}...".format(app_bundle),
	download = urllib2.urlopen(zip_url)
	flo = StringIO(download.read())
	zf = ZipFile(flo)
	zf.extract(app_bundle, '/Applications/')
	print "Done."
	if open_if_installed:
		check_call(('open', '/Applications/{}'.format(app_bundle)))

app_zip("Chocolat.app", "http://files.fileability.net/Chocolat_1.4.3.zip")
app_zip("Alfred.app", "http://cachefly.alfredapp.com/alfred_1.3.2_265.zip", True)
app_zip("BetterTouchTool.app", "http://www.boastr.de/BetterTouchTool.zip", True)