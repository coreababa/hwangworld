package wood.shop.dto;

import javax.servlet.jsp.PageContext;

public class ParamTO {
	private int page=1;
	private int startpage=1;
	private int endpage;
	private int block=10;
	private int limit=5;
	private int pagenum=0;
	private int totalcnt=0;
	private int startrow;
	private int endrow;
	private int board_code=0;
	private String search_txt="";
	private String search_sel="";
	private String url;
	private String mode;
	PageContext pageContext;
	
	public ParamTO() {
		// TODO Auto-generated constructor stub
	}


	

	public ParamTO(int page, int startpage, int endpage, int block, int limit, int pagenum, int totalcnt, int startrow,
			int endrow, int board_code, String search_txt, String search_sel, String url, String mode
			) {
		super();
		this.page = page;
		this.startpage = startpage;
		this.endpage = endpage;
		this.block = block;
		this.limit = limit;
		this.pagenum = pagenum;
		this.totalcnt = totalcnt;
		this.startrow = startrow;
		this.endrow = endrow;
		this.board_code = board_code;
		this.search_txt = search_txt;
		this.search_sel = search_sel;
		this.url = url;
		this.mode = mode;
		
	}

	

	@Override
	public String toString() {
		return "ParamVO [page=" + page + ", startpage=" + startpage + ", endpage=" + endpage + ", block=" + block
				+ ", limit=" + limit + ", pagenum=" + pagenum + ", totalcnt=" + totalcnt + ", startrow=" + startrow
				+ ", endrow=" + endrow + ", board_code=" + board_code + ", search_txt=" + search_txt + ", search_sel="
				+ search_sel + ", url=" + url + ", mode=" + mode + ", pageContext=" + pageContext + "]";
	}




	public int getPage() {
		return page;
	}




	public void setPage(int page) {
		this.page = page;
	}




	public int getStartpage() {
		return startpage;
	}




	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}




	public int getEndpage() {
		return endpage;
	}




	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}




	public int getBlock() {
		return block;
	}




	public void setBlock(int block) {
		this.block = block;
	}




	public int getLimit() {
		return limit;
	}




	public void setLimit(int limit) {
		this.limit = limit;
	}




	public int getPagenum() {
		return pagenum;
	}




	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}




	public int getTotalcnt() {
		return totalcnt;
	}




	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}




	public int getStartrow() {
		return startrow;
	}




	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}




	public int getEndrow() {
		return endrow;
	}




	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}




	public int getBoard_code() {
		return board_code;
	}




	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}




	public String getSearch_txt() {
		return search_txt;
	}




	public void setSearch_txt(String search_txt) {
		this.search_txt = search_txt;
	}




	public String getSearch_sel() {
		return search_sel;
	}




	public void setSearch_sel(String search_sel) {
		this.search_sel = search_sel;
	}




	public String getUrl() {
		return url;
	}




	public void setUrl(String url) {
		this.url = url;
	}




	public String getMode() {
		return mode;
	}




	public void setMode(String mode) {
		this.mode = mode;
	}




	public PageContext getPageContext() {
		return pageContext;
	}




	public void setPageContext(PageContext pageContext) {
		this.pageContext = pageContext;
	}




	
	public  String pageView() {
		
		return "";
	
	}
}
