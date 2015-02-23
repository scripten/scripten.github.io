using System;
using System.IO;
using System.Linq;

namespace FileApplication {
  class BurrowsWheelerInverter {
    static public void Main (string[] args) {
      try {
        using (StreamReader sr = new StreamReader(args[0])) {
          string line;
          while((line = sr.ReadLine()) != null) {
            string inverseLine = invert(line);
            Console.WriteLine(inverseLine);
          }
        }
      } catch (Exception e) {
        Console.WriteLine("File could not be accessed");
        Console.WriteLine(e.Message);
      }
    }

    static private string invert(string input) {
      string output = "";
      if(input.Length > 0)
        input = input.Substring(0, input.Length - 1);
      int I = input.Length;
      int[] matching = new int[I];
      int[] lessThan = new int[I];
      int index = 0;
      for(int i = 0; i < I; i++) {
        char cur = input[i];
        if(!matching.contains(cur)) {
          matching[index] = cur;
          index++;
        }
      }
      return output;
    }
  }
}
