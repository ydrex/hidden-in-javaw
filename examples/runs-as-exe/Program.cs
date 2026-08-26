using System.Diagnostics;
using System.Text;

Console.WriteLine("runs as exe");
Console.WriteLine("task manager: " + Process.GetCurrentProcess().ProcessName + ".exe");

string path = Path.Combine(Path.GetTempPath(), "runs-as-exe.marker");
File.WriteAllText(path, "ok\n", Encoding.UTF8);
Console.WriteLine("wrote " + path);
