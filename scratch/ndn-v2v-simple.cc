#include "ns3/core-module.h"

#include "ns3/ns2-mobility-helper.h"
#include "ns3/wifi-80211p-helper.h"
#include "ns3/wave-mac-helper.h"
#include "ns3/mobility-module.h"
#include "ns3/network-module.h"
#include "ns3/wifi-module.h"
#include "ns3/ndnSIM/apps/ndn-producer.hpp"
#include "ns3/random-variable-stream.h"
#include "ns3/ndnSIM/apps/ndn-proactive-producer.hpp"
#include "ns3/ndnSIM/apps/ndn-consumer-cbr.hpp"
#include "ns3/ndnSIM/apps/ndn-consumer.hpp"
#include "ns3/ndnSIM/apps/ndn-app.hpp"
#include "ns3/ndnSIM/apps/globals.hpp"
#include "ns3/ndnSIM/helper/ndn-app-helper.hpp"
#include "ns3/ndnSIM/helper/ndn-stack-helper.hpp"
#include <ns3/ndnSIM/helper/ndn-global-routing-helper.hpp>
#include "ns3/animation-interface.h"
#include "ns3/ndnSIM-module.h"
#include "ns3/boolean.h"

#include "model/ndn-l3-protocol.hpp"
#include "ns3/ndnSIM/NFD/daemon/table/pit.hpp"
#include "ns3/ndnSIM/NFD/daemon/table/fib.hpp"

#include <algorithm>

#include <vector>
#include <iostream>
#include <fstream>
#include <list>
#include <iterator>
#include <string>


namespace ns3{
  NS_LOG_COMPONENT_DEFINE ("V2VSimple");
  int simulationEnd = 100;
  int nodeCount = 0;
  int contentTrigger_x_start = 0;
  int contentTrigger_x_end = 0;
  int contentTrigger_l_start = 0;
  int contentTrigger_l_end = simulationEnd;
  int contentTrigger_x_speed = 0;
  double interestFrequency = 0.1;
  bool pcdMode = false;
  char infraMode = 'n';

  std::string traceFile = "File path goes here...";
  std::string animFile = "../results/ndn-v2v-test.xml";
  std::string traceOutput = "../results";


  void installWave(NodeContainer &c, NetDeviceContainer &devices) {
      // Modulation and wifi channel bit rate
      std::string phyMode ("OfdmRate6MbpsBW10MHz");
      // std::string phyMode("OfdmRate24Mbps");
      // Fix non-unicast data rate to be the same as that of unicast
      Config::SetDefault("ns3::WifiRemoteStationManager::NonUnicastMode", StringValue(phyMode));

      YansWifiPhyHelper wifiPhy = YansWifiPhyHelper::Default();
      // wifiPhy.SetPcapDataLinkType(YansWifiPhyHelper::DLT_IEEE802_11_RADIO);
      wifiPhy.SetPcapDataLinkType (WifiPhyHelper::DLT_IEEE802_11);
      wifiPhy.EnablePcap ("wave-simple-80211p", devices);
      YansWifiChannelHelper wifiChannel;
      wifiChannel.SetPropagationDelay("ns3::ConstantSpeedPropagationDelayModel");
      wifiChannel.AddPropagationLoss("ns3::RangePropagationLossModel",
                                     "MaxRange", DoubleValue(100.0));

      wifiPhy.SetChannel(wifiChannel.Create());
      Wifi80211pHelper waveHelper = Wifi80211pHelper::Default();
      waveHelper.SetRemoteStationManager ("ns3::ConstantRateWifiManager",
                                        "DataMode",StringValue (phyMode),
                                        "ControlMode",StringValue (phyMode));

      QosWaveMacHelper qosWaveMacHelper = QosWaveMacHelper::Default();
      devices = waveHelper.Install(wifiPhy, qosWaveMacHelper, c);
  }

  void installNDN(NodeContainer &c) {
      ndn::StackHelper ndnHelper;
      ndnHelper.SetDefaultRoutes(true);
      ndnHelper.Install(c);
      ndn::StrategyChoiceHelper::InstallAll("/", "/localhost/nfd/strategy/broadcast");
  }

  void printProgress(double percent) {
    std::cout << percent << "% done" << '\n';
  }

