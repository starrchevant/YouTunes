public class HelloWorld{


    static class Box {
        E mything;
        
        public void set(E thing) {
          mything=thing;    
        }
        public E get() {
            return mything;
        }
        
    }


     public static void main(String []args){
        System.out.println("Hello World");
        Box stringbox=new Box();
        System.out.println(stringbox.get());
        Box intbox=new Box();
        stringbox.set("Hello");
        System.out.println(stringbox.get());
        intbox.set(6);
        System.out.println(intbox.get()%4);
     }
}