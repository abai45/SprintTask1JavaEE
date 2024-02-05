package Classes;

import java.util.ArrayList;

public class DBManager {

    private static ArrayList<Task> tasks = new ArrayList<>();
    private static Long id = 4L;

    static {
        tasks.add(new Task(1L, "Math", "description", "2024-02-07", true));
        tasks.add(new Task(2L, "English", "description", "2024-03-01", false));
        tasks.add(new Task(3L, "History", "description", "2024-02-15", true));
    }

    public static void addTask(Task task) {
        Task tasks = new Task();
        tasks.setId(id);
        tasks.setStatus(false);
        id++;
    }
    public static Task getTask(Long id) {
        Task task = new Task();
        for(Task t: tasks) {
            if (t.getId()== id) {
                task = t;
                break;
            } else {
                task = null;
            }
        }
        return task;
    }
    public static ArrayList getAllTasks() {
        return tasks;
    }
    public static void deleteTask(Long id) {
        for(Task t: tasks) {
            if (t.getId() == id) {
                tasks.remove(t);
            }
        }
    }
}
