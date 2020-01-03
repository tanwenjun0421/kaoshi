package k9509.controller.user;

import com.github.pagehelper.PageInfo;
import k9509.Service.DemoService;
import k9509.domain.Category;
import k9509.domain.CategoryId;
import k9509.domain.Entry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MyController {

    @Autowired
    private DemoService demoService;

    @RequestMapping("/list")
    public ModelAndView list(ModelAndView mv, @RequestParam(defaultValue = "1") Integer pageNum,
                             CategoryId categoryid, HttpSession session){
        PageInfo pageInfo = demoService.findByCategoryId(categoryid, pageNum, 4);
        List<Category> categoryList = demoService.findAllCategory();
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("categoryid",categoryid);
        session.setAttribute("categoryList",categoryList);
        mv.setViewName("main");
        return mv;
    }

    @RequestMapping("/add")
    public ModelAndView add(ModelAndView mv, Entry entry){
        boolean b = demoService.addEntry(entry);
        if (b){
           mv.addObject("add","success");
        }else{
            mv.addObject("add","failure");
        }
        //        mv.setViewName("main");
        mv.setViewName("forward:list");
        return mv;
    }

    @RequestMapping("modify")
    public ModelAndView modify(ModelAndView mv,Integer id){
        Entry entry = demoService.findById(id);
        mv.addObject("entry",entry);
        mv.setViewName("update");
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView update(ModelAndView mv, Entry entry){
        boolean b = demoService.updateEntryByEntry(entry);
        if (b){
            mv.addObject("update","success");
        }else{
            mv.addObject("update","failure");
        }
//        mv.setViewName("main");
        mv.setViewName("forward:list");

        return mv;
    }

    @RequestMapping("delEntry")
    public ModelAndView delEntry(ModelAndView mv,Integer id){
        boolean b = demoService.delete(id);
        if (b){
            mv.addObject("del","success");
        }else{
            mv.addObject("del","failure");
        }
        mv.setViewName("forward:list");
        return mv;
    }
}
