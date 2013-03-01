package product.model;

import hibernate.util.HibernateUtil;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class ProductHibernateDAO implements ProductDAO_interface {
	private static final String GET_ALL_STMT = "from ProductVO order by p_no";

	@Override
	public void insert(ProductVO productVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(productVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(ProductVO productVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(productVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer p_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ProductVO productV = new ProductVO();
			productV.setP_no(p_no);
			session.delete(productV);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public ProductVO findByPrimaryKey(Integer p_no) {
		ProductVO ProductVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ProductVO = (ProductVO) session.get(ProductVO.class, p_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return ProductVO;
	}

	@Override
	public List<ProductVO> getAll() {
		List<ProductVO> list = null;
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

	@Override
	public List<String> findProductType(String productlist) {
		List list = new ArrayList();
		List list1 = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			Query query = session.createQuery("SELECT DISTINCT " + productlist
					+ "  FROM ProductVO");
			list1 = query.list();

			for (int i = 0; i < list1.size(); i++) {
				String aaa = list1.get(i).toString();

				list.add(aaa);
			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	public List<String> findGrapeType(String productType) {
		List list = null;

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			
			Query query = session.createQuery("SELECT DISTINCT p_grape FROM ProductVO where p_type=?");
			query.setParameter(0, productType);
			list = query.list();

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	// -------------------------------------------------------
	public static void main(String arg[]) {
		ProductHibernateDAO dao = new ProductHibernateDAO();
//		 List<String> listStyle = dao.findGrapeType("������s");
//		 for (String aEmp : listStyle) {
//		
//		 System.out.println(aEmp);
//		 }
		// �s�W
//		 ProductVO productVOO1 = new ProductVO();
//		 productVOO1.setP_name("�����ԹϮL���Q�@�Ÿ����ո���s");
//		 productVOO1.setP_year(2008);
//		 productVOO1.setP_rate(90);
//		 productVOO1.setP_area("�k�ꥬ�ڦa�L���Q");
//		 productVOO1
//		 .setP_intro("�����ԹϮL���Q�@�Ÿ����ո���s�O�ѮL���Q�@�Ÿ���餺���X�̦n���L�h������A���C�y�X�f���S�O�ӽo�M�����հs�C�����Թϰs�t�g�ѭ��C���媺�Ͳ��q�M���_�i�B���شӻP�C�y�޳N�ӽT�O�C�~����~�誺í�w�C�����ԹϮL���Q�@�Ÿ����ո���s�b���ÿ��Ѥ��o�áA�H�O�d�s�A�G���C���~�A�ʤ����ʪ��Żĵo�ùL�{�A���s���[í�w�A�f�P��[���C�a�ڥN�N�ǩӸg�窺�����Թϰs�t (Maison Louis Latour)�A�O�k�ꥬ�ڦa�B�����Ϥ��j�ۦW�s�Ӥ��@�A��1797�~�ХߥH�ӡA�@����u�ǲΩM�~��A���]�i�󭲷s�M�гy�A�H���u�}�����ڦa���B�հs�~��D�W�@�ɡA�P�ɤ]�O�Ͳ����ڦa���ϥH�~�pArd��che(���w�k)���u�踲��s�����X�C�ԹϮa�ڦ�17�@���H�ӫK�}�l�֦��P�W�[�ۦ������A�p���b���ڦa�w��50�����������A�d��C�q�_����������(Chambertin)������n�䪺���˨��C- �X���k(Chevalier-Montrachet)�A�䤤��30�������S�Ÿ����A�]�A0.8�������������B1�������J����-�t����(Romanee Saint Vivant)�B17���������n(Corton) �H�Ϊ�9���������n�d�z��(Corton-Charlemagne)�A�ìO�b���C(Cote d'Or) �֦��̤j��Ҫ��S�Ÿ���骺�s�ӡC�����ԹϩҦ����ۦ������̩ҥͲ�������A�Ҧb��ù��-���n (Aloxe-Corton)�����n�����k��(Ch��teau Corton Grancey)�̪��s���C�s�P���~�C�o�O�k��Ĥ@�Ө̥\��ʫسy���s���A�������ǲΪ��B�@�覡�A���T�u�ǲΡA�ܤ������ԹϩҦ��ۦ�����骺�s�����ϥΤH�u��֡A�t�@�S��O���s���֨ϥηs�����~�A�ӷs����h�Ω�հs�A����~��A�ϥΩ���s�A�P�Y�ǥ��ڦa�s�t�覡�ۤϡC�غذ���A�ϸ����Թϥհs�I���@�����G���P����B�d�G������A���s�h�f�P����״I�C�����Թϰs�t���\�h��L�P�����P���B�A�Ҧp�֦��ۤv������s�t�B�L��t�B��B���q�A�s�~���]���M�ΧΪ��A����ۤv������C�����ԹϦ۲ĤT�N�x���H�_�A�K�O�\�h�����Q�ڪ��̷R�A�A�b�@�ɦU�j���Ŷ����P�\�U�A�p�ھ��X�a�dù(Monte Carlo's)�����B�餺��Le Beau-Rivage�B�ھ��R������(The Paris Ritz)���s��W���ݱo������ԹϡA��a�אּ2008�~G8���p�|���w�Τ[�A�O�z���e���L�����ڦa�W�t�C");
//		 productVOO1.setP_num(85);
//		 productVOO1.setP_price(1650.0);
//		 productVOO1.setP_status("�W�[��");
//		 productVOO1.setP_winery("Chardonnay");
//		 productVOO1.setP_click_count(80);
//		 productVOO1.setP_buy_count(90);
//		 productVOO1.setP_style("�g��");
//		 productVOO1.setP_sales("RG");
//		 productVOO1.setP_vol(750);
//		 productVOO1.setP_alcho(13.0);
//		 productVOO1.setP_date(new Timestamp(new java.util.Date().getTime()));
//		 productVOO1.setP_type("�ո���s");
//		 productVOO1.setP_grape("Pinot Noir");
//		 dao.insert(productVOO1);
		// -------------------------------------------------
		// �ק�
		// ProductVO productVOO2 = new ProductVO();
		// productVOO2.setP_no(1);
		// productVOO2.setP_name("�ǥd�����äڬ��F�u�����s");
		// productVOO2.setP_year(2008);
		// productVOO2.setP_rate(80);
		// productVOO2.setP_area("�D�w");
		// productVOO2
		// .setP_intro("�o2005 Taster Guide International Wine Judging���D�n����v�ɪ֩w,�b1847�~�A�@��~�����ڥ�Q�Ȳ�������.�����]Johann Gramp�^�Ө�F�n�D���ڬ��F�e���A�b�@���W���ǥd���˯`�ؤU�F�L���Ĥ@�ʸ����C�g�L129�~��í�w�o�i�A1976�~�����H�y�ǥd���z���~�P�W�٦b���y�W���A�ɦܤ���A�C�~�W�L8�ʸU�c���X�f�q�A���ǥd�������D�w�̨��w�諸����s�t�C�C�ѡA��2�ʸU�M���ǥd������s�b�@�ɦU�a���H�̤⤤�Q�ɥΡA���u�������ǥd������`�ӤH�ߡC�Ω��èt�C������A�Ħۺ�︲��骺�G��A�C�s�v���Ӧ�Padthaway, Langhorne Creek, Coonawarra�H�ΧJ�Өਦ�a���a�ϡA�G��R�������I���@���~�ح����P�ӽo��窺����A�@���C�y���èt�C���ӷ��C���𶰤��B�@�Y�����A�b��������18-22�Ӥ�]�u�����s�^�C");
		// productVOO2.setP_num(50);
		// productVOO2.setP_price(800.0);
		// productVOO2.setP_status("�U�[��");
		// productVOO2.setP_winery("Jacob��s Creek");
		// productVOO2.setP_click_count(100);
		// productVOO2.setP_buy_count(150);
		// productVOO2.setP_style("������");
		// productVOO2.setP_sales("B");
		// productVOO2.setP_vol(750);
		// productVOO2.setP_alcho(14.5);
		// productVOO2.setP_date(new Timestamp(new java.util.Date().getTime()));
		// productVOO2.setP_type("red wine");
		// productVOO2.setP_grape("Syrah \\ Shiraz");
		// dao.update(productVOO2);
		// ---------------------------------------------
		// �R��
		// dao.delete(5);
		// ------------------------------------------------
		// �d��

		// ProductVO productVOO3 = dao.findByPrimaryKey(2);
		// System.out.println(productVOO3.getP_no() + ",");
		// System.out.println(productVOO3.getP_name() + ",");
		// System.out.println(productVOO3.getP_year() + ",");
		// System.out.println(productVOO3.getP_rate() + ",");
		// System.out.println(productVOO3.getP_area() + ",");
		// System.out.println(productVOO3.getP_intro() + ",");
		// System.out.println(productVOO3.getP_num() + ",");
		// System.out.println(productVOO3.getP_price() + ",");
		// System.out.println(productVOO3.getP_status() + ",");
		// System.out.println(productVOO3.getP_winery() + ",");
		// System.out.println(productVOO3.getP_click_count() + ",");
		// System.out.println(productVOO3.getP_buy_count() + ",");
		// System.out.println(productVOO3.getP_style() + ",");
		// System.out.println(productVOO3.getP_sales() + ",");
		// System.out.println(productVOO3.getP_vol() + ",");
		// System.out.println(productVOO3.getP_alcho() + ",");
		// System.out.println(productVOO3.getP_date() + ",");
		// System.out.println(productVOO3.getP_type() + ",");
		// System.out.println(productVOO3.getP_grape() );
		// System.out.println();
		// �d��
		List<ProductVO> list = dao.getAll();
		for (ProductVO aEmp : list) {
			System.out.println(aEmp.getP_no() + ",");
			System.out.println(aEmp.getP_name() + ",");
			System.out.println(aEmp.getP_pic() + ",");
			System.out.println(aEmp.getP_year() + ",");
			System.out.println(aEmp.getP_rate() + ",");
			System.out.println(aEmp.getP_area() + ",");
			System.out.println(aEmp.getP_intro() + ",");
			System.out.println(aEmp.getP_num() + ",");
			System.out.println(aEmp.getP_price() + ",");
			System.out.println(aEmp.getP_status() + ",");
			System.out.println(aEmp.getP_winery() + ",");
			System.out.println(aEmp.getP_click_count() + ",");
			System.out.println(aEmp.getP_buy_count() + ",");
			System.out.println(aEmp.getP_style() + ",");
			System.out.println(aEmp.getP_sales() + ",");
			System.out.println(aEmp.getP_vol() + ",");
			System.out.println(aEmp.getP_alcho() + ",");
			System.out.println(aEmp.getP_date() + ",");
			System.out.println(aEmp.getP_type() + ",");
			System.out.println(aEmp.getP_grape());
			System.out.println();
		}
	}

}
