#!/usr/bin/env python
##########################################################################
##                                                                      ##
##                               MadWeight                              ##
##                               ---------                              ##
##########################################################################
##                                                                      ##
##   author: Mattelaer Olivier (CP3)                                    ##
##       email:  olivier.mattelaer@uclouvain.be                         ##
##   modified by Rogier Van der geer                                    ##
##########################################################################
##                                                                      ##
##   license: GNU                                                       ##
##   last-modif:08/07/08                                                ##
##   version 1.2                                                        ##
##                                                                      ##
##########################################################################
##                                                                      ##                       
## README:                                                              ##
##     input: a regular lhe file                                        ##
##     output: a lhco file                                              ##
##                                                                      ##
##     how to launch the program:                                       ##
##        $> python ./convert_lhe_lhco input_file output_file           ##
##        (output file we overwritted)                                  ##
##        or                                                            ##
##        $> python ./convert_lhe_lhc and follows instruction           ##
##########################################################################
##                                                                      ##
##   Content                                                            ##
##   -------                                                            ##
##                                                                      ##
##      + Particle                                                      ##
##      |   + init                                                      ##
##      |   + def_pid                                                   ##
##      |   + cal_mass                                                  ##
##      |   + cal_pt                                                    ##
##      |   + cal_phi                                                   ##
##      |   + cal_eta                                                   ##
##      |   |    +   check_def                                          ##
##      |   + lhco_line                                                 ##
##      + part_quadvec  -> Particle                                     ##
##      |   + init                                                      ##
##      |   + add                                                       ##
##      + Pass_from_lhe_to_lhco                                         ##
##      |   + init                                                      ##
##      |   + find_begin_blok                                           ##
##      |   + find_end_blok                                             ##
##      |   + put_in_output                                             ##
##      |   |    +   define_particle                                    ##
##      |   |    +   write_output                                       ##
##                                                                      ##
##                                                                      ##
##########################################################################
import sys
import math
import re
##########################################################################
##                    START CODE
##########################################################################


#1 ########################################################################
class Particle:
    """particle information"""
    
    #2 ########################################################################
    def __init__(self):
        """start a particle"""



        self.pid=''
        self.E=''
        self.px=''
        self.py=''
        self.pz=''
        self.pt=''
        self.phi=''
        self.y=''
        self.mass=''

    #2 ########################################################################
    def def_pid(self,pid):
        """ define pid of the particle """
        self.pid=int(pid)
        
    #2 ########################################################################
    def cal_mass(self):
        """ define mass from quadri impulsion """

        if not self.check_def(['E','px','py','pz']):
            sys.exit('Particle error: Quadri impulsion not define (error for mass routine)')


        
        if self.E**2-self.px**2-self.py**2-self.pz**2>1e-7:         #precision problem
            self.mass=math.sqrt(self.E**2-self.px**2-self.py**2-self.pz**2)
        else:
            self.mass=0

    #2 ########################################################################
    def def_mass(self,mass):
        """ put the value for the mass """

        self.mass=float(mass)

        
    #2 ########################################################################        
    def cal_pt(self):
        """define pt from quadri impulsion"""

        if not self.check_def(['E','px','py','pz']):
            sys.exit('Particle error: Quadri impulsion not define (error for pt routine)')

        self.pt =math.sqrt(self.px**2+self.py**2)

    #2 ########################################################################
    def cal_phi(self):
        """define phi from quadri impulsion"""

        if not self.check_def(['E','px','py','pz']):
            sys.exit('Particle error: Quadri impulsion not define (error for phi routine)')

        if(self.px>0):
            self.phi=math.atan(self.py/self.px)
        elif(self.px<0):
            self.phi=math.atan(self.py/self.px)+math.pi
        elif(self.py>0): #remind that p(1)=0
            self.phi=math.pi/2.0
        elif(self.py<0): # remind that p(1)=0
            self.phi=-math.pi/2.0
        else:
            print "Warning self.phi not properly defined put value to 0"
            self.phi=0
                    
        if(self.phi<0):
            self.phi=self.phi+2*math.pi

        return self.phi
    #2 ########################################################################                
    def cal_eta(self):
        """define y from quadri impulsion"""

        if not self.check_def(['E','px','py','pz']):
            sys.exit('Particle error: Quadri impulsion not define (error for eta routine)')
            
        theta=math.acos(self.pz/math.sqrt(self.px**2+self.py**2+self.pz**2))
        self.eta=-math.log(math.tan(theta/2.0))

    #3 ########################################################################        
    def check_def(self,data_list):
        """ check if everything is defined """

        if type(data_list)!=list:
            data_list=[data_list]
            
        for value in data_list:
            if type(eval('self.'+value))==str:
                print "failed for", value
                return 0
        return 1

    #2 ########################################################################
    def lhco_line(self):
        """ define the line for the lhco line (without the initial tag)
            this is a first simple, trully naive, routine.
        """
        if not self.check_def(['eta','phi','pt','mass','pid']):         
                sys.exit('Particle error: some attribute not defined')

        jet=[1,2,3,4,5,6,21]
        inv_list=[12,14,16,18,1000022,1000023,1000024,1000025,1000035]

        #define pid-> type
        pid_to_type={11:1,-11:1,13:2,-13:2,15:3,-15:3,22:0}
        for data in jet:
            pid_to_type[data]=4
            pid_to_type[-data]=4
        for data in inv_list:
            pid_to_type[data]=6
            pid_to_type[-data]=6


        
        type=''
        for key in pid_to_type.keys():
            if self.pid==key:
                type=pid_to_type[key]
                break
            
        if type=='':
            print 'Warning unknown type'
            return ''

        text ='  '+str(type)      #type LHCO
        text+='  '+str(self.eta)  #ETA
        text+='  '+str(self.phi)  #PHI
        text+='  '+str(self.pt)   #PT
        text+='  '+str(self.mass) #JMASS
        if self.pid in [11,13]:   #NTRK
            text+='  -1'         
        else:
            text+='  1'
        if self.pid in [-5,5]:    #BTAG
            text+='  2'
        else:
            text+='  0'
        text+='  0'               #HAD/EM
        text+='  0'               #DUMMY 1
        text+='  0'               #DUMMY 2
        
        return text
    
