import static org.junit.Assert.*;
import org.junit.*;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

class containsLetterA implements StringChecker {

  public boolean checkString(String s) {
    return s.contains("a");
  }
}

public class TestListExamples {
  @Test
    public void testFilter() {
      List<String> input1 = new ArrayList<String>(Arrays.asList("amazing", "a p p l e s", "hi"));
      assertEquals(new ArrayList<String>(Arrays.asList("amazing","a p p l e s")), ListExamples.filter(input1, new containsLetterA()));
    }

  @Test
    public void testMerge() {
      List<String> input1 = new ArrayList<String>(Arrays.asList("a", "c", "e"));
      List<String> input2 = new ArrayList<String>(Arrays.asList("b", "d", "f"));
      List<String> output = new ArrayList<String>(Arrays.asList("a", "b", "c", "d", "e", "f"));
      assertEquals(output, ListExamples.merge(input1, input2));
    }
}