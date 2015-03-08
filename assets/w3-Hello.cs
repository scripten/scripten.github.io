using System;

public class PersonMaker {
  static public void Main(string[] args) {
    if(args.Length == 1)
      Console.WriteLine("Hello {0}!", args[0]);
    else
      Console.WriteLine("Hello user!");
    Console.WriteLine("What's your favorite color?");
    Console.Write("Input> ");
    string color = Console.ReadLine().ToLower();
    Console.WriteLine("Oh, so you like {0}? I guess that's okay.", color);
  }
}
