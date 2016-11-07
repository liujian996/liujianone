package com.ms.msspace.video.daoimpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.ms.msspace.user.entity.Users;
import com.ms.msspace.util.DateConverter;
import com.ms.msspace.util.JDBCUtil;
import com.ms.msspace.util.PagerUtil;
import com.ms.msspace.video.dao.VideoDao;
import com.ms.msspace.video.entity.Videos;

import javafx.scene.chart.PieChart.Data;

public class VideoDaoImpl implements VideoDao {
	private QueryRunner qr = new QueryRunner();
	private Connection conn = JDBCUtil.getConnection();

	// 上传视频
	public int videoUpload(Videos videos) {
		int r = 0;
		String sql = "insert into video (video_ID,title,[type],introduction,videoname,videoimg,videouserid) values (? ,? ,? ,? ,? ,? ,?)";

		Object[] params = { videos.getVideo_ID(), videos.getTitle(), videos.getType(), videos.getIntroduction(),
				videos.getVideoname(), videos.getVideoimg(), videos.getUsers().getUser_ID() };

		try {
			r = qr.update(conn, sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return r;
	}

	// 搜索视频
	@Override
	public List<Videos> findVideos(String keyword) {
		String sql = "select top(8)title from video where title like '%" + keyword + "%' ";
		List<Videos> listVideos = null;
		try {
			listVideos = qr.query(conn, sql, new BeanListHandler<Videos>(Videos.class));
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return listVideos;
	}

	// 遍历视频
	@Override
	public PagerUtil<Videos> queryVideos(int cpage, int conuts) {
		PagerUtil<Videos> pu = page(cpage, conuts);
		return pu;
	}

	// 通过id找用户
	@Override
	public Users queryUsersById(String usersid) {
		String sql = "select * from users where user_ID = ?";
		Users users = null;
		try {
			users = qr.query(conn, sql, new BeanHandler<Users>(Users.class), usersid);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return users;
	}

	// 模糊查询
	@Override
	public PagerUtil<Videos> likeVideos(int cpage, int conuts, String keyWord) {
		PagerUtil<Videos> pu = new PagerUtil<Videos>();

		String sql = "select count(*) from video where type like '%" + keyWord + "%'";
		int r = 0;
		try {
			r = ((Number) qr.query(conn, sql, new ScalarHandler())).intValue();
			System.out.println("r" + r);
		} catch (SQLException e1) {

			e1.printStackTrace();
		}

		// (当前页数-1)*每页记录数+1-->模糊查询
		String sqls = "select * from (select *, ROW_NUMBER() OVER(Order by a.video_ID asc) AS RowNumber from video as a where type like '%"
				+ keyWord + "%') as b where  b.RowNumber BETWEEN " + ((cpage - 1) * conuts + 1) + " and "
				+ (cpage * conuts) + "";
		List<Videos> th = null;
		try {
			th = qr.query(conn, sqls, new BeanListHandler<Videos>(Videos.class));

		} catch (SQLException e) {
			e.printStackTrace();
		}

		ConvertUtils.register(new DateConverter(), Data.class);

		pu.setTotalConut(r); // 总记录数
		pu.setData(th); // 视频信息
		System.out.println("th " + th);

		pu.setCurrentPage(cpage);// 当前页
		pu.setPageConut(conuts); // 每一页的记录数

		return pu;
	}

	public PagerUtil<Videos> likeVideo(int cpage, int conuts, String keyWord){
		PagerUtil<Videos> pu = new PagerUtil<Videos>();
			
			
			String sql = "select count(*) from video where title like '%"+keyWord+"%'";
			int r = 0;
			try {
				r = ((Number) qr.query(conn, sql, new ScalarHandler())).intValue();
				System.out.println("r"+r);
				pu.setTotalConut(r); // 总记录数
			} catch (SQLException e1) {

				e1.printStackTrace();
			}

			// (当前页数-1)*每页记录数+1-->模糊查询
			String sqls = "select * from (select *, ROW_NUMBER() OVER(Order by a.video_ID asc) AS RowNumber from video as a where title like '%"+keyWord+"%') as b where  b.RowNumber BETWEEN "
					+ ((cpage - 1) * conuts + 1) + " and " + (cpage * conuts) + "";
			List<Videos> th = null;
			try {
				th = qr.query(conn, sqls, new BeanListHandler<Videos>(Videos.class));
				pu.setData(th); 	//视频信息
				for (Videos v : th) {
					System.out.println(v.getTitle());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			ConvertUtils.register(new DateConverter(), Data.class);
			
			pu.setCurrentPage(cpage);// 当前页
			pu.setPageConut(conuts); // 每一页的记录数
			
			
			
			return pu ;
		}

	// 分页
	private PagerUtil<Videos> page(int cpage, int conuts) {
		PagerUtil<Videos> pu = new PagerUtil<Videos>();

		// 查询出所有的热点话题信息
		String sql = "select count(*) from video";
		int r = 0;
		try {
			r = ((Number) qr.query(conn, sql, new ScalarHandler())).intValue();
		} catch (SQLException e1) {

			e1.printStackTrace();
		}

		// (当前页数-1)*每页记录数+1
		String sqls = "select * from (select *, ROW_NUMBER() OVER(Order by a.Release desc) AS RowNumber from video as a ) as b where b.RowNumber BETWEEN "
				+ ((cpage - 1) * conuts + 1) + " and " + (cpage * conuts) + "";
		List<Videos> th = null;
		try {
			th = qr.query(conn, sqls, new BeanListHandler<Videos>(Videos.class));

		} catch (SQLException e) {
			e.printStackTrace();
		}

		ConvertUtils.register(new DateConverter(), Data.class);

		pu.setTotalConut(r); // 总记录数
		pu.setData(th); // 视频信息
		pu.setCurrentPage(cpage);// 当前页
		pu.setPageConut(conuts); // 每一页的记录数

		return pu;
	}

	// 通过视频的ID获取该视频的所有信息
	@Override
	public Videos queryVideoById(String videoID) {
		String sql = "select * from video where video_ID = ? ";
		Videos video = null;
		try {
			video = qr.query(conn, sql, new BeanHandler<Videos>(Videos.class), videoID);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return video;
	}
}