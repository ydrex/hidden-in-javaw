import java.nio.file.Files;
import java.nio.file.Path;

public class RunsAsJava {
    public static void main(String[] args) throws Exception {
        System.out.println("runs as java");
        System.out.println("task manager: java.exe / javaw.exe");
        System.out.println("host: " + ProcessHandle.current().info().command().orElse("java"));

        Path path = Path.of(System.getProperty("java.io.tmpdir"), "runs-as-java.marker");
        Files.writeString(path, "ok\n");
        System.out.println("wrote " + path.toAbsolutePath());
    }
}
