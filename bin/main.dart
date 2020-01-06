import 'dart:io';

import 'package:skynet_episode_1/skynet.dart';

void main() {
  var inputs = stdin.readLineSync().split(' ');
  var nbNodes = int.parse(inputs[0]);
  var nbLinks = int.parse(inputs[1]);
  var nbExits = int.parse(inputs[2]);

  var skynet = Skynet(nbNodes);
  for (var i = 0; i < nbLinks; i++) {
    var inputs = stdin.readLineSync().split(' ');
    var node1 = int.parse(inputs[0]);
    var node2 = int.parse(inputs[1]);
    skynet.addLink(node1, node2);
  }
  for (var i = 0; i < nbExits; i++) {
    var exit = int.parse(stdin.readLineSync());
    skynet.addExit(exit);
  }

  // game loop
  while (true) {
    var agent = int.parse(stdin.readLineSync()); // The index of the node on which the Skynet agent is positioned this turn

    var linkCut = skynet.stopAgent(agent);

    // Write an action using print()
    // To debug: stderr.writeln('Debug messages...');

    // Example: 0 1 are the indices of the nodes you wish to sever the link between
    print(linkCut);
  }
}
