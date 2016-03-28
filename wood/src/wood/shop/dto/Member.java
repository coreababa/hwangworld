package wood.shop.dto;

public class Member {
	private int member_no;
	private String id_str;
	private String passwd_str;
	private String name_str;
	private String email_str;
	private String post_str;
	private String addr_str;
	private String addr2_str;
	private String tel_str;
	private String cel_str;
	private int level_no;
	private int status_no;
	private MemberLevel member_level;
	private MemberStatus member_status;
	private String member_level_name;
	private String  member_status_name;
	private String reg_date;
	private String update_date;
	private String del_date;
	private String remote_addr_str;
	public Member() {
		// TODO Auto-generated constructor stub
	}
	

	private Member(int member_no, String id_str, String passwd_str, String name_str, String email_str, String post_str,
			String addr_str, String addr2_str, String tel_str, String cel_str, int level_no, int status_no,
			MemberLevel member_level, MemberStatus member_status, String member_level_name, String member_status_name,
			String reg_date, String update_date, String del_date, String remote_addr_str) {
		super();
		this.member_no = member_no;
		this.id_str = id_str;
		this.passwd_str = passwd_str;
		this.name_str = name_str;
		this.email_str = email_str;
		this.post_str = post_str;
		this.addr_str = addr_str;
		this.addr2_str = addr2_str;
		this.tel_str = tel_str;
		this.cel_str = cel_str;
		this.level_no = level_no;
		this.status_no = status_no;
		this.member_level = member_level;
		this.member_status = member_status;
		this.member_level_name = member_level_name;
		this.member_status_name = member_status_name;
		this.reg_date = reg_date;
		this.update_date = update_date;
		this.del_date = del_date;
		this.remote_addr_str = remote_addr_str;
	}

	public int getMember_no() {
		return member_no;
	}


	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	public String getId_str() {
		return id_str;
	}


	public void setId_str(String id_str) {
		this.id_str = id_str;
	}


	public String getPasswd_str() {
		return passwd_str;
	}


	public void setPasswd_str(String passwd_str) {
		this.passwd_str = passwd_str;
	}


	public String getName_str() {
		return name_str;
	}


	public void setName_str(String name_str) {
		this.name_str = name_str;
	}


	public String getEmail_str() {
		return email_str;
	}


	public void setEmail_str(String email_str) {
		this.email_str = email_str;
	}


	public String getPost_str() {
		return post_str;
	}


	public void setPost_str(String post_str) {
		this.post_str = post_str;
	}


	public String getAddr_str() {
		return addr_str;
	}


	public void setAddr_str(String addr_str) {
		this.addr_str = addr_str;
	}


	public String getAddr2_str() {
		return addr2_str;
	}


	public void setAddr2_str(String addr2_str) {
		this.addr2_str = addr2_str;
	}


	public String getTel_str() {
		return tel_str;
	}


	public void setTel_str(String tel_str) {
		this.tel_str = tel_str;
	}


	public String getCel_str() {
		return cel_str;
	}


	public void setCel_str(String cel_str) {
		this.cel_str = cel_str;
	}


	public int getLevel_no() {
		return level_no;
	}


	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}


	public int getStatus_no() {
		return status_no;
	}


	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}


	public MemberLevel getMember_level() {
		return member_level;
	}


	public void setMember_level(MemberLevel member_level) {
		this.member_level = member_level;
	}


	public MemberStatus getMember_status() {
		return member_status;
	}


	public void setMember_status(MemberStatus member_status) {
		this.member_status = member_status;
	}


	public String getMember_level_name() {
		return member_level_name;
	}


	public void setMember_level_name(String member_level_name) {
		this.member_level_name = member_level_name;
	}


	public String getMember_status_name() {
		return member_status_name;
	}


	public void setMember_status_name(String member_status_name) {
		this.member_status_name = member_status_name;
	}


	public String getReg_date() {
		return reg_date;
	}


	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


	public String getUpdate_date() {
		return update_date;
	}


	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}


	public String getDel_date() {
		return del_date;
	}


	public void setDel_date(String del_date) {
		this.del_date = del_date;
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
		result = prime * result + member_no;
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
		Member other = (Member) obj;
		if (member_no != other.member_no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Member [member_no=" + member_no + ", id_str=" + id_str + ", passwd_str=" + passwd_str + ", name_str="
				+ name_str + ", email_str=" + email_str + ", post_str=" + post_str + ", addr_str=" + addr_str
				+ ", addr2_str=" + addr2_str + ", tel_str=" + tel_str + ", cel_str=" + cel_str + ", level_no="
				+ level_no + ", status_no=" + status_no + ", reg_date=" + reg_date + ", update_date=" + update_date
				+ ", del_date=" + del_date + ", remote_addr_str=" + remote_addr_str + "]";
	}
	
	
}
