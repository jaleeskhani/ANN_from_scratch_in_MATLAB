classdef dlnode < handle
   % dlnode A class to represent a doubly-linked node.
   % Link multiple dlnode objects together to create linked lists.
   properties
       LName
       LType
       NType
       LNeur
       iActiv
       weights
       dweights   %deriv (for change in weights)d
       bias
       actFtn
       errType
       error      % error at each neuron/node
       LRate
       desOut
   end
%       valOfNeur
%       neurons
%       actFtn
%       name
%       error
%       LRate
   properties(SetAccess = private)
      Next = dlnode.empty
      Prev = dlnode.empty
   end
   
   methods
      function Node = dlnode(LName,LType,NType,LNeur,iActiv,weights,dweights,bias,actFtn,errType,error,LRate,desOut)
         % Construct a dlnode object
         if nargin > 0
            Node.LName    = LName;
            Node.LType    = LType;
            Node.NType    = NType;
            Node.LNeur    = LNeur;
            Node.iActiv   = iActiv;
            Node.weights  = weights;
            Node.dweights = dweights;
            Node.bias     = bias;
            Node.actFtn   = actFtn;
            Node.errType  = errType;
            Node.error    = error;
            Node.LRate    = LRate;
            Node.desOut   = desOut;
         end
      end
      
      function insertAfter(newNode, nodeBefore)
         % Insert newNode after nodeBefore.
         removeNode(newNode);
         newNode.Next = nodeBefore.Next;
         newNode.Prev = nodeBefore;
         if ~isempty(nodeBefore.Next)
            nodeBefore.Next.Prev = newNode;
         end
         nodeBefore.Next = newNode;
      end
      
      function insertBefore(newNode, nodeAfter)
         % Insert newNode before nodeAfter.
         removeNode(newNode);
         newNode.Next = nodeAfter;
         newNode.Prev = nodeAfter.Prev;
         if ~isempty(nodeAfter.Prev)
            nodeAfter.Prev.Next = newNode;
         end
         nodeAfter.Prev = newNode;
      end
      
      function removeNode(node)
         % Remove a node from a linked list.
         if ~isscalar(node)
            error('Input must be scalar')
         end
         prevNode = node.Prev;
         nextNode = node.Next;
         if ~isempty(prevNode)
            prevNode.Next = nextNode;
         end
         if ~isempty(nextNode)
            nextNode.Prev = prevNode;
         end
         node.Next = dlnode.empty;
         node.Prev = dlnode.empty;
      end
      
      function clearList(node)
         % Clear the list before
         % clearing list variable
         prev = node.Prev;
         next = node.Next;
         removeNode(node)
         while ~isempty(next)
            node = next;
            next = node.Next;
            removeNode(node);
         end
         while ~isempty(prev)
            node = prev;
            prev = node.Prev;
            removeNode(node)
         end
      end
   end
   
   methods (Access = private)
      function delete(node)
         clearList(node)
      end
   end
end

