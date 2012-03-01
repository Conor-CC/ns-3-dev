import gtk

import ns.core
import ns.network
import ns.internet
import ns.NDNabstraction

from visualizer.base import InformationWindow

class ShowCcnxFib(InformationWindow):
    (
        COLUMN_PREFIX,
        COLUMN_FACE
        ) = range(2)

    def __init__(self, visualizer, node_index):
        InformationWindow.__init__(self)
        self.win = gtk.Dialog(parent=visualizer.window,
                              flags=gtk.DIALOG_DESTROY_WITH_PARENT|gtk.DIALOG_NO_SEPARATOR,
                              buttons=(gtk.STOCK_CLOSE, gtk.RESPONSE_CLOSE))
        self.win.connect("response", self._response_cb)

        self.node = ns.network.NodeList.GetNode (node_index)
        node_name = ns.core.Names.FindName (self.node)

        title = "CCNx FIB for node %i" % node_index
        if len(node_name) != 0:
            title += " (" + str(node_name) + ")"

        self.win.set_title (title) 
        self.visualizer = visualizer
        self.node_index = node_index

        self.table_model = gtk.ListStore(str, str, int)

        treeview = gtk.TreeView(self.table_model)
        treeview.show()
        sw = gtk.ScrolledWindow()
        sw.set_properties(hscrollbar_policy=gtk.POLICY_AUTOMATIC,
                          vscrollbar_policy=gtk.POLICY_AUTOMATIC)
        sw.show()
        sw.add(treeview)
        self.win.vbox.add(sw)
        self.win.set_default_size(600, 300)
        
        # Dest.
        column = gtk.TreeViewColumn('Destination', gtk.CellRendererText(),
                                    text=self.COLUMN_PREFIX)
        treeview.append_column(column)

        # Interface
        column = gtk.TreeViewColumn('Face(metric,status)', gtk.CellRendererText(),
                                    text=self.COLUMN_FACE)
        treeview.append_column(column)

        self.visualizer.add_information_window(self)
        self.win.show()

    def _response_cb(self, win, response):
        self.win.destroy()
        self.visualizer.remove_information_window(self)
    
    def update(self):
        ccnxFib = self.node.GetObject(ns.NDNabstraction.CcnxFib.GetTypeId())
        
        if ccnxFib is None:
            return

        self.table_model.clear()
        
        for fibI in range(ccnxFib.GetCcnxFibEntryCount()):
            entry = ccnxFib.GetCcnxFibEntry(fibI)
            tree_iter = self.table_model.append()
            self.table_model.set(tree_iter,
                                 self.COLUMN_PREFIX, str(entry.GetPrefix()),
                                 self.COLUMN_FACE, str(entry))

def populate_node_menu(viz, node, menu):
    menu_item = gtk.MenuItem("Show CCNx FIB")
    menu_item.show()

    def _show_ccnx_fib(dummy_menu_item):
        ShowCcnxFib(viz, node.node_index)

    menu_item.connect("activate", _show_ccnx_fib)
    menu.add(menu_item)

def register(viz):
    viz.connect("populate-node-menu", populate_node_menu)
