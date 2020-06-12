package scond.reply.service;

public class ReplyPager {

	// 페이지당 게시물수
	public static final int PAGE_SCALE = 10;

	// 화면당 페이지수
	public static final int BLOCK_SCALE = 5;

	private int curPage; // 현재 페이지
	private int prevPage; // 이전 페이
	private int nextPage; // 다음페이
	private int totPage; // 전체 페이지
	private int totBlock; //전체 페이지 블록수
	private int curBlock; // 현재 페이지 블록
	private int prevBlock;//이전 페이지 블록
	private int nextBlock; // 다음 페이지 블록
	private int pageBegin; // #{start}
	private int pageEnd; // #{end}
	private int blockBegin;
	private int blockEnd; // 현재 페이지 블록아ㅢ 끝번호

//생성자
//BOARDPAGER(레코드 갯수, ㅜ현재 페이지 번호)
	public ReplyPager(int count, int curPage) {
		curBlock = 1; // 현재 페이지 블록
		this.curPage = curPage; // 현재 페이지 설정
		setTotPage(count); // 전체 페이지 갯수 계산
		setPageRange();
		setTotBlock(); // 전체 페이지 블록 갯수 계산
		setBlockRange(); // 페이지 블록의 시작, 끝번호 계산

	}
	
	public void setBlockRange() {
		curBlock = (int)Math.ceil((curPage-1)/ BLOCK_SCALE)+1;
		blockBegin = (curBlock-1)*BLOCK_SCALE+1;
		blockEnd =blockBegin+BLOCK_SCALE-1;
		if(blockEnd>totPage)blockEnd=totPage;
		prevPage =(curPage ==1)? 1:(curBlock-1)*BLOCK_SCALE;
		nextPage =curBlock>totPage ? (curBlock*BLOCK_SCALE) :
			(curBlock*BLOCK_SCALE)+1;
		if(nextPage>=totPage) nextPage = totPage;
	}
	
	public void setPageRange() {
		
		//시작번 = (현재페이지-1)*페이지당 게시물수 +1
		pageBegin =(curPage-1)*PAGE_SCALE+1;

		//끝번호 = 시작번호 + 페이지당 게시물수 -1
		pageEnd =pageBegin+PAGE_SCALE-1;
		
	}
		
	

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int count) {
		totPage =(int) Math.ceil(count*1.0/PAGE_SCALE);
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock() {
		// this.totBlock = totBlock;
		totBlock = (int) Math.ceil(totPage/BLOCK_SCALE);
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	public static int getPageScale() {
		return PAGE_SCALE;
	}

	public static int getBlockScale() {
		return BLOCK_SCALE;
	}

	

}
