import os
interest_frequencies = ["0.1", "0.25", "0.5", "1.0"]
node_transmission_ranges = ["100.0", "300.0"]
vehicle_demmands = ["pcd-sparse", "pcd-mod", "pcd-dense"]
test_configs = ["persistent-static", "persistent-mobile", "transient-static",
                "transient-mobile"]
infra_modes = ["non-infra", "sparse-infra", "mod-infra", "dense-infra"]
infra_keys = ['n', 's', 'm', 'd']
test_count = 0


def runTestsForAllFrequeuncies(mode):
    for r in node_transmission_ranges:
        selectDemmands(r, mode)


def selectDemmands(range, mode):
    results_dir = selectResultsDir(range)
    for demmand in vehicle_demmands:
        content_level_commands = []
        dataDict = {}
        dataDict["mode"] = mode
        dataDict["pcd_descr"] = "Regular NDN"
        dataDict["pcd_mode"] = "false"
        if mode == "pcd":
            dataDict["pcd_mode"] = "true"
            dataDict["pcd_descr"] = "NDN with PCD"
        dataDict["dem_mode"] = selectDemMode(demmand)
        dataDict["demmand"] = demmand
        dataDict["results_dir"] = results_dir
        dataDict["test_dir"] = selectTestDir(range)
        dataDict["range"] = range
        dataDict["res_subdir"] = selectResultsSubdir(mode, demmand)
        dataDict["num_nodes"] = determineNumNodes(demmand)
        dataDict["interest_freq"] = "10.0"
        f_name = ("test-scripts/" + dataDict["test_dir"] + "/run-"
                  + dataDict["mode"] + "-" + dataDict["dem_mode"] + "-"
                  + dataDict["test_dir"] + ".sh")
        f = open(f_name, 'w')
        for test_config in test_configs:
            dataDict["test_config"] = test_config
            dataDict = determineContentTrigger(dataDict)
            for infra_mode in infra_modes:
                global test_count
                test_count = test_count + 1
                dataDict["infra_mode"] = infra_mode
                dataDict["infra_key"] = selectInfraKey(infra_mode)
                test_descr_command = constructPrintString(dataDict)
                run_command = constructCmdString(dataDict)
                rate_level_command = constructRateStatsString(dataDict)
                f.write(test_descr_command + "\n" + run_command + "\n"
                        + rate_level_command + "\n")
                f.flush()
            content_level_commands.append(constructContentStatsString(dataDict))
        writeContentLevelCommands(f, content_level_commands)
        demmand_level_command = constructDemmandStatsString(dataDict)
        f.write("\n" + demmand_level_command + "\n")
        f.flush()


def writeContentLevelCommands(f, cmds):
    for cmd in cmds:
        f.write(cmd + "\n")
        f.flush()


def determineContentTrigger(dataDict):
    dataDict["contentTrigger_x_start"] = "1000"
    dataDict["contentTrigger_x_end"] = "1100"
    dataDict["contentTrigger_l_start"] = "0"
    dataDict["contentTrigger_l_end"] = "0"
    dataDict["contentTrigger_l_end"] = "400"
    dataDict["contentTrigger_x_speed"] = "0"
    if "mobile" in dataDict["test_config"]:
        dataDict["contentTrigger_x_speed"] = "3"
    if "transient" in dataDict["test_config"]:
        dataDict["contentTrigger_l_start"] = "100"
        dataDict["contentTrigger_l_end"] = "200"
    return dataDict


def determineNumNodes(demmand):
    if "sparse" in demmand:
        return "22"
    if "mod" in demmand:
        return "110"
    if "dense" in demmand:
        return "165"
    return


def selectDemMode(demmand):
    dem_mode = "sparse"
    if "mod" in demmand:
        dem_mode = "mod"
    if "dense" in demmand:
        dem_mode = "dense"
    return dem_mode


