## IN2010 --- Oblig 2

To compile this project, use any modern java compiler, and run:
```
javac *.java
```

And then use the following command to read a graph's timings.
```
java Oblig2 <filename>
```

You can create your own graphs if you want to, adding tasks manually. Keep in mind that `Oblig2.java` is specific to the input files of the given assignment, and therefore contains the `main()` function; while `Graph.java` and `Task.java` can be further used for other projects and calculations.

A sample way to create your own graphs, with three tasks:
```
Graph graph = new Graph();

Task t1 = new Task(1, 1, 1, "task 1");
Task t2 = new Task(2, 10, 1, "task 2");
Task t3 = new Task(3, 3, 1, "task 3");

graph.addLink(t1, t2);
graph.addLink(t1, t3);
```

The graph detects cycles, and warns the user about them. The first argument to task is the id, and can easily be used to pass through details from custom textfiles. The second and third arguments, respectively, correspond to the time and manpower required to fulfill the task. Lastly, a name is required for the output.

When done adding all the links, use `graph.calculateTimings()` to "save" your details, and then run either the `graph.simulationLazy()` or the `graph.simulationRush()` to preview different ways any given graph can be traversed using the same total node-to-node distance. 

Beware: it is assumed the given input files to `Oblig2` are correctly parsed according to the assignment specifications, so no parsing revision has been done. If files are wrongly presented, `InputMismatchException`s will appear. 

Have fun, mazunki =)