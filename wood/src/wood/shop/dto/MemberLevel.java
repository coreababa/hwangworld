package wood.shop.dto;

public class MemberLevel {

	private int member_level_no;
	private String level_name;
	public MemberLevel() {
		// TODO Auto-generated constructor stub
	}
	private MemberLevel(int member_level_no, String level_name) {
		super();
		this.member_level_no = member_level_no;
		this.level_name = level_name;
	}
	public int getMember_level_no() {
		return member_level_no;
	}
	public void setMember_level_no(int member_level_no) {
		this.member_level_no = member_level_no;
	}
	public String getLevel_name() {
		return level_name;
	}
	public void setLevel_name(String level_name) {
		this.level_name = level_name;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + member_level_no;
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
		MemberLevel other = (MemberLevel) obj;
		if (member_level_no != other.member_level_no)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "MemberLevel [member_level_no=" + member_level_no + ", level_name=" + level_name + "]";
	}
	
	
}
