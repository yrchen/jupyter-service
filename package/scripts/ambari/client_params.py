#!/usr/bin/env python
from resource_management.libraries.functions.version import format_stack_version, compare_versions
from resource_management import *
import ambari_helpers as helpers

# server configurations
config = Script.get_config()

package_dir = helpers.package_dir()
files_dir = package_dir + 'files/'
scripts_dir = package_dir + 'scripts/'

commands = ['cd /tmp; sh ' + scripts_dir + 'shell/python3.5_setup.sh ' + files_dir]