#1 ########################################################################
class part_quadvec(Particle):
    """ particle define from quadri impulsion """

    #2 ########################################################################
    def __init__(self,E,px,py,pz):
        """ define from a quadri vector """
        Particle.__init__(self)
        self.E=float(E)
        self.px=float(px)
        self.py=float(py)
        self.pz=float(pz)
        self.cal_pt()
        self.cal_phi()
        self.cal_eta()
        #self.cal_mass()
        #print self.E,self.px,self.py,self.pz
        #print self.pt,self.phi,self.eta

    #2 ########################################################################
    def add(self,particle):
        """ add two quadri vector """

        if not self.check_def(['E','px','py','pz']):         
            sys.exit('Particle error: Quadri impulsion not define')
        if not particle.check_def(['E','px','py','pz']):         
            sys.exit('Particle error: Quadri impulsion not define')
                
        neut=part_quadvec(self.E+particle.E,self.px+particle.px,self.py+particle.py,self.pz+particle.pz)
        neut.cal_mass()
        return neut


#1 ########################################################################
class Pass_from_lhe_to_lhco:


    #2 ########################################################################
    def __init__(self,input,output,maxev):

        self.still_to_read=1
        self.nb_data=0
        self.input=open(input,'r')
        self.output=open(output,'w')
        while 1:
            if (self.nb_data==maxev):
                break
            self.find_begin_blok()           
            text=self.find_end_blok()
            if text:
                self.put_in_output(text)
            else:
                break
            self.nb_data+=1

    #2 ########################################################################
    def find_begin_blok(self):

        tag=re.compile('''<event>''',re.I)
        while 1:
            line=self.input.readline()
            if line=='':
                self.still_to_read=0
                return
            if tag.search(line):
                return
        
    #2 ########################################################################
    def find_end_blok(self):

        tag=re.compile(r'''</event>''')
        text=[]
        
        while 1:
            line=self.input.readline()
            if line=='':
                self.still_to_read=0
                return
            text.append(line)
            if tag.search(line):
                return text
            
    #2 ########################################################################
    def put_in_output(self,text):
        """ analyse the event and write the lhco """

        inv_list=[12,14,16,18,1000022,1000023,1000024,1000025,1000035]
        inv_list+=[-12,-14,-16,-18,-1000022,-1000023,-1000024,-1000025,-1000035]
        particle_content=[]
        neut=0
        for line in text:
            particle=self.define_particle(line)
            if particle==0:
                continue
            
            if particle.pid in inv_list:
                if neut==0:
                    neut=particle
                else:
                    neut=neut.add(particle)
            else:
                particle_content.append(particle)

        if neut:
            neut.pid=12
            particle_content.append(neut)

        self.write_output(particle_content)

    #3 ########################################################################
    def define_particle(self,line):
        """ define the particle from the lhe line """

        pattern=re.compile(r'''^\s*
        (?P<pid>-?\d+)\s+             #PID
        (?P<status>1)\s+            #status (1 for output particle)
        (?P<mother>-?\d+)\s+          #mother
        (?P<dum3>-?\d+)\s+              #mother
        (?P<color1>[+-e.\d]*)\s+    #color1
        (?P<color2>[+-e.\d]*)\s+    #color2
        (?P<px>[+-e.\d]*)\s+        #px
        (?P<py>[+-e.\d]*)\s+        #py
        (?P<pz>[+-e.\d]*)\s+        #pz
        (?P<E>[+-e.\d]*)\s+         #E
        (?P<mass>[+-e.\d]*)\s+      #mass
        (?P<dum1>[+-e.\d]*)\s+      #dummy1
        (?P<dum2>[+-e.\d]*)\s*      #dummy2
        $                           #end of string
        ''',66) #verbose+ignore case
        if pattern.search(line):
            obj=pattern.search(line)
            E=obj.group('E')
            px=obj.group('px')
            py=obj.group('py')
            pz=obj.group('pz')
            particle=part_quadvec(E,px,py,pz)
            particle.def_mass(obj.group('mass'))
            particle.def_pid(obj.group('pid'))
            return particle
        else:
            return 0



    #3 ########################################################################
    def write_output(self,content):
        """ write the input from the content info """
        text="""# typ eta            phi              pt               jmass  ntrk  btag  had/em   dummy  dummy\n"""
        self.output.writelines(text)
        text="0     "+str(self.nb_data)+"     "+str(len(content))+"\n"
        self.output.writelines(text)

        i=1
        for particle in content:
            text=str(i)+'   '+particle.lhco_line()+'\n'
            self.output.writelines(text)
            i+=1



##########################################################################
##                    END CODE
##########################################################################
if __name__=='__main__':
    opt=sys.argv
    print len(opt)
    if len(opt)==3:
        input=opt[1]
        output=opt[2]
        maxev=-1
    elif len(opt)==4:
        input=opt[1]
        output=opt[2]
        maxev=int(opt[3])
    else:
        input=raw_input('enter the position of the input lhe file')
        output=raw_input('enter the position of the output lhco file')
        maxev=-1
        
    Pass_from_lhe_to_lhco(input,output,maxev)
