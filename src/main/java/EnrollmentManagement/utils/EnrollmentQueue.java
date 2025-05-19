package EnrollmentManagement.utils;

import CourseEnrollment.model.Enrollment;

public class EnrollmentQueue {
    private Enrollment[] arr;
    private int front;
    private int rear;
    private int count;

    public EnrollmentQueue(int capacity) {
        arr = new Enrollment[capacity];
        front = 0;
        rear = -1;
        count = 0;
    }

    public EnrollmentQueue() {
        this(16); // Default initial capacity
    }

    public void enqueue(Enrollment e) {
        if (isFull()) expand();
        rear = (rear + 1) % arr.length;
        arr[rear] = e;
        count++;
    }

    public Enrollment dequeue() {
        if (isEmpty()) return null;
        Enrollment temp = arr[front];
        arr[front] = null;
        front = (front + 1) % arr.length;
        count--;
        return temp;
    }

    public boolean isEmpty() { return count == 0; }
    public boolean isFull()  { return count == arr.length; }
    public int size()        { return count; }

    private void expand() {
        Enrollment[] newArr = new Enrollment[arr.length * 2];
        for (int i = 0; i < count; i++) {
            newArr[i] = arr[(front + i) % arr.length];
        }
        arr = newArr;
        front = 0;
        rear = count - 1;
    }

    public Enrollment[] toArray() {
        Enrollment[] result = new Enrollment[count];
        for (int i = 0; i < count; i++) {
            result[i] = arr[(front + i) % arr.length];
        }
        return result;
    }

    public void clear() {
        arr = new Enrollment[16];
        front = 0;
        rear = -1;
        count = 0;
    }
}
