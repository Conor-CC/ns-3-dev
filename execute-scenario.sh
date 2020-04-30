# A template script for testing scenario functionality and modes as well as
# metrics gathering.
printf "\e[35mNDN with PCD and persistent-static content and an transmission range of range-100. (non-infra)\e[0m\n"
./waf --run "ndn-v2v-simple
            --pcd-mode=true
            --interest-freq=0.1
            --node-transmission-range=300.0
            --num-nodes=3
            --simulation-length=200
            --infra-mode=n
            --content-trigger-x-start=1000
            --content-trigger-x-end=1100
            --content-trigger-l-start=0
            --content-trigger-l-end=400
            --content-trigger-x-speed=0
            --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl
            --anim-file=$FYP_RESULTS/project-demonstration-results/ndn-v2v-test.xml
            --trace-output=$FYP_RESULTS/project-demonstration-results"

Rscript $FYP_RSCRIPTS/rate-graph.R $FYP_RESULTS/project-demonstration-results

# Rscript $FYP_RSCRIPTS/content-level-graph.R $FYP_RESULTS/pcd-sparse/persistent-static
# Rscript $FYP_RSCRIPTS/content-level-graph.R $FYP_RESULTS/pcd-sparse/persistent-mobile
# Rscript $FYP_RSCRIPTS/content-level-graph.R $FYP_RESULTS/pcd-sparse/transient-static
# Rscript $FYP_RSCRIPTS/content-level-graph.R $FYP_RESULTS/pcd-sparse/transient-mobile

# Rscript $FYP_RSCRIPTS/demmand-level-graph.R $FYP_RESULTS/pcd-sparse


printf "Finished.\n"