  void progressLogging(){
    double _perc05 = simulationEnd * 0.05;
    double _perc10 = simulationEnd * 0.1;
    double _perc15 = simulationEnd * 0.15;
    double _perc20 = simulationEnd * 0.2;
    double _perc25 = simulationEnd * 0.25;
    double _perc30 = simulationEnd * 0.3;
    double _perc35 = simulationEnd * 0.35;
    double _perc40 = simulationEnd * 0.4;
    double _perc45 = simulationEnd * 0.45;
    double _perc50 = simulationEnd * 0.5;
    double _perc55 = simulationEnd * 0.55;
    double _perc60 = simulationEnd * 0.6;
    double _perc65 = simulationEnd * 0.65;
    double _perc70 = simulationEnd * 0.7;
    double _perc75 = simulationEnd * 0.75;
    double _perc80 = simulationEnd * 0.8;
    double _perc85 = simulationEnd * 0.85;
    double _perc90 = simulationEnd * 0.9;
    double _perc95 = simulationEnd * 0.95;
    double _perc100 = simulationEnd * 1.0;
    Simulator::Schedule(Seconds(_perc05), &printProgress, 5.0);
    Simulator::Schedule(Seconds(_perc10), &printProgress, 10.0);
    Simulator::Schedule(Seconds(_perc15), &printProgress, 15.0);
    Simulator::Schedule(Seconds(_perc20), &printProgress, 20.0);
    Simulator::Schedule(Seconds(_perc25), &printProgress, 25.0);
    Simulator::Schedule(Seconds(_perc30), &printProgress, 30.0);
    Simulator::Schedule(Seconds(_perc35), &printProgress, 35.0);
    Simulator::Schedule(Seconds(_perc40), &printProgress, 40.0);
    Simulator::Schedule(Seconds(_perc45), &printProgress, 45.0);
    Simulator::Schedule(Seconds(_perc50), &printProgress, 50.0);
    Simulator::Schedule(Seconds(_perc55), &printProgress, 55.0);
    Simulator::Schedule(Seconds(_perc60), &printProgress, 60.0);
    Simulator::Schedule(Seconds(_perc65), &printProgress, 65.0);
    Simulator::Schedule(Seconds(_perc70), &printProgress, 70.0);
    Simulator::Schedule(Seconds(_perc75), &printProgress, 75.0);
    Simulator::Schedule(Seconds(_perc80), &printProgress, 80.0);
    Simulator::Schedule(Seconds(_perc85), &printProgress, 85.0);
    Simulator::Schedule(Seconds(_perc90), &printProgress, 90.0);
    Simulator::Schedule(Seconds(_perc95), &printProgress, 95.0);
    Simulator::Schedule(Seconds(_perc100), &printProgress, 100.0);
  }

  void nodeLogging(NodeContainer &c) {
    for (int i = 0; i < nodeCount; i++) {
      std::cout << endl << "node(" << i << "):" << endl;
      auto node = c.Get(i);
      auto& nodeFib = node->GetObject<ndn::L3Protocol>()->getForwarder()->getFib();
      nfd::Fib::const_iterator iter;
      for (iter = nodeFib.begin(); iter != nodeFib.end(); iter++) {
        cout << iter->getPrefix() << " " << iter->hasNextHops() << endl;
        const nfd::fib::NextHopList& nextHops = iter->getNextHops();

        for (nfd::fib::NextHopList::const_iterator j = nextHops.begin(); j != nextHops.end(); ++j)
            {
              const nfd::fib::NextHop& next = *j;
              auto& face = next.getFace();
              std::cout << face.getId() << '\n';
            }
      }
    }
  }

  void installConsumer(NodeContainer &c) {
      ndn::AppHelper helper("ns3::ndn::ConsumerCbr");
      helper.SetAttribute("Frequency", DoubleValue (interestFrequency));
      helper.SetAttribute("Randomize", StringValue("uniform"));
      helper.SetAttribute("SimEnd", UintegerValue(simulationEnd));
      helper.SetAttribute("CTxStart", UintegerValue(contentTrigger_x_start));
      helper.SetAttribute("CTxEnd", UintegerValue(contentTrigger_x_end));
      helper.SetAttribute("CTxSpeed", UintegerValue(contentTrigger_x_speed));
      helper.SetAttribute("AwarenessLoggingDir", StringValue(traceOutput));
      helper.SetPrefix("/criticalData/test");
      helper.Install(c);
  }

  void installProducer(NodeContainer &c, bool isRSU) {
      ndn::AppHelper producerHelper("ns3::ndn::Producer");
      producerHelper.SetPrefix("/criticalData");
      producerHelper.SetAttribute("Freshness", TimeValue(Seconds(20)));
      producerHelper.SetAttribute("SimEnd", UintegerValue(simulationEnd));
      producerHelper.SetAttribute("CTxStart", UintegerValue(contentTrigger_x_start));
      producerHelper.SetAttribute("CTxEnd", UintegerValue(contentTrigger_x_end));
      producerHelper.SetAttribute("CTlStart", UintegerValue(contentTrigger_l_start));
      producerHelper.SetAttribute("CTlEnd", UintegerValue(contentTrigger_l_end));
      producerHelper.SetAttribute("CTxSpeed", UintegerValue(contentTrigger_x_speed));
      producerHelper.SetAttribute("IsRSU", BooleanValue(isRSU));
      producerHelper.Install(c);
  }

