%%%%%%%%%%%%%%%%%%%%%dijkstraÀ„∑® µœ÷%%%%%%%%%%%%%%%%%%%%%
function [Cost, Route] = Dijkstras( Graph, SourceNode, TerminalNode )
%Dijkstras.m Given a graph with distances from node to node calculates the
%optimal route from the Source Node to the Terminal Node as defined by the
%inputs.
% 
% Inputs:
% 
% Graph - A graph of the costs from each node to each other also known as
% an adjacency matrix. In the context of this project it is a matrix of the
% distances from cities within North Carolina to each other. You can mark
% unconnected nodes as such by assigning them values of Inf. For instance,
% if nodes 3 & 5 are unconnected then Graph(3,5)=Graph(5,3)=Inf;
% 
% SourceNode - The index of the node (city) which you wish to travel from 
% 
% TerminalNode - The index of the node (city) which you wish to travel to
% 
% Outputs:
% 
% Cost - The cost to travel from the source node to the terminal node.
% There are several metrics this could be but in the case of route planning
% which I am working on this is distance in miles.
% 
% Route - A vector containing the indices of the nodes traversed when going
% from the source node to the terminal node. Always begins with the source
% node and will always end at the terminal node unless the algorithm fails
% to converge due to there not existing a valid path between the source
% node and the terminal node. 

% Check for valid parameters
if size(Graph,1) ~= size(Graph,2)
   fprintf('The Graph must be a square Matrix\n');
   return; 
elseif min(min(Graph)) < 0
    fprintf('Dijkstras algorithm cannot handle negative costs.\n')
    fprintf('Please use Bellman-Ford or another alternative instead\n');
    return;
elseif SourceNode < 1 && (rem(SourceNode,1)==0) && (isreal(SourceNode)) && (SourceNode <= size(Graph,1))
    fprintf('The source node must be an integer within [1, sizeofGraph]\n');
    return;
elseif TerminalNode < 1 && (rem(TerminalNode,1)==0) && isreal(TerminalNode) && (TerminalNode <= size(Graph,1))
    fprintf('The terminal node must be an integer within [1, sizeofGraph]\n');
    return;
end

% Special Case so no need to waste time doing initializations
if SourceNode == TerminalNode
    Cost = Graph(SourceNode, TerminalNode);
    Route = SourceNode;
    return;
end

% Set up a cell structure so that I can store the optimal path from source 
% node to each node in this structure. This structure stores the
% antecedents so for instance if there is a path to B through A-->C-->D-->B
% you will see [A,C,D] in cell{B} (as well as a bunch of filler 0's after
% that)
PathToNode = cell(size(Graph,1),1);

% Initialize all Node costs to infinity except for the source node
NodeCost = Inf.*ones(1,size(Graph,1));
NodeCost(SourceNode) = 0;

% Initialize the Current Node to be the Source Node
CurrentNode = SourceNode;

% Initialize the set of Visited and Unvisited Nodes
VisitedNodes = SourceNode;
UnvisitedNodes = 1:size(Graph,2);
UnvisitedNodes = UnvisitedNodes(UnvisitedNodes ~= VisitedNodes);

while (CurrentNode ~= TerminalNode)
    % Extract the Costs/Path Lengths to each node from the current node
    CostVector = Graph(CurrentNode, :);
    % Only look at valid neighbors ie. those nodes which are unvisited
    UnvisitedNeighborsCostVector = CostVector(UnvisitedNodes);
    % Extract the cost to get to the Current Node
    CurrentNodeCost = NodeCost(CurrentNode);
    % Extract the path to the current node
    PathToCurrentNode = PathToNode{CurrentNode};
    % Iterate through the Unvisited Neighbors assigning them a new tentative cost
    for i = 1:length(UnvisitedNeighborsCostVector)
       if UnvisitedNeighborsCostVector(i) ~= Inf % Only Check for update if non-infinite
           tempCost = CurrentNodeCost + UnvisitedNeighborsCostVector(i); % The tentative cost to get to the neighbor through the current node
           % Compare the tentative cost to the currently assigned cost and
           % assign the minimum
           if tempCost < NodeCost(UnvisitedNodes(i))
               NewPathToNeighbor = [PathToCurrentNode(PathToCurrentNode~=0) CurrentNode]; % The new path to get to the neighbor
               NewPath = [NewPathToNeighbor zeros(1,size(Graph,1)-size(NewPathToNeighbor,2))];
               PathToNode{UnvisitedNodes(i)}(:) = NewPath;
               NodeCost(UnvisitedNodes(i)) = tempCost;
           end
       end
    end
    % Search for the smallest cost remaining that is in the unvisited set
    RemainingCosts = NodeCost(UnvisitedNodes);
    [MIN, MIN_IND] = min(RemainingCosts);
    
    % If the smallest remaining cost amongst the unvisited set of nodes is
    % infinite then there is no valid path from the source node to the
    % terminal node. 
    if MIN == Inf
       fprintf('There is no valid path from the source node to the');
       fprintf('terminal node. Please check your graph.\n')
       return;
    end
    
    % Update the Visited and Unvisited Nodes
    VisitedNodes = [VisitedNodes CurrentNode];
    CurrentNode = UnvisitedNodes(MIN_IND);
    UnvisitedNodes = UnvisitedNodes(UnvisitedNodes~=CurrentNode);
end

Route = PathToNode{TerminalNode};
Route = Route(Route~=0);
Route = [Route TerminalNode];
Cost = NodeCost(TerminalNode);
end