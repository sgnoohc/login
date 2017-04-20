#!/bin/env python

# this script uses icalendar pacakge from here: https://pypi.python.org/pypi/icalendar/2.1
# download and install the package
#
# this script reads the list of events in "rawcal.ics" and outputs to "cal.ics"
#
# it will search keywords based on the event "name" of the indico meetings.

# ADD YOUR KEYWORDS HERE ---------------------------------------------------------
# INCLUDE IF THE INDICO MEETING TITLE CONTAINS THE FOLLOWING KEYWORD
includekeyword = [
#"HWW weekly meeting",
"HSG6",
"H to WW",
"H to WW Editorial Board",
"Physics Plenary",
#"HH",
#"Higgs Prospects",
#"Invisible",
"HBSM",
"Neubauer Group Meeting",
"Illinois",
"UIUC",
"FTK",
"Trigger General Meeting",
"Menu Coordination Meeting",
"VBF triggers for Run 2",
"Track-jet",
"track-jet",
"VBF + VH Signal Cross Sections",
"Combined Task Force meeting",
"Higgs Approval Meeting",
#"Coordination Meeting",
"ATLAS Weekly",
"LHC-HCG",
#"Heavy (MSSM) Higgs tautau",
"Informal Particle Flow Meeting",
"Higgs Trigger Validation Status Discussion",
#"Exotics HH-->4b Exotics Analysis Meeting",
"Trigger Menu",
"Jet Trigger",
#"VBS",
#"VBF",
"b-jet trigger",
"Exotics meeting",
"h->scalars informal meeting",
]
# EXCLUDE IF THE INDICO MEETING TITLE CONTAINS THE FOLLOWING KEYWORD
# I typically like to add a specific title name in order not to exclude wanted events
excludekeyword = [
"HSG3 informal: High Mass",
"H to WW Spin Editorial Board",
"HSG3 properties meeting",
"SMU",
"Manchester-UCL-Heidelberg VBF/VBS meeting",
"VBS W(lnu)V(jj)jj informal meeting",
"Heavy Ion Trigger Menu Forum",
]
# ADD YOUR KEYWORDS HERE ---------------------------------------------------------


#=================================================================================
# code starts here
#=================================================================================

from icalendar import Calendar, Event

rawcal = Calendar.from_string(open('rawcal.ics','rb').read())
newcal = Calendar()
print '==================== These are the list of all meetings dl\'ed ========================'
for component in rawcal.walk():
    try:
        isadd = False
        for inkey in includekeyword:
            if component.get('summary').find(inkey) != -1:
                isexclude = False
                for exkey in excludekeyword:
                    #print exkey, component.get('summary'), component.get('summary').find(exkey)==-1
                    if component.get('summary').find(exkey) != -1:
                        isexclude = True
                if not isexclude:
                    isadd = True
        if isadd:
            newcal.add_component(component)
            if component.name == 'VEVENT':
                print 'O: ',component.get('summary')
        else:
            if component.name == 'VEVENT':
                print 'X: ',component.get('summary')
    except:
        continue

print ''
print ''
print ''
print '==================== You have exported the following meetings ========================'
for component in newcal.walk():
    if component.name == 'VEVENT':
        print '   ',component.get('summary')

print '======================================================================================'

f = open('cal.ics', 'w')
f.write(newcal.as_string())
f.close()
