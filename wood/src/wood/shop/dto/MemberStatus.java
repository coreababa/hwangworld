package wood.shop.dto;

public class MemberStatus {
	private int member_status_no;
	private String status_name;

	public MemberStatus() {
		// TODO Auto-generated constructor stub
	}

	public MemberStatus(int member_status_no, String status_name) {
		super();
		this.member_status_no = member_status_no;
		this.status_name = status_name;
	}

	public int getMember_status_no() {
		return member_status_no;
	}

	public void setMember_status_no(int member_status_no) {
		this.member_status_no = member_status_no;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + member_status_no;
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
		MemberStatus other = (MemberStatus) obj;
		if (member_status_no != other.member_status_no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemberLevel [member_status_no=" + member_status_no + ", status_name=" + status_name + "]";
	}
}