  void installProactiveProducer(NodeContainer &c) {
      ndn::AppHelper proactiveProducerHelper("ns3::ndn::ProactiveProducer");
      proactiveProducerHelper.SetPrefix("/criticalData/test");
      proactiveProducerHelper.SetAttribute("Freshness", TimeValue(Seconds(20)));
      proactiveProducerHelper.SetAttribute("SimEnd", UintegerValue(simulationEnd));
      proactiveProducerHelper.SetAttribute("CTxStart", UintegerValue(contentTrigger_x_start));
      proactiveProducerHelper.SetAttribute("CTxEnd", UintegerValue(contentTrigger_x_end));
      proactiveProducerHelper.SetAttribute("CTlStart", UintegerValue(contentTrigger_l_start));
      proactiveProducerHelper.SetAttribute("CTlEnd", UintegerValue(contentTrigger_l_end));
      proactiveProducerHelper.SetAttribute("CTxSpeed", UintegerValue(contentTrigger_x_speed));
      proactiveProducerHelper.Install(c);
  }

  void installAppHelpers(NodeContainer &c) {
      NodeContainer producers;
      NodeContainer consumers;
      NodeContainer proactiveProducers;
      // Producers and Consumers assigned based on the list of producerIds above
      for (int i = 0; i < nodeCount; i++) {
          if (i > 0) {
            //producers and consumers on the same nodes unfortunately produce unexpected results
            //have to resort to distributing producers uniformly across the network
            if (i == 1 || (i % 3) == 0) {
              producers.Add(c.Get(i));
              proactiveProducers.Add(c.Get(i));
            } else {
              consumers.Add(c.Get(i));
              proactiveProducers.Add(c.Get(i));
            }
          }
      }
      installConsumer(consumers);
      installProducer(producers, false);
      if (pcdMode)
          installProactiveProducer(proactiveProducers);
  }

  void initialiseVanet() {
      Ns2MobilityHelper ns2MobilityHelper = Ns2MobilityHelper(traceFile);
      NodeContainer c;
      NetDeviceContainer netDevices;

      NS_LOG_UNCOND("Setting up nodes...");
      int rsuCount = 0;
      switch (infraMode) {
        case 'd':
            NS_LOG_UNCOND("RSU Dense Mode (3 Units)");
            rsuCount = 3;
            break;
        case 'm':
            NS_LOG_UNCOND("RSU Moderate Mode (2 Units)");
            rsuCount = 2;
            break;
        case 's':
            NS_LOG_UNCOND("RSU Sparse Mode (1 Unit)");
            rsuCount = 1;
            break;
      }
      c.Create((nodeCount + rsuCount));
      NS_LOG_UNCOND("Installing ns2MobilityHelper...");
      ns2MobilityHelper.Install();

      NS_LOG_UNCOND("Installing WAVE on all nodes...");
      installWave(c, netDevices);
      NS_LOG_UNCOND("Installing NDN Stack on all Nodes...");
      installNDN(c);
      NS_LOG_UNCOND("Assigning producers and consumers as needed (Interest Frequency of " << interestFrequency << ")...");
      installAppHelpers(c);

      std::ofstream ofs ("pos.txt", std::ofstream::out);
      switch (rsuCount) {
        case 3:
            ofs << "$node_(" << nodeCount << ") set X_ 550" << '\n' << "$node_(" << nodeCount << ") set Y_ -1.6" << '\n' << "$node_(" << nodeCount << ") set Z_ 0" << '\n'
                << "$ns_ at 0.0 \"$node_(" << nodeCount << ") setdest 550.0 -1.6 0.0\"" << '\n'
                << "$node_(" << nodeCount + 1 << ") set X_ 1000" << '\n' << "$node_(" << nodeCount + 1 << ") set Y_ -1.6" << '\n' << "$node_(" << nodeCount + 1 << ") set Z_ 0" << '\n'
                << "$ns_ at 0.0 \"$node_(" << nodeCount + 1 << ") setdest 1000.0 -1.6 0.0\"" << '\n'
                << "$node_(" << nodeCount + 2 << ") set X_ 1450" << '\n' << "$node_(" << nodeCount + 2 << ") set Y_ -1.6" << '\n' << "$node_(" << nodeCount + 2 << ") set Z_ 0" << '\n'
                << "$ns_ at 0.0 \"$node_(" << nodeCount + 2 << ") setdest 1450.0 -1.6 0.0\"" << '\n';
            ofs.close();
            break;
        case 2:
            ofs << "$node_(" << nodeCount << ") set X_ 775" << '\n' << "$node_(" << nodeCount << ") set Y_ -1.6" << '\n' << "$node_(" << nodeCount << ") set Z_ 0" << '\n'
                << "$ns_ at 0.0 \"$node_(" << nodeCount << ") setdest 775.0 -1.6 0.0\"" << '\n'
                << "$node_(" << nodeCount + 1 << ") set X_ 1225" << '\n' << "$node_(" << nodeCount + 1 << ") set Y_ -1.6" << '\n' << "$node_(" << nodeCount + 1 << ") set Z_ 0" << '\n'
                << "$ns_ at 0.0 \"$node_(" << nodeCount + 1 << ") setdest 1225.0 -1.6 0.0\"" << '\n';
            ofs.close();
            break;
        case 1:
            ofs << "$node_(" << nodeCount << ") set X_ 1000" << '\n' << "$node_(" << nodeCount << ") set Y_ -1.6" << '\n' << "$node_(" << nodeCount << ") set Z_ 0" << '\n'
                << "$ns_ at 0.0 \"$node_(" << nodeCount << ") setdest 1000.0 -1.6 0.0\"" << '\n';
            ofs.close();
            break;
        case 0:
            ofs << "";
            ofs.close();
      }
      Ns2MobilityHelper infraPositions = Ns2MobilityHelper("pos.txt");
      infraPositions.Install();

      // // Setup RSUs
      // NetDeviceContainer rsuNetDevices;
      NodeContainer rsus;
      for (int i = nodeCount; i < nodeCount + rsuCount; i++) {
          rsus.Add(c.Get(i));
          // Config::Set("/NodeList/i/DeviceList/i/$ns3::WifiNetDevice/Phy/$ns3::RangePropagationLossModel/MaxRange",
          //             DoubleValue(450.0));
      }
      installProducer(rsus, true);

      NS_LOG_UNCOND("Setup complete.");
  }

