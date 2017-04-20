cd madevent/
ll
ll Events/
vim Cards/proc_card_mg5.dat 
ll
./bin/generate_events 
ll
ls ../../../
ll ~/
ll ~/analyses/
ll ~/analyses/vbfsusytruth/
ll ~/analyses/vbfsusytruth/archived/
ll ~/analyses/vbfsusytruth/archived/mg5_private/
ll ~/analyses/vbfsusytruth/archived/mg5_private/gen/
ll ~/analyses/vbfsusytruth/archived/mg5_private/gen/MG5_aMC_v2
ll ~/analyses/vbfsusytruth/archived/mg5_private/gen/MG5_aMC_v2_5_2/
ll ~/analyses/vbfsusytruth/archived/mg5_private/gen/MG5_aMC_v2_5_2/VBF_Higgsino-N2C1_mN2-100_mC1-80p00/Events/run_01/unweighted_events.lhe.gz 
vim ~/analyses/vbfsusytruth/archived/mg5_private/gen/MG5_aMC_v2_5_2/VBF_Higgsino-N2C1_mN2-100_mC1-80p00/Events/run_01/unweighted_events.lhe.gz 
ll ~/analyses/vbfsusytruth/archived/mg5_private/gen/MG5_aMC_v2_5_2/VBF_Higgsino-N2C1_mN2-100_mC1-80p00/Events/run_01/unweighted_events.lhe.gz 
ll ~/analyses/vbfsusytruth/archived/mg5_private/gen/MG5_aMC_v2_5_2/
ll ~/analyses/vbfsusytruth/archived/official_samples/
ll ~/analyses/vbfsusytruth/archived/official_samples/process/
ll ~/analyses/vbfsusytruth/archived/official_samples/process/madevent/
ll ~/analyses/vbfsusytruth/archived/official_samples/process/madevent/Events/
ll ~/analyses/vbfsusytruth/archived/official_samples/process/madevent/Cards/
ll
cd ~/
cd analyses/
ll
cd vbfsusysoft1lep/
ll
cd analysis/
ll
cd VBFSoft1Lep/
ll
vim ~/forPhilip.txt 
clear
make clean; make -j4
git status
git commit -a -m "update"
git push
make clean; make -j4
git commit -a -m "update"
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_67.root output/hist_VBF-C1N2_leptonicDecays_67.root
kill %
./susyvbf input/softLep-v3_V00-01-10_25ns_miniaodv2/wwlnqq_powheg.root output/hist_wwlnqq_powheg.root
kill %
git commit -a -m "update"
git push
root -l input/signal/unknown_VBF-C1N2_leptonicDecays_1.root 
ll
make clean; make -j4
vim scripts/jobs.txt 
vim scripts/xargs_run.sh 
sh scripts/xargs_run.sh VBF
ll output/
hadd arxiv.root output/*arxiv*
ll
root -l ar
root -l arxiv.root 
vim scripts/jobs.txt 
make clean; make -j4
sh scripts/xargs_run.sh VBF
hadd -f arxiv.root output/*arxiv*
root -l arxiv.root 
make clean; make -j4
./susyvbf input/softLep-v3_V00-01-10_25ns_miniaodv2/wwlnqq_powheg.root output/hist_wwlnqq_powheg.root
sh scripts/xargs_run.sh VBF
vim output/hist_VBF-C1N2_leptonicDecays_31.log
/susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
root -l ./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
root -l input/signal/unknown_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
root -l input/signal/unknown_VBF-C1N2_leptonicDecays_31.root
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
root -l input/signal/unknown_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
root -l input/signal/unknown_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
root -l input/signal/unknown_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
root -l input/signal/unknown_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
root -l input/signal/unknown_VBF-C1N2_leptonicDecays_31.root
vim ../../../triggerpurity/LeptonTreeLooper/LeptonTreeLooper.C_
ll
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
root -l input/signal/unknown_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
kill %
root -l input/signal/unknown_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
kill %
ps
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
kill %
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
root -l output/hist_VBF-C1N2_leptonicDecays_31.root_arxiv.root 
sh scripts/xargs_run.sh VBF
hadd -f arxiv.root output/*arxiv*
root -l arxiv.root 
ll
rm arxiv.root 
ll
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh MjjCut_vbf_nsoftleps ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_subljetpt ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_detajj ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbfmjj ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf)mjj ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_mjj ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_leadleppt ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_ht ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_methtratio ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_summlj ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
kill %
sh scripts/xargs_run.sh 
sh scripts/hadd.sh 
ll
sh scripts/plot_vbf.sh MjjCut_vbf_lepid ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_lepid ' --autostack --nbinx 4' '' 100.0 0.0 90.0 '' 
make clean; make -j4
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
make clean; make -j4
_fullpath scripts/xargs_run.sh 
ll
./susyvbf input/signal/unknown_VBF-C1N2_leptonicDecays_31.root output/hist_VBF-C1N2_leptonicDecays_31.root
root -l output/hist_VBF-C1N2_leptonicDecays_31.root.root
ll
clear
ll
vim scripts/link_input_files.sh 
ll
sh scripts/link_input_files.sh 
ll
vim scripts/jobs.txt 
vim scripts/xargs_run.sh 
cat scripts/jobs.txt 
./susyvbf input/met100presel/ttdl_mg_lo.root                       output/hist_ttdl_mg_lo.root                            &> output/hist_ttdl_mg_lo.log
kill %
./susyvbf input/met100presel/ttdl_mg_lo.root                       output/hist_ttdl_mg_lo.root                            
kill %
ps
ll
ll input/
ll /nfs-6/userdata/mt2/softLep-v3_V00-01-10_25ns_miniaodv2
ll /nfs-6/userdata/
mkdir /nfs-6/userdata/phchang
mkdir /nfs-6/userdata/phchang/vbf
mkdir /nfs-6/userdata/phchang/vbf/met100presel
ll
make clean; make -j4
./susyvbf input/met100presel/ttdl_mg_lo.root                       output/hist_ttdl_mg_lo.root                            
./susyvbf /nfs-6/userdata/phchang/vbf/met100presel/ttdl_mg_lo.root test
ll
vim scripts/xargs_run.sh 
ll
sh scripts/xargs_run.sh 
ll
sh scripts/hadd.sh 
ll
sh scripts/plot_vbf.sh MjjCut_vbf_lepid ' --autostack --nbinx 4' '' 100.0 0.0 90.0 '' 
vim scripts/plot.sh 
vim scripts/plot_V
vim scripts/plot_vbf.sh 
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_lepid ' --autostack --nbinx 4' '' 100.0 0.0 90.0 '' 
ll
make clean; make -j4
sh scripts/xargs_run.sh 
sh scripts/hadd.sh 
sh scripts/plot_vbf.sh MjjCut_vbf_lepid ' --autostack --nbinx 4' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_lepid ' --autostack --nbinx 4' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh AntiMuonCut_vbf_met ' --autostack --nbinx 4' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh AntiMuonCut_vbf_met ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh AntiMuonCut_vbf_mjj ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh AntiMuonCut_vbf_mjj ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh AntiMuonCut_vbf_detajj ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh AntiMuonCut_vbf_met ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh METCut_vbf_met ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh METCut_vbf_met ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh METCut_vbf_mjj ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh METCut_vbf_detajj ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh METCut_vbf_mjj ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh METCut_vbf_detajj ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh DEtajjCut_vbf_detajj ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh DEtajjCut_vbf_mt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_mjj ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_subljetpt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_cenjetpt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_subljetpt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh MTCut_vbf_subljetpt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_mt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh DEtajjCut_vbf_mt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh DEtajjCut_vbf_subljetpt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
make clean; make -j4
sh scripts/xargs_run.sh 
./susyvbf input/met100presel/unknown_VBF-C1N2_leptonicDecays_27.root output/hist_VBF-C1N2_leptonicDecays_27.root
ll
sh scripts/hadd.sh 
sh scripts/plot_vbf.sh DEtajjCut_vbf_subljetpt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_subljetpt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_mt ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_mjj ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_met ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_met ' --autostack --nbinx 60' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_met ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_mjj ' --autostack --nbinx 20' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_mjj ' --autostack --nbinx 10' '' 100.0 0.0 90.0 '' 
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_summlj ' --autostack --nbinx 10' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_lepcent ' --autostack --nbinx 10' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_ht ' --autostack --nbinx 10' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_methtratio ' --autostack --nbinx 10' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_leadjetpt ' --autostack --nbinx 10' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_dphijj ' --autostack --nbinx 10' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_mt ' --autostack --nbinx 10' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10 --overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 20 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_leadleppt ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_leadleppt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh MjjCut_vbf_leadleppt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_leadleppt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 0
make clean; make -j4
git commit -a -m "update"
git status
git push
git log --pretty-oneline
git log --help
git log 
git status
ll
cp -r haddoutput/ archive/haddoutput_f0e7e4653ed374e81aac26f121f552fedae77223
ll
make clean; make -j4
ll
sh scripts/xargs_run.sh 
sh scripts/hadd.sh 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
git status
git commit -a -m "update"
git log | head
git log | head -n 1
git push
cp -r haddoutput/ archive/haddoutput_a9871d416c70bb45731e5e2daff14375afda68ba
ll haddoutput/
ll archive/
ll
sh scripts/plot_vbf.sh MTCut_vbf_met ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjjCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
make clean; make -j4
git commit -a -m "update"
git log | head -n1
sh scripts/xargs_run.sh 
sh scripts/hadd.sh 
kill %
./susyvbf input/met100presel/dyjetsll_lowMll_ht400to600.root output/hist_dyjetsll_lowMll_ht400to600.root
./susyvbf input/met100presel/unknown_VBF-C1N2_leptonicDecays_28.root output/hist_VBF-C1N2_leptonicDecays_28.root
sh scripts/hadd.sh 
sh scripts/plot_vbf.sh MjjCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh METCut_vbf_detajj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh METCut_vbf_detajj ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh METCut_vbf_detajj ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_detajj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_detajj ' --autostack --nbinx 40 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 40 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_mt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
make clean; make -j4
sh scripts/xargs_run.sh 
./susyvbf input/met100presel/qcd_ht300to500_1.root output/hist_qcd_ht300to500_1.root
sh scripts/hadd.sh 
ls
ll
sh scripts/plot_vbf.sh MjjCut_vbf_dphilepmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_dphilepmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_dphilepmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_mt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_mt ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_dphilepmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_dphilepmet ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_mt ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_mt ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_dphilepmet ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh MTCut_vbf_dphilepmet ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh MTCut_vbf_dphilepmet ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_nsoftlep ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MTCut_vbf_nsoftleps ' --autostack --nbinx 30 --show_overflow' '' 100.0 0.0 90.0 '' 
make clean; make -j4
sh scripts/xargs_run.sh 
sh scripts/hadd.sh 
sh scripts/plot_vbf.sh MjjCut_vbf_sumpt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_sumptall ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
make clean; make -j4
sh scripts/plot_vbf.sh MjjCut_vbf_sumptall ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
kill %
sh scripts/xargs_run.sh 
/susyvbf input/met100presel/unknown_VBF-C1N2_leptonicDecays_48.root output/hist_VBF-C1N2_leptonicDecays_48.root./susyvbf input/met100presel/unknown_VBF-C1N2_leptonicDecays_48.root output/hist_VBF-C1N2_leptonicDecays_48.root
./susyvbf input/met100presel/unknown_VBF-C1N2_leptonicDecays_48.root output/hist_VBF-C1N2_leptonicDecays_48.root
sh scripts/hadd.sh 
clear
sh scripts/plot_vbf.sh MjjCut_vbf_dphidijetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh MjjCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
sh scripts/plot_vbf.sh METCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' 
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh METCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '100'
sh scripts/plot_vbf.sh METCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '10'
sh scripts/plot_vbf.sh DetajjCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '10'
sh scripts/plot_vbf.sh DEtajjCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '10'
sh scripts/plot_vbf.sh DEtajjCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh DEtajjCut_vbf_dphidijetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh DEtajjCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh AntiMuonCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh MTCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_dphidijetlep ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_mt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_dphilepmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_mt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh SubleadJetPtCut_vbf_mt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh MTCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh MTCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh MTCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MTCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 99.0 '' '1'
sh scripts/plot_vbf.sh MTCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 96.0 '' '1'
sh scripts/plot_vbf.sh MTCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/plot_vbf.sh 
ll
sh scripts/plot_vbf.sh MTCut_vbf_leadleppt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MTCut_vbf_leadleppt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh MTCut_vbf_leadleppt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
make clean; make -j4
sh scripts/xargs_run.sh 


vim output/hist_VBF-C1N2_leptonicDecays_68.log
vim output/hist_VBF-C1N2_leptonicDecays_37.log
cat output/hist_VBF-C1N2_leptonicDecays_37.log
./susyvbf input/met100presel/unknown_VBF-C1N2_leptonicDecays_68.root output/hist_VBF-C1N2_leptonicDecays_68.root
make clean; make -j4
sh scripts/xargs_run.sh 
sh scripts/hadd.sh 
sh scripts/plot_vbf.sh MTCut_vbf_leadleppt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
root -l haddoutput/hist_vbf_tt.root
make clean; make -j4
sh scripts/xargs_run.sh 
./susyvbf input/met100presel/dyjetsll_lowMll_ht400to600.root output/hist_dyjetsll_lowMll_ht400to600.root
./susyvbf input/met100presel/unknown_VBF-C1N2_leptonicDecays_20.root output/hist_VBF-C1N2_leptonicDecays_20.root
sh scripts/hadd.sh 
sh scripts/plot_vbf.sh MTCut_vbf_leadleppt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_mjj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/plot_vbf.sh 
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 90.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 80.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_met ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_detajj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_detajj ' --autostack --nbinx 20 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_mjj ' --autostack --nbinx 20 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_mlj ' --autostack --nbinx 20 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_mlj0 ' --autostack --nbinx 20 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_mlj1 ' --autostack --nbinx 20 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_summlj ' --autostack --nbinx 20 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_dphijj ' --autostack --nbinx 20 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_dphijj ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_dphilepmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_sumpt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_sumptall ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_ht ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_methtratio ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_cenjetpt ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_njets ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_ht ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_lepcent ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_dphisubljetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
make clean; make -j4
sh scripts/xargs_run.sh 
 
 output/hist_dyjetsll_lowMll_ht200to400.log
vim ~/forPhilip.txt 
cat ~/forPhilip.txt | grep 80X_mcRun2_asymptotic_2016_TrancheIV_v6
cat ~/forPhilip.txt | grep 80X_mcRun2_asymptotic_2016_TrancheIV_v6 | grep \/EWKW
vim ~/forPhilip.txt 
cat ~/forPhilip.txt | grep 80X_mcRun2_asymptotic_2016_TrancheIV_v6 | grep \/EWK
cat ~/forPhilip.txt | grep 80X_mcRun2_asymptotic_2016_TrancheIV_v6 | grep \/EWK | grep -v _ext
cat ~/forPhilip.txt | grep 80X_mcRun2_asymptotic_2016_TrancheIV_v6 | grep \/EWK_LNu
sh scripts/plot_vbf.sh MjjCut_vbf_metphicent ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
./susyvbf input/met100presel/dyjetsll_lowMll_ht200to400.root output/hist_dyjetsll_lowMll_ht200to400.root
sh scripts/hadd.sh 
ll
sh scripts/plot_vbf.sh MjjCut_vbf_metphicent ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_lepphicent ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py l
sh scripts/plot_vbf.sh MjjCut_vbf_lepphicent ' --autostack --nbinx 20 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_lepphicent ' --autostack --nbinx 2 --show_overflow' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_lepphicent ' --autostack --nbinx 3 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/plot_vbf.sh 
vim scripts/make
vim scripts/makeplot.py 
ll
cd ~/login/
ll
git clone git@github.com:rreece/root2html.git
ll
cd root2html/
ll
cd -
cd db298fdf49d4e7254bd6daaea5f7808ced47db72
cd ~/analyses/vbfsusysoft1lep/analysis/VBFSoft1Lep
ll
vim scripts/makeplot.py 
ll
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
ll
vim scripts/makeplot.py 
ll
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
ll
vim scripts/makeplot.py 
ll
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
root -l ~/public_html/test.root 
python ~/login/root2html/root2html.py ~/public_html/test.root 
_publish 
vim scripts/plot_vbf.sh 
vim makepl
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
python ~/login/root2html/root2html.py ~/public_html/test.root 
root -l ~/login/root2html/root2html.py ~/public_html/test.root
ll
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --canvas_name_prefix test' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
python ~/login/root2html/root2html.py ~/public_html/test.root 
vim scripts/makeplot.py 
python ~/login/root2html/root2html.py ~/public_html/test.root 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
python ~/login/root2html/root2html.py ~/public_html/test.root 
root -l ~/public_html/test.root
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
root -l ~/public_html/test.root
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
rm ~/public_html/test.root 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
python ~/login/root2html/root2html.py ~/public_html/test.root 
rm -rf ~/public_html/test
python ~/login/root2html/root2html.py ~/public_html/test.root 
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
python ~/login/root2html/root2html.py ~/public_html/test.root 
_publish
vim ~/login/root2html/
vim ~/login/root2html/root2html.py 
python ~/login/root2html/root2html.py ~/public_html/test.root 
_publish 
vim ~/login/root2html/root2html.py 
python ~/login/root2html/root2html.py ~/public_html/test.root 
_publish 
python ~/login/root2html/root2html.py ~/public_html/test.root 
vim ~/login/root2html/root2html.py 
python ~/login/root2html/root2html.py ~/public_html/test.root 
vim ~/login/root2html/root2html.py 
python ~/login/root2html/root2html.py ~/public_html/test.root 
_publish 
vim ~/login/root2html/root2html.py 
python ~/login/root2html/root2html.py ~/public_html/test.root 
vim ~/login/root2html/root2html.py 
convert -h
vim ~/login/root2html/root2html.py 
python ~/login/root2html/root2html.py ~/public_html/test.root 
vim ~/login/root2html/root2html.py 
python ~/login/root2html/root2html.py ~/public_html/test.root 
vim ~/login/root2html/root2html.py 
ll
vim scripts/makeplot.py 
ll
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
vim ~/login/root2html/root2html.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
python ~/login/root2html/root2html.py ~/public_html/test.root 
vim ~/login/root2html/root2html.py 
python ~/login/root2html/root2html.py ~/public_html/test.root 
vim ~/login/root2html/root2html.py 
python ~/login/root2html/root2html.py ~/public_html/test.root 
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
root -l ~/public_html/test.root
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
vim test.C
root -l -b -q test.

root -l -b -q test.C
ll
root -l test.root
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
root -l test.root
vim test.C
root -l test.root
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l -b -q test.C
vim test.C
root -l test.root
cat test.C
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow' '' 100.0 0.0 95.0 '' '1'
root -l ~/public_html/test.root
python ~/login/root2html/root2html.py ~/public_html/test.root 
_publish 
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot' '' 100.0 0.0 95.0 '' '1'
ll
root -l test.root
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
.ls
ls
root -l test.root.root
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
ll
root -l test.root
vim scripts/makeplot.py 
root -l test.root
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
root -l test.root
ll
rm test.root
rm test.root.root
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
root -l test.root
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
~/ython
python
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot --output_file_open_option recreate' '' 100.0 0.0 95.0 '' '1'
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot1 --output_file_open_option update' '' 100.0 0.0 95.0 '' '1'
ll
root -l test.root
vim scripts/makeplot.py 
sh scripts/plot_vbf.sh MjjCut_vbf_dphileadjetmet ' --autostack --nbinx 10 --show_overflow --output_filename test.root --output_path cut0/testdir/ --output_tcanvas_name myplot2 --output_file_open_option update' '' 100.0 0.0 95.0 '' '1'
vim scripts/plot_vbf.sh 
ll
vim scripts/bulk_plot.sh
sh scripts/bulk_plot.sh 
kill %
vim scripts/makeplot.py 
vim scripts/bulk_plot.sh 
sh scripts/bulk_plot.sh 
ll
python ~/login/root2html/root2html.py ~/public_html/test.root 
_publish 
ll
vim scripts/makeplot.py 
ll
vim scripts/make
ll
vim scripts/bulk_plot.sh 
ll
mv scripts/bulk_plot.sh  scripts/bulk_plot_jobs.txt
vim scripts/xargs_run.sh 
cp scripts/xargs_run.sh scripts/xargs_plot.sh
vim scripts/xargs_plot.sh 
ll scripts/
vim scripts/xargs_plot.sh 
ll
vim scripts/bulk_plot_jobs.txt 
vim scripts/plot_vbf.sh 
ll
vim scripts/plot_vbf.sh 
mkdir ~/public_html/vbfsusysoft1lep/
vim scripts/plot_vbf.sh 
sh scripts/xargs_plot.sh 
vim scripts/bulk_plot_jobs.txt 
sh scripts/xargs_plot.sh 
ls ~/public_html/vbfsusysoft1lep/
ll ~/public_html/vbfsusysoft1lep/
vim ~/login/bash/niceplot.sh
ll ~/public_html/vbfsusysoft1lep/
ls ~/login/bash/niceplot.sh 
vim ~/login/bash/niceplot.sh 
vim ~/login/.bashrc_mine 
jarvis
vim ~/login/bash/niceplot.sh 
jarvis
vim ~/login/bash/niceplots.h
vim ~/login/bash/niceplots.sh 
niceplots 
niceplots ~/public_html/vbfsusysoft1lep/
_publish 
ls uaf-6.t2.ucsd.edu/~phchang/dump//home/users/phchang/public_html/vbfsusysoft1lep//
_publish 
ll
vim scripts/bulk_plot_jobs.txt 
vim scripts/makeplot.py 
sh scripts/xargs_plot.sh 
ls ~/public_html/vbfsusysoft1lep/*.png
rm ~/public_html/vbfsusysoft1lep/*.png
ll
niceplots ~/public_html/vbfsusysoft1lep/
y
_publish 
vim scripts/makeplot.py 
vim scripts/plot_vbf.sh 
ll
vim scripts/plot_vbf.sh 
ll
mkdir plots
ll
ll public_html/
rm -rf public_html/
ll
ll output/
ll
rm test.C 
ll
rm test.root
ll
sh scripts/xargs_plot.sh 
niceplots plots/
_publish 
ls ~/public_html/dump/plots/
ll ~/public_html/dump/
rm -rf ~/public_html/dump/home/
ll
ll ~/public_html/
ll ~
ll ~/public_html/
ll ~/public_html/dump/
ll ~/public_html/
rm -rf ~/public_html/
ll
ll public_html/
rm -rf public_html/
ll
vim ~/login/bash/niceplot.sh 
vim ~/login/bash/niceplots.sh 
niceplots plots/
_publish 
ll
ll ~/public_html/
ll ~/public_html/dump/
ll ~/public_html/dump/plots/
vim ~/login/bash/niceplots.sh 
mkdir -p ~/syncfiles/miscfiles/
niceplots plots/
y
_publish
ll ~/public_html/dump/
vim ~/login/bash/niceplot.sh 
vim ~/login/bash/niceplots.sh 
ll ~/public_html/
ll ~/public_html/dump/
ll ~/public_html/dump/plots/
ll ~/
ll ~/syncfiles/
ll ~/syncfiles/miscfiles/
vim ~/login/bash/niceplots.sh 
ll ~/
ll ~/login/
cp ~/../namin/syncfiles/miscfiles/index.php ~/syncfiles/miscfiles/
ll ~/public_html/dump/plots/
_publish 
cp ~/public_html/dump/plots/ ~/public_html/
cp -r ~/public_html/dump/plots/ ~/public_html/
ll ~/public_html/
ll
cp -r plots/ ~/public_html/
yes | cp -r plots ~/public_html/
cp plots/MjjCut_vbf_dphijj.pdf ~/public_html/
_publish 
vim ~/login/bash/niceplots.sh 
vim ~/login/bash/niceplot.sh 
chmod -R 755 ~/public_html/
jarvis
vim ~/login/bash/niceplot.sh 
niceplots plots
y
rm -rf ~/public_html/dump/
lll
ll
vim ~/login/bash/niceplot.sh 
vim ~/login/bash/niceplots.sh 
ll
ll ~/
mkdir ~/public_html/dump
ll
cp -r plots ~/public_html/dump/
_publish 
ls ~/public_html/dump/
ll ~/public_html/
_publish 
ll
rm -rf plots/
ll
vim ~/
ll
sh scripts/xargs_plot.sh 
mkdir plots
sh scripts/xargs_plot.sh 
ll
ll plots
vim scripts/plot_vbf.sh 
ll
rm -rf public_html/
ll
ll ~/public_html/
rm -rf ~/public_html/*
cp ~namin/public_html/.htaccess ~/public_html/
vim ~/public_html/.htaccess 
ll
niceplots plots/
vim ~/login/bash/framework.sh 
grep publish ~/login/bash/
grep publish ~/login/bash/*
vim ~/login/bash/apache.sh 
_publish 
mv ~/public_html/dump/ ~/public_html/dump2
ll ~/public_html/dump2/
ll ~/
ll ~/public_html/
ll ~/public_html/dump2/
cp ~/public_html/dump2/plots/* ~/public_html/
_publish 
ll ~/public_html/
mv ~/public_html/* ~/public_html/dump2/
ll ~/public_html/
mv ~/public_html/dump2/* ~/public_html/dump2/plots/
yes | mv ~/public_html/dump2/* ~/public_html/dump2/plots/
ll
rm -rf ~/public_html/dump2/
ll
ll ~/public_html/
vim ~/syncfiles/miscfiles/index.php 
vim ~/public_html/.htaccess 
niceplots plots/
_publish 
ll ~/public_html/
ll ~/public_html/dump/
ll ~/public_html/dump/plots/
vim ~/public_html/.htaccess 
ll ~/public_html/
ll ~/public_html/dump/
ll ~/public_html/dump/plots/
cp -r ~/public_html/dump/plots/ ~/public_html/
vim ~/login/bash/niceplots.sh 
ll
jarvis
niceplots plots
vim ~/login/bash/niceplot.sh 
vim ~/login/bash/niceplots.sh 
echo $(hostname)
vim ~/login/bash/niceplots.sh 
niceplots plots
y
vim ~/login/bash/niceplots.sh 
ll ~/public_html/
rm ~/public_html/*
rm -rf ~/public_html/*
ll
./resume_work.sh 
screen -rd soft
clear
screen -ls
screen
./resume_work.sh 
screen -rd
./resume_work.sh 
screen -rd
screen -ls
ll
screen
screen -rd soft
exit
./resume_work.sh 
exit
screen -rd
screen -ls
exit
./resume_work.sh 
screen -rd
screen -rd soft
screen -rd
screen -rd soft
./re
screen -rd soft
./resume_work.sh 
screen -rd soft
rm public_html/*.pdf
ll
./resume_work.sh 
screen -rd soft
exit
screen -ls
screen
screen -rd
screen -rd soft
screen -rd
screen
screen -rd 
screen -rd
exit
jarvis
cd analyses/
ll
cd vbfsusysoft1lep/
cd analysis/VBFSoft1Lep/
ll
ls plots
ls
ll
cat scripts/bulk_plot_jobs.txt | grep MTCut | grep sigshape
cat scripts/bulk_plot_jobs.txt | grep MTCut | grep sigshape > plot.txt 
sh xargs_plot.sh plot.txt 
rm plots/*
sh xargs_plot.sh plot.txt 
yes | niceplots plots plots_MTCut
vim `plots/MTCut_vbf_detajj_sigshape.log'
vim MTCut_vbf_dphidijetlep_sigshape.log
vim plots/MTCut_vbf_dphidijetlep_sigshape.log
_setupCMS
sh xargs_plot.sh plot.txt 
yes | niceplots plots plots_MTCut
vim src/*.h
git commit -a -m "update"
sh fullprocess.sh 201704191350
kill %
vim src/*.h
cat scripts/bulk_plot_jobs.txt | grep METCut| grep sigshape > plot.txt 
vim plot.txt 
rm plots/*
sh xargs_plot.sh plot.txt 
yes | niceplots plots plots
yes | niceplots plots 
vim scripts/*.h
vim src/*.h
git commit -a -m "update"
sh fullprocess.sh 201704191355
vim src/*.h
cat plot.txt 
sh scripts/plot_vbf.sh vbf_cutflow '--print_cutflow' '' '_cutflow'
ls plot
ls plots/vbf_cutflow_cutflow.csv 
vim plots/vbf_cutflow_cutflow.csv 
ls plots/
vim scripts/bulk_plot_jobs.txt 
sh scripts/plot_vbf.sh vbf_cutflow '--print_cutflow' '' '_signorm'
yes | niceplots plots 
screen -rd 
screen
screen -rd
screen -rd
