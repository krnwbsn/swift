class GraphNode {
    
    var data: String
    var neighboringNodes: [GraphNode]
    
    init(data: String) {
        self.data = data
        neighboringNodes = []
    }
    
    func addNeighbor(_ newNeighbor: GraphNode) {
        neighboringNodes.append(newNeighbor)
    }
    
    func removeNeighbor(_ nodeToRemove: GraphNode) {
        if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
            neighboringNodes.remove(at: index)
        }
    }
}
extension GraphNode: Equatable {
    static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
        return lhs === rhs
    }
}
extension GraphNode: CustomStringConvertible {
    var description: String {
        return "\(data)"
    }
}

struct GraphEdge {
    let nodeOne: GraphNode
    let nodeTwo: GraphNode
    var weight: Int? = nil
    
    init(nodeOne: GraphNode, nodeTwo: GraphNode, weight: Int?) {
        self.nodeOne = nodeOne
        self.nodeTwo = nodeTwo
        self.weight = weight
    }
}

class Graph {
    var nodes: [GraphNode]
    var edges: [GraphEdge]
    
    init(nodes: [GraphNode]) {
        self.nodes = nodes
        edges = []
    }
    
    func addEdge(from nodeOne: GraphNode, to nodeTwo: GraphNode, isBidirectional: Bool, weight: Int? = nil) {
        edges.append(GraphEdge(nodeOne: nodeOne, nodeTwo: nodeTwo, weight: weight))
        nodeOne.addNeighbor(nodeTwo)
        if isBidirectional {
            nodeTwo.addNeighbor(nodeOne)
        }
    }
    
    func addEdges(from nodeOne: GraphNode, to neighboringNodes: [(node: GraphNode, isBidirectional: Bool, weight: Int?)]) {
        for (node, isBidirectional, weight) in neighboringNodes {
            addEdge(from: nodeOne, to: node, isBidirectional: isBidirectional, weight: weight)
        }
    }
    
    func removeNode(_ node: GraphNode) {
        if let index = nodes.firstIndex(where: { $0 == node }) {
            nodes.remove(at: index)
        }
        
        edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
        node.neighboringNodes.forEach { $0.removeNeighbor(node) }
    }
    
    func printGraph() {
        for node in nodes {
            Swift.print("\(node): \(node.neighboringNodes)")
        }
    }
    
    func bfs(startingAt startNode: GraphNode) -> [GraphNode] {
        var queue = Queue<GraphNode>()
        queue.enqueue(startNode)
        var visitedNodes = [GraphNode]()
        while let currentNode = queue.dequeue() {
            if !visitedNodes.contains(currentNode) {
                visitedNodes.append(currentNode)
            }
            for neighbor in currentNode.neighboringNodes where !visitedNodes.contains(neighbor) {
                queue.enqueue(neighbor)
            }
        }
        return visitedNodes
    }
    
    func dfs(startingAt startNode: GraphNode) -> [GraphNode] {
        var stack = [startNode]
        var visitedNodes = [GraphNode]()
        
        while let currentNode = stack.popLast() {
            if !visitedNodes.contains(currentNode) {
                visitedNodes.append(currentNode)
            }
            for neighbor in currentNode.neighboringNodes where !visitedNodes.contains(neighbor) {
                stack.append(neighbor)
            }
        }
        
        return visitedNodes
    }
}

class QueueNode<Element: Equatable> {
    var data: Element
    var next: QueueNode<Element>?
    
    init(data: Element) {
        self.data = data
    }
}

struct Queue<Element: Equatable> {
    var head: QueueNode<Element>?
    var tail: QueueNode<Element>?
    
    func peek() -> Element? {
        return head?.data
    }
    
    mutating func enqueue(_ data: Element) {
        let newNode = QueueNode(data: data)
        
        guard let lastNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        
        lastNode.next = newNode
        tail = newNode
    }
    
    mutating func dequeue() -> Element? {
        var removedNode: Element?
        
        if let firstNode = head {
            removedNode = firstNode.data
        }
        if head === tail {
            tail = nil
        }
        head = head?.next
        return removedNode
    }
}

let atlanta = GraphNode(data: "Atlanta")
let newYork = GraphNode(data: "New York")
let chicago = GraphNode(data: "Chicago")
let orlando = GraphNode(data: "Orlando")
let losAngeles = GraphNode(data: "Los Angeles")
let graph = Graph(nodes: [atlanta, newYork, chicago, orlando, losAngeles])
graph.addEdges(from: atlanta, to: [(node: newYork, isBidirectional: false, weight: 250), (node: orlando, isBidirectional: false, weight: 80)])
graph.addEdges(from: orlando, to: [(node: atlanta, isBidirectional: false, weight: 100), (node: newYork, isBidirectional: false, weight: 400), (node: chicago, isBidirectional: false, weight: 200)])
graph.addEdges(from: losAngeles, to: [(node: chicago, isBidirectional: false, weight: 125), (node: atlanta, isBidirectional: false, weight:250)])
graph.addEdge(from: chicago, to: newYork, isBidirectional: false, weight: 190)
graph.addEdges(from: newYork, to: [(node: losAngeles, isBidirectional: false, weight: 400), (node: atlanta, isBidirectional: false, weight: 200)])
graph.printGraph()

let dfs = graph.dfs(startingAt: atlanta)
print(dfs)
let bfs = graph.bfs(startingAt: atlanta)
print(bfs)

let node1 = GraphNode(data: "Node1")
let node2 = GraphNode(data: "Node2")
let node3 = GraphNode(data: "Node3")
let graphNode = Graph(nodes: [node1, node2, node3])
graphNode.addEdge(from: node1, to: node3, isBidirectional: true)
graphNode.printGraph()

let start = GraphNode(data: "Start")
let a = GraphNode(data: "A")
let b = GraphNode(data: "B")
let c = GraphNode(data: "C")
graph.addEdge(from: start, to: a, isBidirectional: false)
graph.addEdge(from: start, to: b, isBidirectional: false)
graph.addEdge(from: start, to: c, isBidirectional: false)
graph.addEdge(from: a, to: c, isBidirectional: false)
graph.addEdge(from: b, to: c, isBidirectional: true)
 
let search = graph.dfs(startingAt: start)
print(search)
