#!/bin/bash
#----------------------------------------------------------------------------------------\
# Purpose: Supplemental Materials for Facebook Reality Labs DevOps Engineer Interview
#
# Description: Implements a BST in bash and displays results using random integers  
#
# Complexity: 
#	Build list of sorted/unique results (BST): O(log n) [best] 
#	Output results (BST): O(n) [best]
#
# Author: Sameet Singh (sameet.singh@outlook.com)
# Date: 09/25/2020
#----------------------------------------------------------------------------------------/

# Purpose: Creates a new BST node.
new_node() {
	local node_id="$1";
	local value="$2";
	local left="$3";
	local right="$4";
	eval "${node_id}set='set'";
	eval "set_node_value $node_id $value";
	eval "set_node_left $node_id $right";
	eval "set_node_right $node_id $right";
}

# Purpose: Generates unique GUID for BST nodes.
new_node_guid() {
	echo "id$(uuidgen|tr -d '-')";
}

# Purpose: Sets left BST child node value.
set_node_left() {
	eval "${1}.getLeftChild()  { echo "$2"; }"
}

# Purpose: Sets right BST child node value.
set_node_right() {
	eval "${1}.getRightChild() { echo "$2"; }"
}

# Purpose: Sets current BST node value.
set_node_value() {
	eval "${1}.getValue() { echo "$2"; }"
}

# Purpose: Inserts a new BST node.
# Avg. Complexity: O(log n)
tree_insert() {
	local id="$1"
	local value="$2";
	if [ -z "$(eval "echo \$${id}set")" ]; then
		eval "new_node $id $value";
	elif [[ $value -le $(${id}.getValue) ]]; then
		if [ "$(eval ${id}.getLeftChild)xxx" != "xxx" ]; then
			tree_insert $(eval ${id}.getLeftChild) $value
		else
			local nguid=$(new_node_guid);
			tree_insert $nguid $value;
			set_node_left $id $nguid;
		fi
	else 
		if [ "$(eval ${id}.getRightChild)xxx" != "xxx" ]; then
			tree_insert $(eval ${id}.getRightChild) $value
		else
			local nguid=$(new_node_guid);
			tree_insert $nguid $value;
			set_node_right $id $nguid;
		fi
	fi
}

# Purpose: Recursive method that prints BST node values. 
# Avg. Complexity: O(n) 
output_bst_nodes() {
	local node="$*";
		if [ "${node}xxx" == "xxx" ]; then
		return;
	fi
	output_bst_nodes $(eval ${node}.getLeftChild)
	echo $(${node}.getValue)
	output_bst_nodes $(eval ${node}.getRightChild)
}

# ----------------------
# Main Execution Block
# ----------------------
for (( i=1; i<=10; i++ ))
do
	tree_insert bst $(($i + RANDOM % 100));
done

output_bst_nodes bst
