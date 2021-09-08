# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal

def rgb2hex(r,g,b):
    return "#{:02x}{:02x}{:02x}".format(r,g,b)



class MainWindow(QObject):
    Rval = 0
    Gval = 0
    Bval = 0

    def __init__(self):
        QObject.__init__(self)


    setRGB = Signal(str,str,str,str)

    @Slot(int)
    def setR(self,Rvalf):
        self.Rval = Rvalf
        self.setRGB.emit(rgb2hex(self.Rval,self.Gval,self.Bval),str(self.Rval),str(self.Gval),str(self.Bval))

    @Slot(int)
    def setG(self,Gvalf):
        self.Gval = Gvalf
        self.setRGB.emit(rgb2hex(self.Rval,self.Gval,self.Bval),str(self.Rval),str(self.Gval),str(self.Bval))

    @Slot(int)
    def setB(self,Bvalf):
        self.Bval = Bvalf
        self.setRGB.emit(rgb2hex(self.Rval,self.Gval,self.Bval),str(self.Rval),str(self.Gval),str(self.Bval))


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    #Get Context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend",main)

    engine.load(os.path.join(os.path.dirname(__file__), "main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
