import 'dart:collection';

class Skynet {
  final List<_Node> nodes = [];

  Skynet(int nbNodes) {
    nodes.length = nbNodes;
  }

  void addLink(int node1, int node2) {
    nodes[node1].addLink(nodes[node2]);
    nodes[node2].addLink(nodes[node1]);
  }

  void addExit(int exit) {
    nodes[exit].markAsExit();
  }

  Link stopAgent(int agent) {
    var nearestExit = findNearestExit(nodes[agent]);
  }

  _Node findNearestExit(_Node agent) {
    var queue = Queue<_Node>();
    queue.add(agent);
    return _breadthFirstSearch(queue);
  }

  _Node _breadthFirstSearch(Queue<_Node> queue) {
    var nextNode = queue.removeFirst();
    if (nextNode.isExit) {
      return nextNode;
    }
    queue.addAll(nextNode.links);
    return _breadthFirstSearch(queue);
  }
}

class Link {
  final int node1;
  final int node2;

  Link(this.node1, this.node2);

  @override
  String toString() {
    return '$node1 $node2';
  }
}

class _Node {
  bool _isExit = false;
  final List<_Node> links = [];

  void addLink(_Node node) {
    links.add(node);
  }

  bool get isExit => _isExit;

  void markAsExit() => _isExit = true;
}
