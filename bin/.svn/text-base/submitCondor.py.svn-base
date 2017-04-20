#!/bin/env python

import os
import sys
from optparse import OptionParser
import tool

# help function
def usage():
    print 'ERROR - Usage:'
    print ''
    optionhelpmsg = []
    optionhelpmsg.append('-j,--jobname=runSample')
    optionhelpmsg.append('-e,--executable=/path/to/my/executable')
    optionhelpmsg.append('[-a,--args="-a blah -b blah -c blah"]')
    optionhelpmsg.append('[-v,--verbose]')
    print '    %s %s'%(sys.argv[0],' '.join(optionhelpmsg))
    print ''
    print ''
    print 'But you typed:'
    print '  >   %s'%(' '.join(sys.argv))
    sys.exit(-1)

# option parser
parser = OptionParser()

# jobname option
parser.add_option('-j', '--jobname', dest='jobname', help='short jobname to indicate what job you\'re running')

# executable option
parser.add_option('-e', '--executable', dest='executable', help='path to my executable')

# args option
parser.add_option('-a', '--args', dest='args',
                  help='String that will be passed as arguments to the executable')

# verbose option
parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
                  help='print verbose output')

# parse options
(options, args) = parser.parse_args()

# check if a sample is provided
if not options.jobname: usage()
if not options.executable: usage()
if not options.args: options.args=""

# get jobcounter
jobcounterfilepath = os.getenv("HOME") + "/login/bin/jobcounter"
jobcounter = open(jobcounterfilepath).readlines()[0].strip()
print 'job # = ',jobcounter

# submission script path
sbm_script_path = os.getenv("HOME")+"/.qtool_condor/.condor.script."+jobcounter
run_script_path = os.getenv("HOME")+"/.qtool_condor/.exec.script."+jobcounter+".sh"

############################
# condor template
############################

template="""
############
#
# Example submit file for vanilla job
#
############

Universe       = vanilla
Executable     = EXECPATH

output = condor/EXEC_$(Cluster).out
error  = condor/EXEC_$(Cluster).out
log    = condor/EXEC_$(Cluster).log

#arguments = $(Process)

input   = /dev/null

queue
"""

sbm_script_content = template.replace("EXECPATH", run_script_path)
sbm_script_content = sbm_script_content.replace("EXEC", options.jobname)
sbm_script = open(sbm_script_path, "w")
sbm_script.write(sbm_script_content)


############################
# exec template
############################

#run_script_content="""
#!/bin/bash
#
#source /home/osg/manageTier3SW/ATLASLocalRootBase/x86_64/root/5.34.18-x86_64-slc5-gcc4.3/bin/thisroot.sh
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/osg/manageTier3SW/ATLASLocalRootBase/x86_64/root/5.34.18-x86_64-slc5-gcc4.3/lib
#export PATH=/home/osg/manageTier3SW/ATLASLocalRootBase/x86_64/Gcc/gcc435_x86_64_slc5/gcc-alt-435/x86_64-slc5-gcc43-opt/bin/:${PATH}
#export LD_LIBRARY_PATH=/home/osg/manageTier3SW/ATLASLocalRootBase/x86_64/Gcc/gcc435_x86_64_slc5/gcc-alt-435/x86_64-slc5-gcc43-opt/lib64:${LD_LIBRARY_PATH}
#export PYTHONPATH=${PYTHONPATH}:/home/osg/manageTier3SW/ATLASLocalRootBase/x86_64/root/5.34.18-x86_64-slc5-gcc4.3/lib
#export PATH=/home/osg/manageTier3SW/ATLASLocalRootBase/x86_64/python/2.6.5-x86_64-slc5-gcc43/sw/lcg/external/Python/2.6.5/x86_64-slc5-gcc43-opt/bin:${PATH}
#"""
run_script_content = "#!/bin/bash\n"
run_script_content += options.executable + " "
run_script_content += options.args + "\n"
run_script = open(run_script_path, "w")
run_script.write(run_script_content)
os.chmod(run_script_path, 0775)

sbm_script.close()
run_script.close()

#	os.system("condor_submit %s"%sbm_script_path)
os.system("condor_submit_dag %s"%sbm_script_path)


# increment jobcounter
jobcounterfilepath = os.getenv("HOME") + "/login/bin/jobcounter"
jobcounterfile = open(jobcounterfilepath, "w")
jobcounterfile.write("%d" % (int(jobcounter) + 1))


tool.saveCommand()
