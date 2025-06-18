package ch11_re;

public class _03_Main {

	public static void main(String[] args) {
		
		Thread a = new Thread(new _03_MyThread());
		Thread b = new Thread(new _03_MyThread());

		
		a.start();
		b.start();
	}
}
