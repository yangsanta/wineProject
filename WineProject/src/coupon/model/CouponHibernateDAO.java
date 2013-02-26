package coupon.model;

import hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class CouponHibernateDAO implements CouponDAO_interface {

	private static final String GET_ALL_STMT = "from CouponVO order by c_key";

	@Override
	public void insert(CouponVO couponVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(couponVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(CouponVO couponVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(couponVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(String c_key) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			// �i���ɦh��(�y)�i�ĥ�HQL�R���j
			// Query query =
			// session.createQuery("delete CouponVO where empno=?");
			// query.setParameter(0, empno);
			// System.out.println("�R��������=" + query.executeUpdate());

			// �i�Φ��ɦh��(�])�i�ĥΥh�����p���Y��A�A�R�����覡�j
			CouponVO couponVO = new CouponVO();
			couponVO.setC_key(c_key);
			session.delete(couponVO);

			// �i���ɦh�褣�i(���y)�ĥ�cascade�p�ŧR���j
			// �i�h��emp2.hbm.xml�p�G�]�� cascade="all"��
			// cascade="delete"�N�|�R���Ҧ��������-�]�A���ݳ����P�P�������䥦���u�N�|�@�ֳQ�R���j
			// CouponVO couponVO = (CouponVO) session.get(CouponVO.class,
			// empno);
			// session.delete(couponVO);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public CouponVO findByPrimaryKey(String c_key) {
		CouponVO couponVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			couponVO = (CouponVO) session.get(CouponVO.class, c_key);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return couponVO;
	}

	@Override
	public List<CouponVO> getAll() {
		List<CouponVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	public static void main(String[] args) {

		CouponHibernateDAO dao = new CouponHibernateDAO();

		
		Long time = new java.util.Date().getTime();
		
		// �� �s�W 							OK!!!!

//		 CouponVO couponVO1 = new CouponVO();
//		 couponVO1.setC_key("AAA2");
//		 couponVO1.setC_price(999);
//		 couponVO1.setC_deadline(new java.sql.Timestamp(new java.util.Date().getTime()));
//		 couponVO1.setC_status(true);
//		 dao.insert(couponVO1);

		// �� �ק� 													OK!!
//		 CouponVO couponVO2 = new CouponVO();
//		 couponVO2.setC_key("AAA2");
//		 couponVO2.setC_price(999);
//		 couponVO2.setC_status(true);
//		 couponVO2.setC_deadline(new java.sql.Timestamp(new java.util.Date().getTime()));  //java.sql.Timestamp.valueOf("2013-11-12 20:11:20")
//		 dao.update(couponVO2);

		// �� �R��											OK!!!!!!!!
		 dao.delete("AAAAAAAAAAAAAA1");

		// �� �d��-findByPrimaryKey 							OK!!!!!!!!!
//		 CouponVO couponVO3 = dao.findByPrimaryKey("AAA2");
//		 System.out.print(couponVO3.getC_key() + ",");
//		 System.out.print(couponVO3.getC_price() + ",");
//		 System.out.print(couponVO3.getC_status() + ",");
//		 System.out.print(couponVO3.getC_deadline());
//		 System.out.println();

		// ?!!!!!!!!!!!!!!!!!�� �d��-getAll (�h��emp2.hbm.xml�����]��lazy="false")(�u!)
		List<CouponVO> list = dao.getAll();
		for (CouponVO aCoupon : list) {
			System.out.print(aCoupon.getC_key() + ",");
			System.out.print(aCoupon.getC_price() + ",");
			System.out.print(aCoupon.getC_status() + ",");
			System.out.print(aCoupon.getC_deadline());
			System.out.println();
		}
	}

}
