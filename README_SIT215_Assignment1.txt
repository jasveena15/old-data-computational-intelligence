SIT215 Assignment 1 – Wheelchair-Accessible Route Planning
-----------------------------------------------------------

Project Overview:
This project implements a navigation system for wheelchair users, using the A* search algorithm to compute optimal or most accessible routes on a custom environment map. The solution includes:
- Environment modeling using a graph with accessible paths.
- A* pathfinding with two heuristics (standard and constraint-aware).
- Dijkstra's algorithm for comparison.
- Visualizations for paths and performance.

How to Run (Using Jupyter Notebook):
------------------------------------
1. Open the Jupyter Notebook environment.
2. Navigate to the file: `CI - assignment.ipynb`.
3. Run each cell sequentially using the "Run" button or Shift + Enter.
   - Ensure required libraries are installed before running.

Required Python Version:
------------------------
- Python 3.9 or higher (recommended: Python 3.10+)

Required Libraries:
-------------------
You can install the following libraries using pip:

pip install matplotlib
pip install networkx
pip install pandas
pip install seaborn

Imported Libraries in the Notebook:
-----------------------------------
- matplotlib.pyplot
- networkx
- pandas
- seaborn
- heapq (built-in)
- math (built-in)

Ensure these libraries are installed before execution.

Notes:
------
- The notebook includes multiple test cases to evaluate A*, enhanced A*, and Dijkstra’s algorithm.
- Modify start and goal nodes in the test cells to run custom queries.
- Visual outputs will show the selected paths and performance comparisons.
