package wood.shop.dto;

public class Item {
	private int item_no;
	private String item_name_str;
	private String content_str;
	private int status_no;
	private int sale_no;
	private int price_no;
	private int count_no;
	private int category;
	private int item_file_no;
	private String create_date;
	private String update_date;
	private String delete_date;
	private String is_del;
	private String remote_addr_str;
	
	public Item() {
		// TODO Auto-generated constructor stub
	}
	public Item(int item_no, String item_name_str, String content_str, int status_no, int sale_no, int price_no,
			int count_no, int category, int item_file_no, String create_date, String update_date, String delete_date,
			String is_del, String remote_addr_str) {
		super();
		this.item_no = item_no;
		this.item_name_str = item_name_str;
		this.content_str = content_str;
		this.status_no = status_no;
		this.sale_no = sale_no;
		this.price_no = price_no;
		this.count_no = count_no;
		this.category = category;
		this.item_file_no = item_file_no;
		this.create_date = create_date;
		this.update_date = update_date;
		this.delete_date = delete_date;
		this.is_del = is_del;
		this.remote_addr_str = remote_addr_str;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getItem_name_str() {
		return item_name_str;
	}
	public void setItem_name_str(String item_name_str) {
		this.item_name_str = item_name_str;
	}
	public String getContent_str() {
		return content_str;
	}
	public void setContent_str(String content_str) {
		this.content_str = content_str;
	}
	public int getStatus_no() {
		return status_no;
	}
	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}
	public int getSale_no() {
		return sale_no;
	}
	public void setSale_no(int sale_no) {
		this.sale_no = sale_no;
	}
	public int getPrice_no() {
		return price_no;
	}
	public void setPrice_no(int price_no) {
		this.price_no = price_no;
	}
	public int getCount_no() {
		return count_no;
	}
	public void setCount_no(int count_no) {
		this.count_no = count_no;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getItem_file_no() {
		return item_file_no;
	}
	public void setItem_file_no(int item_file_no) {
		this.item_file_no = item_file_no;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getDelete_date() {
		return delete_date;
	}
	public void setDelete_date(String delete_date) {
		this.delete_date = delete_date;
	}
	public String getIs_del() {
		return is_del;
	}
	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}
	public String getRemote_addr_str() {
		return remote_addr_str;
	}
	public void setRemote_addr_str(String remote_addr_str) {
		this.remote_addr_str = remote_addr_str;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + item_no;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Item other = (Item) obj;
		if (item_no != other.item_no)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Item [item_no=" + item_no + ", item_name_str=" + item_name_str + ", content_str=" + content_str
				+ ", status_no=" + status_no + ", sale_no=" + sale_no + ", price_no=" + price_no + ", count_no="
				+ count_no + ", category=" + category + ", item_file_no=" + item_file_no + ", create_date="
				+ create_date + ", update_date=" + update_date + ", delete_date=" + delete_date + ", is_del=" + is_del
				+ ", remote_addr_str=" + remote_addr_str + "]";
	}
	
	
}