  int main (int argc, char *argv[]) {
      CommandLine cmd;
      cmd.Usage("NDN V2V simulator.");
      cmd.AddValue("num-nodes", "An int, specifies total amount of routers, producers & consumers present", nodeCount);
      cmd.AddValue("simulation-length", "Specify simulation length in seconds", simulationEnd);
      cmd.AddValue("infra-mode", "Are RSUs present or not and at what density", infraMode);
      cmd.AddValue("pcd-mode", "Boolean value, decides if proactive producers are installed", pcdMode);
      cmd.AddValue("interest-freq", "Double value, sets the interests to be desemminated per second", interestFrequency);
      cmd.AddValue("content-trigger-x-start", "Specifies where critical content becomes available in the simulation", contentTrigger_x_start);
      cmd.AddValue("content-trigger-x-end", "Specifies where critical content is no longer available in the simulation", contentTrigger_x_end);
      cmd.AddValue("content-trigger-x-speed", "Specifies the speed of the content if it is mobile", contentTrigger_x_speed);
      cmd.AddValue("content-trigger-l-start", "Specifies when critical content is available in the simulation", contentTrigger_l_start);
      cmd.AddValue("content-trigger-l-end", "Specifies when critical content is no longer available in the simulation", contentTrigger_l_end);
      cmd.AddValue("trace-file", "The Path to the .tcl mobility file, likely generated by a 'sumo -c' command.\nUsing an PATH variable is reccommended to avoid a headwreck such as $SUMO_PROJECTS_ROOT", traceFile);
      cmd.AddValue("anim-file", "Specify name of anim file to be outputted (.xml)", animFile);
      cmd.AddValue("trace-output", "Directory where traces are outputted", traceOutput);
      cmd.Parse(argc, argv);

      initialiseVanet();
      progressLogging();

      AnimationInterface anim(animFile);
      anim.SetMaxPktsPerTraceFile(50000000);
      std::string awarenessTraceOutput = traceOutput + "/awareness-trace.txt";
      std::remove(awarenessTraceOutput.c_str());
      std::ofstream awarenessTraceOutputFile(awarenessTraceOutput);
      awarenessTraceOutputFile << "NodeId  AwarenessDistance  WasInformed  AwarenessTime  SafelyInformed" << std::endl;
      awarenessTraceOutputFile.close();
      std::string l3TraceOutput = traceOutput + "/l3-rate-trace.txt";
      ndn::L3RateTracer::InstallAll(l3TraceOutput, Seconds(1));
      NS_LOG_UNCOND("\n" + cmd.GetName() + " running...");
      Simulator::Stop(Seconds(simulationEnd));
      Simulator::Run();
      NS_LOG_UNCOND("Done.\n");
      return 0;
  }
} // namespace ns3

int main(int argc, char* argv[]) {
    return ns3::main(argc, argv);
    std::cout << argc << '\n';
}
