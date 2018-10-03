module ship_.main_;

import std.experimental.logger;
import cst_;

import ship_.world_	.world_	;
import ship_.galactic_	.galactic_network_	;
import ship_.galactic_	.galactic_mgr_	;
import ship_.terminal_	.terminal_network_	;
import ship_.terminal_	.ship_	;

import loose_.sleep_ : sleep;
import core.time;

import std.algorithm.iteration;

class Main {
	this() {
		auto galacticNetwork	= new GalacticNetwork	;
		auto terminalNetworkMaster	= new TerminalNetworkMaster	;
		auto world	= new World	;
		auto galacticMgr	= new GalacticMgr(world,galacticNetwork)	;
		auto ship	= new Ship(world)	;
		
		while (true) {
			sleep(50.msecs);
			galacticMgr.update();
			ship.update(terminalNetworkMaster.getNewTerminals());
		}
	}
}
