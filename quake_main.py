#!/usr/bin/python3

import datetime
from quake_db_class import *

dbQuake = QuakeDatabase('jeffrey', 'mypass', '127.0.0.1', 'stats')

dbQuake.connect()
dbQuake.switch_database()
                                                                                        
#dbQuake.showDatabase()
#print("================")
#dbQuake.showTables()
#print("================")
#dbQuake.addPlayer("Tolek")
#print("Player id = "+str(player_id))
#print("================")
#game_date='2019-09-03 15:46:21'
dbQuake.addMap("2020-01-03 20:42:26","map4","FFA",0,472)
#print("Map id = "+str(map_id))
print("================")
dbQuake.disconnect()
