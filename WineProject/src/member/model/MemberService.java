package member.model;

import java.sql.Date;
import java.util.List;

public class MemberService {

	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}

	public MemberVO addMem(Integer m_no, String m_id, String m_name, String m_pwd, String m_mobile, String m_email, 
			Date m_bday, String m_addr, String m_pic, String m_safety_q, String m_safety_a, 
			Integer m_status) {

		MemberVO memberVO = new MemberVO();
		
		memberVO.setM_no(m_no);
		memberVO.setM_id(m_id);				
		memberVO.setM_name(m_name);
		memberVO.setM_pwd(m_pwd);
		memberVO.setM_mobile(m_mobile);
		memberVO.setM_email(m_email);
		memberVO.setM_bday(m_bday);
		memberVO.setM_addr(m_addr);
		memberVO.setM_pic(m_pic);
		memberVO.setM_safety_q(m_safety_q);
		memberVO.setM_safety_a(m_safety_a);
		memberVO.setM_status(m_status);
		
		dao.insert(memberVO);
		
		return memberVO;
	}

	public MemberVO updateMem(Integer m_no, String m_id, String m_name, String m_pwd, String m_mobile, String m_email, 
			Date m_bday, String m_addr, String m_pic, String m_safety_q, String m_safety_a, 
			Integer m_status) {

		MemberVO memberVO = new MemberVO();
		
		memberVO.setM_no(m_no);
		memberVO.setM_id(m_id);				
		memberVO.setM_name(m_name);
		memberVO.setM_pwd(m_pwd);
		memberVO.setM_mobile(m_mobile);
		memberVO.setM_email(m_email);
		memberVO.setM_bday(m_bday);
		memberVO.setM_addr(m_addr);
		memberVO.setM_pic(m_pic);
		memberVO.setM_safety_q(m_safety_q);
		memberVO.setM_safety_a(m_safety_a);
		memberVO.setM_status(m_status);
		
		dao.update(memberVO);

		return dao.findByPrimaryKey(m_no);
	}

	public void deleteMem(Integer m_no) {
		dao.delete(m_no);
	}

	public MemberVO getOneMem(Integer m_no) {
		return dao.findByPrimaryKey(m_no);
	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}
}
