printf "\e[35mNDN with PCD and persistent-static content and an transmission range of range-100. (non-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=n --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=0 --content-trigger-l-end=400 --content-trigger-x-speed=0 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/non-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/non-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/non-infra

printf "\e[35mNDN with PCD and persistent-static content and an transmission range of range-100. (sparse-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=s --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=0 --content-trigger-l-end=400 --content-trigger-x-speed=0 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/sparse-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/sparse-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/sparse-infra

printf "\e[35mNDN with PCD and persistent-static content and an transmission range of range-100. (mod-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=m --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=0 --content-trigger-l-end=400 --content-trigger-x-speed=0 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/mod-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/mod-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/mod-infra

printf "\e[35mNDN with PCD and persistent-static content and an transmission range of range-100. (dense-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=d --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=0 --content-trigger-l-end=400 --content-trigger-x-speed=0 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/dense-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/dense-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static/dense-infra

printf "\e[35mNDN with PCD and persistent-mobile content and an transmission range of range-100. (non-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=n --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=0 --content-trigger-l-end=400 --content-trigger-x-speed=3 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/non-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/non-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/non-infra

printf "\e[35mNDN with PCD and persistent-mobile content and an transmission range of range-100. (sparse-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=s --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=0 --content-trigger-l-end=400 --content-trigger-x-speed=3 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/sparse-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/sparse-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/sparse-infra

printf "\e[35mNDN with PCD and persistent-mobile content and an transmission range of range-100. (mod-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=m --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=0 --content-trigger-l-end=400 --content-trigger-x-speed=3 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/mod-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/mod-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/mod-infra

printf "\e[35mNDN with PCD and persistent-mobile content and an transmission range of range-100. (dense-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=d --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=0 --content-trigger-l-end=400 --content-trigger-x-speed=3 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/dense-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/dense-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile/dense-infra

printf "\e[35mNDN with PCD and transient-static content and an transmission range of range-100. (non-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=n --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=100 --content-trigger-l-end=200 --content-trigger-x-speed=0 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/non-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/non-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/non-infra

printf "\e[35mNDN with PCD and transient-static content and an transmission range of range-100. (sparse-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=s --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=100 --content-trigger-l-end=200 --content-trigger-x-speed=0 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/sparse-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/sparse-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/sparse-infra

printf "\e[35mNDN with PCD and transient-static content and an transmission range of range-100. (mod-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=m --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=100 --content-trigger-l-end=200 --content-trigger-x-speed=0 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/mod-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/mod-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/mod-infra

printf "\e[35mNDN with PCD and transient-static content and an transmission range of range-100. (dense-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=d --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=100 --content-trigger-l-end=200 --content-trigger-x-speed=0 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/dense-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/dense-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static/dense-infra

printf "\e[35mNDN with PCD and transient-mobile content and an transmission range of range-100. (non-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=n --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=100 --content-trigger-l-end=200 --content-trigger-x-speed=3 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/non-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/non-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/non-infra

printf "\e[35mNDN with PCD and transient-mobile content and an transmission range of range-100. (sparse-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=s --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=100 --content-trigger-l-end=200 --content-trigger-x-speed=3 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/sparse-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/sparse-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/sparse-infra

printf "\e[35mNDN with PCD and transient-mobile content and an transmission range of range-100. (mod-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=m --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=100 --content-trigger-l-end=200 --content-trigger-x-speed=3 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/mod-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/mod-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/mod-infra

printf "\e[35mNDN with PCD and transient-mobile content and an transmission range of range-100. (dense-infra)\e[0m\n"
./waf --run "ndn-v2v-simple --pcd-mode=true --interest-freq=10.0 --node-transmission-range=100.0 --num-nodes=22 --simulation-length=200 --infra-mode=d --content-trigger-x-start=1000 --content-trigger-x-end=1100 --content-trigger-l-start=100 --content-trigger-l-end=200 --content-trigger-x-speed=3 --trace-file=$SUMO_PROJECTS_ROOT/pcd-sparse/non-infra/ns2-trace.tcl --anim-file=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/dense-infra/ndn-v2v-test.xml --trace-output=/home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/dense-infra"
Rscript $FYP_RSCRIPTS/rate-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile/dense-infra

Rscript $FYP_RSCRIPTS/content-level-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-static
Rscript $FYP_RSCRIPTS/content-level-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/persistent-mobile
Rscript $FYP_RSCRIPTS/content-level-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-static
Rscript $FYP_RSCRIPTS/content-level-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse/transient-mobile

Rscript $FYP_RSCRIPTS/demmand-level-graph.R /home/conor/Desktop/Desktop/named-data/results/FYP_RESULTS_100/pcd-sparse
