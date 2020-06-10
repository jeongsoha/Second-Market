package sscond.reply.service;

public class RepltPager {

	// 페이지당 게시물수
	public static final int PAGE_SCALE = 10;

	// 화면당 페이지수
	public static final int BLOCK_SCALE = 4;

	private int curPage; // 현재 페이지
	private int prevPage; // 이전 페이
	private int nextPage; // 다음페이
	private int totPage; // 전체 페이지
	private int totBlock; // 현재 페이지
	private int curBlock; // 이전 페이지 블록
	private int nextBlock; // 다음 페이지 블록
	private int pageBegin; // #{start}
	private int pageEnd; // #{end}
	private int blockBegin;
	private int blockEnd; // 현재 페이지 블록아ㅢ 끝번호

//생성자
//BOARDPAGER(레코드 갯수, ㅜ현재 페이지 번호)
public ReplyPager(int count, int curPage) {
	curBlock = 1;			//현재 페이지 블록
	this.curPage = curPage;	//현재 페이지 설정
	setTotPage(count);		//전체 페이지 갯수 계산
	setPageRange();		
	setTotBlock();		//전체 페이지 블록 갯수 계산
	setBlockRange();		//페이지 블록의 시작, 끝번호 계산
	
}

public void setBlockRange() {
	
	curBlock = (int)Math.ceil(curPage-1) / BLOCK_SCALE)+1;
	
	blockBegin = (curBlock-1)*BLOCK_SCALE+1;
	blockEnd = blockBegin+BLOCK_SCALE-1;
	
	if(blockEnd >totPage) blockEnd = totPage;
	
	prevPage =(curPage ==1)? 1:(curBlock-1)*BLOCK_SCALE;
	nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE): (curBlock*BLOCK_SACLE)+1;
	//마지막 페이지가 범위 초과하지 않도록 처리
	if(nextPage >= totPage) nextPage = totPage;
			
}

	public void setPageRange() {
		pageBegin = (cuePage - 1) * PAGE_SCALE + 1;
		PageEnd = pageBegin + PAGE_SCALE - 1;
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

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
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
