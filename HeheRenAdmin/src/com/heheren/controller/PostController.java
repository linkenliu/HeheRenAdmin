package com.heheren.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heheren.model.Dictionarie;
import com.heheren.model.Post;
import com.heheren.service.DictionarieService;
import com.heheren.service.PostService;
import com.heheren.utils.JsonConversion;
import com.heheren.utils.QiNiu;
import com.heheren.utils.SearchEntity;

/**
 * �����б�
 * @author linken
 *
 */
@Controller
public class PostController {

	
	
	private QiNiu qiniu = new QiNiu();
	
	@Autowired
	private DictionarieService dictionarieService;
	
	
	@Autowired
	private PostService postService;
	/**
	 * ��ȡ�����б�
	 * @param modelMap
	 * @param session
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("queryPostList")
	public String queryPost(ModelMap modelMap,SearchEntity searchEntity,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postChoose", searchEntity.getPostChoose());
		map.put("keyWord", searchEntity.getKeyWord());
		List<Post> postList =  postService.list(Post.class, map);
		modelMap.addAttribute("postList", postList);
		return "/page/postList.jsp";
	}
	/**
	 * ��������UI
	 * @return
	 */
	@RequestMapping("addPostUI")
	public String addPostUI(ModelMap modelMap){
		Map<String, Object> map = new HashMap<String, Object>();
		String token = postService.getQiNiuToken(qiniu);
		List<Dictionarie> dictionarieList =  dictionarieService.list(Dictionarie.class, map);
		modelMap.addAttribute("qiuniuToken", token);
		modelMap.addAttribute("dictionarieList", dictionarieList);
		return "/page/postAdd.jsp";
	}
	/**
	 * ��������
	 * @param p      addʱ��Ҫ�Ĳ���
	 * @param response  
	 * @param request
	 * @return
	 */
	@RequestMapping("addPost")
	public String addPost(Post p,HttpServletResponse response,HttpServletRequest request){
		Date nowTime = new Date(System.currentTimeMillis());
		p.setCreateDate(nowTime);
		p.setUpdateDate(nowTime);
		p.setState(1);
		postService.add(p);
		return "redirect:/queryPostList";
	}
	/**
	 * �༭����UI
	 * @param p
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("updatePostUI")
	public String updatePostUI(int id,HttpServletRequest request,ModelMap modelMap){
		Map<String, Object> map = new HashMap<String, Object>();
		String token = postService.getQiNiuToken(qiniu);
		Post post = postService.load(Post.class, id);
		String[] pictureArr = null;
		if(post.getPicture()!=null){
			pictureArr = post.getPicture().split(",");
		}
		List<Dictionarie> dictionarieList =  dictionarieService.list(Dictionarie.class, map);
		List<Dictionarie> dictionarieList2 = dictionarieService.find(Dictionarie.class, post.getType());
		modelMap.addAttribute("qiuniuToken", token);
		modelMap.addAttribute("post", post);
		modelMap.addAttribute("pictureArr", pictureArr);
		modelMap.addAttribute("dictionarieList", dictionarieList);
		modelMap.addAttribute("dictionarieList2", dictionarieList2);
		return "/page/postUpdate.jsp";
	}
	/**
	 * �༭����
	 * @param id
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("updatePost")
	public String updatePost(Post post,HttpServletRequest request,ModelMap modelMap){
		Date nowTime = new Date(System.currentTimeMillis());
		post.setUpdateDate(nowTime);
		post.setState(1);
		postService.update(post);
		return "redirect:/queryPostList";
	}
	/**
	 * ɾ������
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("deletePost")
	public String deletePost(int id,HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		postService.delete(Post.class, map);
		return "redirect:/queryPostList";
	}
	
	/**
	 * ��ȡ��������
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("getSecondaryName")
	public String getSecondaryName(int id,HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Dictionarie> dictionarieList = dictionarieService.find(Dictionarie.class, id);
		JsonConversion.writeListJSON(dictionarieList,response);
		return null;
	}
	
	@RequestMapping("deleteQiuniuImage")
	public void deleteQiuniuImage(String qiniuKey,HttpServletRequest request,HttpServletResponse response) throws IOException{
		String info = "success";
		qiniu.setQiniuKey(qiniuKey);
		try {
			postService.deleteQiniuImage(qiniu);
		} catch (Exception e) {
			info = "failure";
			e.printStackTrace();
		}
		JsonConversion.writeObjJSON(info, response);
	}
}


