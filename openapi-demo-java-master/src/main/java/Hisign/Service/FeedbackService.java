package Hisign.Service;

import java.util.List;

import Hisign.entity.FeedbackInfor;

public interface FeedbackService {
	 public List<FeedbackInfor> Insert(FeedbackInfor feedback);
	 public List<FeedbackInfor> Recive(String searchname);
	 public List<FeedbackInfor> Backing(String searchname);
	 public List<FeedbackInfor> Find(String searchname);
	 public List<FeedbackInfor> toBakcontent(FeedbackInfor feedback);
	 public List<FeedbackInfor> toRating(FeedbackInfor feedback);
}
