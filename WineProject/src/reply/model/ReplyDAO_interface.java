package reply.model;

import java.util.*;


	public interface ReplyDAO_interface {
    public void insert(ReplyVO replyVO);
    public void update(ReplyVO replyVO);
    public void delete(Integer r_no);
    public ReplyVO findByPrimaryKey(Integer r_no);
    public List<ReplyVO> getAll();
}
