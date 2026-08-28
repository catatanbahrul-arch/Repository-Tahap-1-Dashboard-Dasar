public class TestJava {
    public static void main(String[] args) {
        System.out.println("JAVA_PROCESS_OK");
        System.out.println("Processors=" + Runtime.getRuntime().availableProcessors());
        System.out.println("MaxMemory=" + Runtime.getRuntime().maxMemory());
    }
}
