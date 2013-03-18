package discussion.model;

import java.util.*;

	public interface DiscussionDAO_interface {
    public void insert(DiscussionVO discussionVO);
    public void update(DiscussionVO discussionVO);
    public void delete(Integer d_no);
    public DiscussionVO findByPrimaryKey(Integer d_no);
    public List<DiscussionVO> getAll();
    public List<DiscussionVO> getAllMananger();
//    public Integer findTotalNOofDiscussion();
    Set<DiscussionVO> search(String srchThing, String txtsrch);
}

	
	