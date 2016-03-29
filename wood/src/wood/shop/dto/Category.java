package wood.shop.dto;

public class Category {
	private int item_category_no;
	private String category_name_str;
	private int root_no;
	private int level_no;
	private int step_no;
	private String create_date;
	private String update_date;
	private String delete_date;
	private String remote_addr_str;
	private String is_del;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}


	private Category(int item_category_no, String category_name_str, int root_no, int level_no, int step_no,
			String create_date, String update_date, String delete_date, String remote_addr_str, String is_del) {
		super();
		this.item_category_no = item_category_no;
		this.category_name_str = category_name_str;
		this.root_no = root_no;
		this.level_no = level_no;
		this.step_no = step_no;
		this.create_date = create_date;
		this.update_date = update_date;
		this.delete_date = delete_date;
		this.remote_addr_str = remote_addr_str;
		this.is_del = is_del;
	}





	@Override
	public String toString() {
		return "Category [item_category_no=" + item_category_no + ", category_name_str=" + category_name_str
				+ ", root_no=" + root_no + ", level_no=" + level_no + ", step_no=" + step_no + ", create_date="
				+ create_date + ", update_date=" + update_date + ", delete_date=" + delete_date + ", remote_addr_str="
				+ remote_addr_str + ", is_del=" + is_del + "]";
	}


	public int getItem_category_no() {
		return item_category_no;
	}


	public void setItem_category_no(int item_category_no) {
		this.item_category_no = item_category_no;
	}


	public String getCategory_name_str() {
		return category_name_str;
	}


	public void setCategory_name_str(String category_name_str) {
		this.category_name_str = category_name_str;
	}


	public int getRoot_no() {
		return root_no;
	}


	public void setRoot_no(int root_no) {
		this.root_no = root_no;
	}


	public int getLevel_no() {
		return level_no;
	}


	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}


	public int getStep_no() {
		return step_no;
	}


	public void setStep_no(int step_no) {
		this.step_no = step_no;
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


	public String getRemote_addr_str() {
		return remote_addr_str;
	}


	public void setRemote_addr_str(String remote_addr_str) {
		this.remote_addr_str = remote_addr_str;
	}


	public String getIs_del() {
		return is_del;
	}


	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + item_category_no;
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
		Category other = (Category) obj;
		if (item_category_no != other.item_category_no)
			return false;
		return true;
	}
	
	
}
