import static org.junit.Assert.*;
import java.beans.Transient;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;

public class TestListExamples {
  // Write your grading tests here!
  @Test 
	public void testfilter() {
    ArrayList<String> input1 = new ArrayList();
    input1.add("apple");
    input1.add("hello");
    input1.add("amazing");
    List <String> expected = new ArrayList();
    expected.add("apple");
    expected.add("amazing");
    assertArrayEquals(expected.toArray(), ListExamples.filter(input1, new TestListExamples()).toArray());
	}
  @Test
  public void testmerge() {
    List<String> list1 = new ArrayList<String>();
    list1.add("add");
    list1.add("amazing");
    List<String> list2 = new ArrayList<String>();
    list2.add("amazing");
    list2.add("zoo");
    List<String> expected = new ArrayList<String>();
    expected.add("add");
    expected.add("amazing");
    expected.add("zoo");
    assertArrayEquals(expected, ListExamples.merge(list1,list2));
}
}