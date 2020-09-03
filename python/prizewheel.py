# Prize Wheel
# Version:  1.0
# Author:   Parker Bailey
# Date:     9/2/20

import csv, random

class Contestant:
    def __init__(self, name):
        self.name = name
    def getName(self):
        print(self.name)