def selectInfraKey(infra_str):
    if infra_str == "non-infra":
        return "n"
    if infra_str == "sparse-infra":
        return "s"
    if infra_str == "mod-infra":
        return "m"
    if infra_str == "dense-infra":
        return "d"


def selectTestDir(r):
    if r == node_transmission_ranges[0]:
        return "range-100"
    if r == node_transmission_ranges[1]:
        return "range-300"


def selectResultsSubdir(mode, demmand):
    mode_str = "regular-"
    if mode == "pcd":
        mode_str = "pcd-"
    demmand_str = "sparse"
    if "mod" in demmand:
        demmand_str = "mod"
    if "dense" in demmand:
        demmand_str = "dense"
    return mode_str + demmand_str


def selectResultsDir(r):
    if r == node_transmission_ranges[0]:
        return os.environ.get('FYP_RESULTS_100')
    if r == node_transmission_ranges[1]:
        return os.environ.get('FYP_RESULTS_300')


def constructCmdString(dataDict):
    return ("./waf --run \"ndn-v2v-simple "
            + "--pcd-mode="
            + dataDict["pcd_mode"]
            + " "
            + "--interest-freq="
            + dataDict["interest_freq"]
            + " "
            + "--node-transmission-range="
            + dataDict["range"]
            + " "
            + "--num-nodes="
            + dataDict["num_nodes"]
            + " "
            + "--simulation-length=200"
            + " "
            + "--infra-mode="
            + dataDict["infra_key"]
            + " "
            + "--content-trigger-x-start="
            + dataDict["contentTrigger_x_start"]
            + " "
            + "--content-trigger-x-end="
            + dataDict["contentTrigger_x_end"]
            + " "
            + "--content-trigger-l-start="
            + dataDict["contentTrigger_l_start"]
            + " "
            + "--content-trigger-l-end="
            + dataDict["contentTrigger_l_end"]
            + " "
            + "--content-trigger-x-speed="
            + dataDict["contentTrigger_x_speed"]
            + " "
            + "--trace-file=$SUMO_PROJECTS_ROOT/"
            + dataDict["demmand"]
            + "/non-infra/ns2-trace.tcl"
            + " "
            + "--anim-file="
            + dataDict["results_dir"]
            + "/"
            + dataDict["res_subdir"]
            + "/"
            + dataDict["test_config"]
            + "/"
            + dataDict["infra_mode"]
            + "/ndn-v2v-test.xml"
            + " "
            + "--trace-output="
            + dataDict["results_dir"]
            + "/"
            + dataDict["res_subdir"]
            + "/"
            + dataDict["test_config"]
            + "/"
            + dataDict["infra_mode"]
            + "\"")


def constructPrintString(dataDict):
    return ("printf \"\e[35m"
            + dataDict["pcd_descr"]
            + " and "
            + dataDict["test_config"]
            + " content and an transmission range of "
            + dataDict["test_dir"]
            + ". ("
            + dataDict["infra_mode"]
            + ")\e[0m" + r"\n" + "\"")


def constructRateStatsString(dataDict):
    return ("Rscript $FYP_RSCRIPTS/rate-graph.R"
            + " "
            + dataDict["results_dir"]
            + "/"
            + dataDict["res_subdir"]
            + "/"
            + dataDict["test_config"]
            + "/"
            + dataDict["infra_mode"]
            + "\n")


def constructContentStatsString(dataDict):
    return ("Rscript $FYP_RSCRIPTS/"
            + "content-level-graph.R"
            + " "
            + dataDict["results_dir"]
            + "/"
            + dataDict["res_subdir"]
            + "/"
            + dataDict["test_config"])


def constructDemmandStatsString(dataDict):
    return ("Rscript $FYP_RSCRIPTS/"
            + "demmand-level-graph.R"
            + " "
            + dataDict["results_dir"]
            + "/"
            + dataDict["res_subdir"])


def main():
    runTestsForAllFrequeuncies("ndn")
    runTestsForAllFrequeuncies("pcd")
    print("Test Count:" + str(test_count))


if __name__ == "__main__":
    main()
