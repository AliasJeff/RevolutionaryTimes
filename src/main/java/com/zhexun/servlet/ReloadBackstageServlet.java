package com.zhexun.servlet;

import com.zhexun.entity.Article;
import com.zhexun.entity.User;
import com.zhexun.service.ArticleService;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.ArticleServiceImpl;
import com.zhexun.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ReloadBackstageServlet", urlPatterns = "/reloadBackstage")
public class ReloadBackstageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("test/html;charset=utf-8");

        List<User> user;
        UserService userService = new UserServiceImpl();
        user = userService.getAllUser();

        List<Article> article;
        ArticleService articleService = new ArticleServiceImpl();
        article = articleService.selectAllArticle();

        /*user*/
        req.setAttribute("bsAvatar1", user.get(0).getAvatar());
        req.setAttribute("bsAvatar2", user.get(1).getAvatar());
        req.setAttribute("bsAvatar3", user.get(2).getAvatar());
        req.setAttribute("bsAvatar4", user.get(3).getAvatar());
        req.setAttribute("bsAvatar5", user.get(4).getAvatar());

        req.setAttribute("bsUserName1", user.get(0).getUname());
        req.setAttribute("bsUserName2", user.get(1).getUname());
        req.setAttribute("bsUserName3", user.get(2).getUname());
        req.setAttribute("bsUserName4", user.get(3).getUname());
        req.setAttribute("bsUserName5", user.get(4).getUname());

        req.setAttribute("bsUserPassword1", user.get(0).getUpassword());
        req.setAttribute("bsUserPassword2", user.get(1).getUpassword());
        req.setAttribute("bsUserPassword3", user.get(2).getUpassword());
        req.setAttribute("bsUserPassword4", user.get(3).getUpassword());
        req.setAttribute("bsUserPassword5", user.get(4).getUpassword());

        req.setAttribute("bsUserIntroduce1", user.get(0).getUintroduce());
        req.setAttribute("bsUserIntroduce2", user.get(1).getUintroduce());
        req.setAttribute("bsUserIntroduce3", user.get(2).getUintroduce());
        req.setAttribute("bsUserIntroduce4", user.get(3).getUintroduce());
        req.setAttribute("bsUserIntroduce5", user.get(4).getUintroduce());

        req.setAttribute("bsUserEmail1", user.get(0).getEmail());
        req.setAttribute("bsUserEmail2", user.get(1).getEmail());
        req.setAttribute("bsUserEmail3", user.get(2).getEmail());
        req.setAttribute("bsUserEmail4", user.get(3).getEmail());
        req.setAttribute("bsUserEmail5", user.get(4).getEmail());

        req.setAttribute("bsUserBirthday1", user.get(0).getBirthday());
        req.setAttribute("bsUserBirthday2", user.get(1).getBirthday());
        req.setAttribute("bsUserBirthday3", user.get(2).getBirthday());
        req.setAttribute("bsUserBirthday4", user.get(3).getBirthday());
        req.setAttribute("bsUserBirthday5", user.get(4).getBirthday());

        req.setAttribute("bsUserAccess1", user.get(0).getAccess());
        req.setAttribute("bsUserAccess2", user.get(1).getAccess());
        req.setAttribute("bsUserAccess3", user.get(2).getAccess());
        req.setAttribute("bsUserAccess4", user.get(3).getAccess());
        req.setAttribute("bsUserAccess5", user.get(4).getAccess());

        List<String> bsAvatar = new ArrayList<>();
        List<String> bsUserName = new ArrayList<>();
        List<String> bsUserPassword = new ArrayList<>();
        List<String> bsUserIntroduce = new ArrayList<>();
        List<String> bsUserEmail = new ArrayList<>();
        List<String> bsUserBirthday = new ArrayList<>();
        List<String> bsUserAccess = new ArrayList<>();
        for (User value : user) {
            bsAvatar.add(value.getAvatar());
            bsUserName.add(value.getUname());
            bsUserPassword.add(value.getUpassword());
            bsUserIntroduce.add(value.getUintroduce());
            bsUserEmail.add(value.getEmail());
            bsUserBirthday.add(value.getBirthday());
            bsUserAccess.add(value.getAccess());
        }
        req.setAttribute("bsAvatar", bsAvatar);
        req.setAttribute("bsUserName", bsUserName);
        req.setAttribute("bsUserPassword", bsUserPassword);
        req.setAttribute("bsUserIntroduce", bsUserIntroduce);
        req.setAttribute("bsUserEmail", bsUserEmail);
        req.setAttribute("bsUserBirthday", bsUserBirthday);
        req.setAttribute("bsUserAccess", bsUserAccess);


        /*article*/
        req.setAttribute("bsAuthor1", article.get(0).getUname());
        req.setAttribute("bsAuthor2", article.get(1).getUname());
        req.setAttribute("bsAuthor3", article.get(2).getUname());
        req.setAttribute("bsAuthor4", article.get(3).getUname());
        req.setAttribute("bsAuthor5", article.get(4).getUname());

        req.setAttribute("bsArticleView", article.get(0).getView());
        req.setAttribute("bsArticleView", article.get(1).getView());
        req.setAttribute("bsArticleView", article.get(2).getView());
        req.setAttribute("bsArticleView", article.get(3).getView());
        req.setAttribute("bsArticleView", article.get(4).getView());

        req.setAttribute("bsArticleLike", article.get(0).getLike());
        req.setAttribute("bsArticleLike", article.get(1).getLike());
        req.setAttribute("bsArticleLike", article.get(2).getLike());
        req.setAttribute("bsArticleLike", article.get(3).getLike());
        req.setAttribute("bsArticleLike", article.get(4).getLike());

        req.setAttribute("bsArticleCollect", article.get(0).getCollect());
        req.setAttribute("bsArticleCollect", article.get(1).getCollect());
        req.setAttribute("bsArticleCollect", article.get(2).getCollect());
        req.setAttribute("bsArticleCollect", article.get(3).getCollect());
        req.setAttribute("bsArticleCollect", article.get(4).getCollect());

        req.setAttribute("bsArticleTitle1", article.get(0).getTitle());
        req.setAttribute("bsArticleTitle2", article.get(1).getTitle());
        req.setAttribute("bsArticleTitle3", article.get(2).getTitle());
        req.setAttribute("bsArticleTitle4", article.get(3).getTitle());
        req.setAttribute("bsArticleTitle5", article.get(4).getTitle());

        req.setAttribute("bsArticleContent1", article.get(0).getContent());
        req.setAttribute("bsArticleContent2", article.get(1).getContent());
        req.setAttribute("bsArticleContent3", article.get(2).getContent());
        req.setAttribute("bsArticleContent4", article.get(3).getContent());
        req.setAttribute("bsArticleContent5", article.get(4).getContent());

        req.setAttribute("bsArticleDate1", article.get(0).getDate());
        req.setAttribute("bsArticleDate2", article.get(1).getDate());
        req.setAttribute("bsArticleDate3", article.get(2).getDate());
        req.setAttribute("bsArticleDate4", article.get(3).getDate());
        req.setAttribute("bsArticleDate5", article.get(4).getDate());

        List<String> bsArticleTitle = new ArrayList<>();
        List<String> bsArticleContent = new ArrayList<>();
        List<Integer> bsArticleView = new ArrayList<>();
        List<Integer> bsArticleLike = new ArrayList<>();
        List<Integer> bsArticleCollect = new ArrayList<>();
        List<String> bsArticleDate = new ArrayList<>();
        for (Article value : article) {
            bsArticleTitle.add(value.getTitle());
            bsArticleContent.add(value.getTitle());
            bsArticleView.add(value.getView());
            bsArticleLike.add(value.getLike());
            bsArticleCollect.add(value.getCollect());
            bsArticleDate.add(value.getDate());
        }
        req.setAttribute("bsArticleTitle", bsArticleTitle);
        req.setAttribute("bsArticleContent", bsArticleContent);
        req.setAttribute("bsArticleView", bsArticleView);
        req.setAttribute("bsArticleLike", bsArticleLike);
        req.setAttribute("bsArticleCollect", bsArticleCollect);
        req.setAttribute("bsArticleDate", bsArticleDate);

        req.getRequestDispatcher( "/backstageForward.jsp").forward(req,resp);
    }
}
