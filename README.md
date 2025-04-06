# SV-TB-Verification-Plan
This repository contains a SystemVerilog-based testbench developed for functional verification of digital designs. The testbench includes comprehensive simulation components such as: 
1.Generator.
2.Driver. 
3.Monitor. 
4.Scoreboard. 
5.Reference model.  
6.Environment.
7.Interface.
![Testbench Architecture](Testbench_architecture.png)


# What is an interface ? 
  If the design contained hundreds of port signals it would be cumbersome to connect, maintain and reuse those signals. Instead, we can place all the design input-output ports into a container which becomes an interface to the DUT. The design can then be driven with values through this interface.

# Transaction
 The transaction is a packet that is driven to the DUT or monitored by the monitor as a pin-level activity.In simple terms, the transaction is a class that holds a structure that is used to communicate with DUT.
 
# Generator
  The generator creates or generates randomized transactions or stimuli and passes them to the driver.
  
# What is a driver ?
  The driver is the verification component that does the pin-wiggling of the DUT, through a task defined in the interface. When the driver has to drive some input values to the design, it simply has to call this pre-defined task in the interface, without actually knowing the timing relation between these signals.The timing information is defined within the task provided by the interface. This is the level of abstraction required to make testbenches more flexible and scalable. In the future, if the interface changed, then the new driver can call the same task and drive signals in a different way.

# How does the driver knows what to drive? 
  The generator is a verification component that can create valid data transactions and send them to the driver. The driver can then simply drive the data provided to it by the generator through the interface. Data transactions are implemented as class objects shown by the blue squares in the image above. It is the job of the driver to get the data object and translate it into something the DUT can understand.

# Why is a monitor required ? 
  Until now, how data is driven to the DUT was discussed. But that's only half way through, because our primary aim is to verify the design. The DUT processes input data and sends the result to the output pins. The monitor picks up the processed data, converts it into a data object and sends it to the scoreboard.

#  What is the purpose of the scoreboard ?
  TheScoreboard can have a reference model that behaves the same way as the DUT. This model reflects the expected behavior of the DUT. Input sent to the DUT is also sent to this reference model. So if the DUT has a functional problem, then the output from the DUT will not match the output from our reference model. So comparison of outputs from the design and the reference model will tell us if there is a functional defect in the design. This is usually done in the scoreboard. 

# Why is an environment required? 
 It makes the verification more flexible and scalable because more components can be plugged into the same environment for a future project.

# What does the test do ?
   Exactly. The test will instantiate an object of the environment and configure it the way the test wants to. Remember that we will most probably have thousands 
of tests and it is not feasbile to make directchanges to the environment for each test. Instead we want certain knobs/parameters in theenvironment that can be tweaked for each test. That way, the test will have a higher control overstimulus generation and will be more effective.
 
  Here, we have talked about how a simple testbench looks like. In real projects, there'll be many such components plugged in to do various tasks at higher levels of abstraction. If we had to verify a simple digital counter with maximum 50 lines of RTL code, yea, this would suffice. But, when complexity increases, there will be a need to deal with more abstraction
