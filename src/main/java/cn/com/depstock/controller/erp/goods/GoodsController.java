package cn.com.depstock.controller.erp.goods;

import cn.com.depstock.controller.base.BaseController;
import cn.com.depstock.entity.Page;
import cn.com.depstock.service.erp.goods.GoodsManager;
import cn.com.depstock.service.erp.spbrand.SpbrandManager;
import cn.com.depstock.service.erp.sptype.SptypeManager;
import cn.com.depstock.service.erp.spunit.SpunitManager;
import cn.com.depstock.service.information.pictures.PicturesManager;
import cn.com.depstock.service.system.fhlog.FHlogManager;
import cn.com.depstock.util.*;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 说明：商品管理
 */
@Controller
@RequestMapping(value = "/goods")
public class GoodsController extends BaseController {

    String menuUrl = "goods/list.do"; //菜单地址(权限用)
    @Resource(name = "goodsService")
    private GoodsManager goodsService;
    @Resource(name = "picturesService")
    private PicturesManager picturesService;
    @Resource(name = "spbrandService")
    private SpbrandManager spbrandService;
    @Resource(name = "sptypeService")
    private SptypeManager sptypeService;
    @Resource(name = "spunitService")
    private SpunitManager spunitService;
    @Resource(name = "fhlogService")
    private FHlogManager FHLOG;

    /**
     * 打开上传EXCEL页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goUploadExcel")
    public ModelAndView goUploadExcel() throws Exception {
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("erp/goods/uploadexcel");
        return mv;
    }

    /**
     * 下载模版
     *
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/downExcel")
    public void downExcel(HttpServletResponse response) throws Exception {
        FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "Goods.xls", "商品列表.xls");
    }

    /**
     * 从EXCEL导入到数据库
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/readExcel")
    public ModelAndView readExcel(
            @RequestParam(value = "excel", required = false) MultipartFile file
    ) throws Exception {
        FHLOG.save(Jurisdiction.getUsername(), "从EXCEL导入到数据库");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        }

        if (null != file && !file.isEmpty()) {
            String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;
            String fileName = FileUpload.fileUp(file, filePath, "goodsexcel");
            List<PageData> listPd = (List) ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);
            for (int i = 0; i < listPd.size(); i++) {
                pd.put("GOODS_ID", this.get32UUID());
                pd.put("ZCOUNT", 0);
                pd.put("USERNAME", Jurisdiction.getUsername());
                pd.put("TITLE", listPd.get(i).getString("var0"));
                pd.put("BIANMA", listPd.get(i).getString("var1"));
                pd.put("SPBRAND_ID", spbrandService.findByName(listPd.get(i).getString("var2")).getString("SPBRAND_ID"));
                pd.put("GOODS_COLOR", listPd.get(i).getString("var3"));
                pd.put("GOODS_SIZE", listPd.get(i).getString("var4"));
                pd.put("SPTYPE_ID", sptypeService.findByName(listPd.get(i).getString("var5")).getString("SPTYPE_ID"));
                pd.put("SPUNIT_ID", spunitService.findByName(listPd.get(i).getString("var6")).getString("SPUNIT_ID"));
                pd.put("DESCRIPTION", listPd.get(i).getString("var7"));
                pd.put("SHORTDESC", listPd.get(i).getString("var8"));
                goodsService.save(pd);
            }
            mv.addObject("msg", "success");
        }
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 保存
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/save")
    public ModelAndView save() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "新增Goods");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("GOODS_ID", this.get32UUID());    //主键
        pd.put("ZCOUNT", 0);                    //库存
        pd.put("USERNAME", Jurisdiction.getUsername());    //用户名
        goodsService.save(pd);
        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 删除
     *
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "删除Goods");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
            return null;
        } //校验权限
        Map<String, String> map = new HashMap<String, String>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String errInfo = "success";
        //当商品下面有图片 或者 此商品已经上架 或者 库存不为0时 不能删除
        if (Integer.parseInt(picturesService.findCount(pd).get("zs").toString()) > 0 || Integer.parseInt(goodsService.findById(pd).get("ZCOUNT").toString()) > 0) {
            errInfo = "false";
        } else {
            goodsService.delete(pd);
        }
        map.put("result", errInfo);
        return AppUtil.returnObject(new PageData(), map);
    }

    /**
     * 修改
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/edit")
    public ModelAndView edit() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "修改Goods");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        goodsService.edit(pd);
        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 列表
     *
     * @param page
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(Page page) throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "列表Goods");
        //if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");                //关键词检索条件
        if (null != keywords && !"".equals(keywords)) {
            pd.put("keywords", keywords.trim());
        }
        pd.put("USERNAME", "admin".equals(Jurisdiction.getUsername()) ? "" : Jurisdiction.getUsername());
        page.setPd(pd);
        List<PageData> varList = goodsService.list(page);    //列出Goods列表
        List<PageData> spbrandList = spbrandService.listAll(Jurisdiction.getUsername());    //品牌列表
        List<PageData> sptypeList = sptypeService.listAll(Jurisdiction.getUsername());        //类别列表
        List<PageData> spunitList = spunitService.listAll(Jurisdiction.getUsername());        //计量单位列表
        mv.setViewName("erp/goods/goods_list");
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        mv.addObject("spbrandList", spbrandList);
        mv.addObject("sptypeList", sptypeList);
        mv.addObject("spunitList", spunitList);
        mv.addObject("QX", Jurisdiction.getHC());    //按钮权限
        return mv;
    }

    /**
     * 去新增页面
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/goAdd")
    public ModelAndView goAdd() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> spbrandList = spbrandService.listAll(Jurisdiction.getUsername());    //品牌列表
        List<PageData> sptypeList = sptypeService.listAll(Jurisdiction.getUsername());        //类别列表
        List<PageData> spunitList = spunitService.listAll(Jurisdiction.getUsername());        //计量单位列表
        mv.setViewName("erp/goods/goods_edit");
        mv.addObject("msg", "save");
        mv.addObject("pd", pd);
        mv.addObject("spbrandList", spbrandList);
        mv.addObject("sptypeList", sptypeList);
        mv.addObject("spunitList", spunitList);
        return mv;
    }

    /**
     * 去修改页面
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/goEdit")
    public ModelAndView goEdit() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd = goodsService.findById(pd);    //根据ID读取
        List<PageData> spbrandList = spbrandService.listAll(Jurisdiction.getUsername());    //品牌列表
        List<PageData> sptypeList = sptypeService.listAll(Jurisdiction.getUsername());        //类别列表
        List<PageData> spunitList = spunitService.listAll(Jurisdiction.getUsername());        //计量单位列表
        mv.setViewName("erp/goods/goods_edit");
        mv.addObject("msg", "edit");
        mv.addObject("pd", pd);
        mv.addObject("spbrandList", spbrandList);
        mv.addObject("sptypeList", sptypeList);
        mv.addObject("spunitList", spunitList);
        return mv;
    }

    /**
     * 去查看商品页面
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/goView")
    public ModelAndView goView() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd = goodsService.findByIdToCha(pd);    //根据ID读取
        mv.setViewName("erp/goods/goods_view");
        mv.addObject("msg", "edit");
        mv.addObject("pd", pd);
        return mv;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
    }
}
