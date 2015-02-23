using System;
using System.IO;

public class FizzBuzz {
  static public void Main (string[] args) {
    try {
      using (StreamReader sr = new StreamReader(args[0])) {
        string line;
        while((line = sr.ReadLine()) != null)
          fizzBuzz(line);
      }
    } catch (Exception e) {
      Console.WriteLine("File could not be accessed");
      Console.WriteLine(e.Message);
    }
  }
  
  static private void fizzBuzz(string input) {
    string[] parts = input.Split(' ');
    int X = 0;
    int Y = 0;
    int N = 0;
    if(parts.Length > 3)
      Console.WriteLine("Error: Malformed Line \"" + input + "\"");
    else {
      X = Int32.Parse(parts[0]);
      Y = Int32.Parse(parts[1]);
      N = Int32.Parse(parts[2]);
    }
    for(int i = 1; i <= N; i++) {
      if(!(i % X == 0 || i % Y == 0))
        Console.Write(i);
      if(i % X == 0)
        Console.Write("F");
      if(i % Y == 0)
        Console.Write("B");
      Console.Write(" ");
    }
    Console.WriteLine();
  }
}
