import MacroSample

switch 0 {
case let x:
    #stringify(x)
    // If you uncomment the line below, then the compiler doesn't output errors any more.
    // print(x)
}
