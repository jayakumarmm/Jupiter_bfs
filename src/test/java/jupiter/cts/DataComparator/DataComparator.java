package jupiter.cts.DataComparator;

import java.io.BufferedReader;
import java.io.File;

import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.google.common.base.Charsets;
import com.google.common.io.Files;

import difflib.DiffRow;
import difflib.DiffRowGenerator;


public class DataComparator {

	public static List<String> fileToLines(String filename) {
		List<String> lines = new LinkedList<String>();
		String line = "";
		BufferedReader in = null;
		try {
			in = new BufferedReader(new FileReader(filename));
			while ((line = in.readLine()) != null) {
				lines.add(line.replaceAll("<br>", ""));
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {

				}
			}
		}
		return lines;
	}

	public int compare(String file1,String file2) throws Throwable{

		List<String> original =  fileToLines(file1);
		List<String> revised  = fileToLines(file2);
		Collections.sort(original);
		Collections.sort(revised);
		StringBuilder sb = new StringBuilder();
		DiffRowGenerator.Builder builder = new DiffRowGenerator.Builder();
		DiffRowGenerator dfg = builder.columnWidth(Integer.MAX_VALUE).ignoreBlankLines(true).ignoreWhiteSpaces(true).build();
		List<DiffRow> rows = dfg.generateDiffRows(original, revised);
		for (final DiffRow diffRow : rows)
		{
			if (diffRow.getTag().equals(DiffRow.Tag.INSERT)) // or use switch* 
			{
				sb.append("DIFF CATEGORY='INSERT'\n");
				sb.append("\t" + diffRow.getNewLine() + "\n");
			}
			else if (diffRow.getTag().equals(DiffRow.Tag.DELETE))
			{
				sb.append("DIFF CATEGORY='DELETE'\n");
				sb.append("\t" + diffRow.getOldLine() + "\n");
			}
			else if (diffRow.getTag().equals(DiffRow.Tag.CHANGE))
			{
				sb.append("DIFF CATEGORY='CHANGE'\n");
				sb.append("\t" + diffRow.getOldLine() + "\n");
				sb.append("\t" + diffRow.getNewLine() + "\n");
				sb.append("\n");
			
			}
		}

		System.out.println(sb);
		int diffcnt=sb.length();
		if(diffcnt!=0){
		String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		File diffout=new File("Diff_Report"+"_"+timestamp+".csv");
		Files.write(sb, diffout, Charsets.UTF_8);
		}
		return diffcnt;     

	}
	public static void main(String[] args) {}
}