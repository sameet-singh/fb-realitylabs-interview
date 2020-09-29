#----------------------------------------------------------------------------------------\
# Purpose: Supplemental Materials for Facebook Reality Labs DevOps Engineer Interview
#
# Description: Dual-pivot QuickSort of random generated integer list
#
# Complexity: 
#	Sort sequence array (QuickSort): O(log n) [best] 
#	Output array results (ASC/DESC): O(n) [best]
#
# Author: Sameet Singh (sameet.singh@outlook.com)
# Date: 09/28/2020
#----------------------------------------------------------------------------------------/

from random import randint

def dualPivotQuickSort(arr, low, high): 
    if low < high: 
        lp, rp = partition(arr, low, high)          
        dualPivotQuickSort(arr, low, lp - 1) 
        dualPivotQuickSort(arr, lp + 1, rp - 1) 
        dualPivotQuickSort(arr, rp + 1, high) 
          
def partition(arr, low, high):      
    if arr[low] > arr[high]: 
        arr[low], arr[high] = arr[high], arr[low]         
    j = k = low + 1
    g, p, q = high - 1, arr[low], arr[high] 
    while k <= g: 
        if arr[k] < p: 
            arr[k], arr[j] = arr[j], arr[k] 
            j += 1
        elif arr[k] >= q: 
            while arr[g] > q and k < g: 
                g -= 1                 
            arr[k], arr[g] = arr[g], arr[k] 
            g -= 1
            if arr[k] < p: 
                arr[k], arr[j] = arr[j], arr[k] 
                j += 1
        k += 1
    j -= 1
    g += 1
    arr[low], arr[j] = arr[j], arr[low] 
    arr[high], arr[g] = arr[g], arr[high] 
    return j, g 
  
# ----------------------
# Main Execution Block
# ----------------------
randlist = []

for i in range(10):
    randlist.append(randint(0, 100))

print ("Random Integer List: ", randlist)

dualPivotQuickSort(randlist, 0, 9)

print ("Sorted List: ", randlist)

