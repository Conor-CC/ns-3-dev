# A template script for testing scenario functionality and modes as well as
# metrics gathering.
printf "\nBeginning Simulation\n====================\n"

# ./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=0.1 --num-nodes=5 --simulation-length=200 --infra-mode=d --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=0 --content-trigger-l-end=200 --content-trigger-x-speed=0 --trace-file=$SUMO_PROJECTS_ROOT/pcd-test-1/ns2-trace.tcl --anim-file=$FYP_RESULTS/pcd-test-1/with-pcd/ndn-v2v-test.xml --trace-output=$FYP_RESULTS/pcd-test-1/with-pcd"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=0.1 --num-nodes=22 --simulation-length=400 --infra-mode=m --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=0 --content-trigger-l-end=400 --content-trigger-x-speed=3 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=$FYP_RESULTS/pcd-sparse/persistent-static/non-infra/ndn-v2v-test.xml --trace-output=$FYP_RESULTS/pcd-sparse/persistent-static/non-infra"


# printf "====================\nSimulation complete. Generating outputs...\n"
# Rscript $FYP_RSCRIPTS/rScripts/rate-graph.R $FYP_RESULTS/pcd-test-1/with-pcd $FYP_RESULTS/pcd-test-1/with-pcd
# Rscript $FYP_RSCRIPTS/rate-graph.R $FYP_RESULTS/pcd-sparse/transient-static/non-infra
#
# Rscript $FYP_RSCRIPTS/content-level-graph.R $FYP_RESULTS/pcd-sparse/persistent-static
# Rscript $FYP_RSCRIPTS/content-level-graph.R $FYP_RESULTS/pcd-sparse/persistent-mobile
# Rscript $FYP_RSCRIPTS/content-level-graph.R $FYP_RESULTS/pcd-sparse/transient-static
# Rscript $FYP_RSCRIPTS/content-level-graph.R $FYP_RESULTS/pcd-sparse/transient-mobile

# Rscript $FYP_RSCRIPTS/demmand-level-graph.R $FYP_RESULTS/pcd-sparse


printf "Finished.\n"
