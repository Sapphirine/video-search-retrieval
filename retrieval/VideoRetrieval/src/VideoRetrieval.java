/*
 * This application implements video retrieval.
 */
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class VideoRetrieval {
	/*
     * Number of retrieval results.
     */
	private static final int RETRIEVAL_NUM = 8;
	
	/*
     * The ID of a test video.
     */
	private static final int TST_ID = 2;
	
	public static void main(String[] args) {
		try {
			File tst = new File("data/U_tst.txt");			
			Scanner input = new Scanner(tst);
			int id = 0;
			String tstCode = "";
			
			while (input.hasNext()) {
				id++;
				tstCode = input.next();
				if (id == TST_ID) {
					break;
				}
			}
			
			String[] tstCodeSeq = tstCode.split(",");
			
			File trn = new File("data/U_trn.txt");			
			input = new Scanner(trn);
			String trnCode = "";
			int trnId = 0;
			ArrayList<Integer> idDistance = new ArrayList<Integer>();
			
			while (input.hasNext()) {
				trnId++;
				trnCode = input.next();
				String[] trnCodeSeq = trnCode.split(",");
				
				int hammingDistance = hamming(tstCodeSeq, trnCodeSeq);
				
				idDistance.add(hammingDistance);
			}
			
			input.close();
			
			int[] idDistanceArray = new int[trnId];
			for (int i = 0; i < trnId; i++) {
				idDistanceArray[i] = idDistance.get(i);
			}
			
			int[] idDistanceArraySort = new int[trnId];
			System.arraycopy(idDistanceArray, 0, idDistanceArraySort, 0, trnId);
			Arrays.sort(idDistanceArraySort);
			
			ArrayList<Integer> result = new ArrayList<Integer>();
			int i = 0; //index of idDistanceArraySort
			int j = 0; //index of idDistanceArray
			
			while (result.size() < RETRIEVAL_NUM) {
				while (idDistanceArray[j] != idDistanceArraySort[i]) {
					j++;
					if (j >= idDistanceArray.length) {
						j = 0;
					}
				}
				
				result.add(j + 1);
				i++; j++;
				if (j >= idDistanceArray.length) {
					j = 0;
				}
			}
			
			System.out.println(result.toString());
		}
		catch (Exception e) {
			System.err.println(e);
		}
	}
	
	/**
     * This method computes the hamming distance between two binary sequence.
     */
	private static int hamming(String[] tstCodeSeq, String[] trnCodeSeq) {
		if (tstCodeSeq.length != trnCodeSeq.length)
			return 0;
		
		int hammingDistance = 0;
		
		for (int i = 0; i < tstCodeSeq.length; i++) {
			int tstCode = Integer.parseInt(tstCodeSeq[i]);
			int trnCode = Integer.parseInt(trnCodeSeq[i]);
			
			hammingDistance += tstCode ^ trnCode;
		}
		
		return hammingDistance;
	}
}
