public class TestJava {
    public static void main(String[] args) {
        System.out.println("JAVA_OK");
        System.out.println("PID=" + ProcessHandle.current().pid());
        System.out.println("PROCESSORS=" + Runtime.getRuntime().availableProcessors());
        System.out.println("MAX_MEMORY=" + Runtime.getRuntime().maxMemory());
    }
}
