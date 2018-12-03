package Hisign.Service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Hisign.Service.FeedbackService;
import Hisign.dao.FeedbackDao;
import Hisign.entity.FeedbackInfor;
@Service
public class FeedbackServiceImpl implements FeedbackService{

	@Autowired
	private FeedbackDao feedbackDao;
	@Override
	public List<FeedbackInfor> Insert(FeedbackInfor feedback) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FeedbackInfor> Recive(String searchname) {
		// TODO Auto-generated method stub
		return feedbackDao.Recive(searchname);
	}

	@Override
	public List<FeedbackInfor> Backing(String searchname) {
		// TODO Auto-generated method stub
		return feedbackDao.Backing(searchname);
	}

	@Override
	public List<FeedbackInfor> Find(String searchname) {
		// TODO Auto-generated method stub
		return feedbackDao.Find(searchname);
	}

	@Override
	public List<FeedbackInfor> toBakcontent(FeedbackInfor feedback) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FeedbackInfor> toRating(FeedbackInfor feedback) {
		// TODO Auto-generated method stub
		return null;
	}

}
