package trg.talentsprint.starterkit.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.annotation.Generated;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;

import trg.talentsprint.starterkit.model.CartLineItem;
import trg.talentsprint.starterkit.model.Customer;
import trg.talentsprint.starterkit.model.Invoice;
import trg.talentsprint.starterkit.model.MyCartOrder;
import trg.talentsprint.starterkit.model.Product;

import trg.talentsprint.starterkit.model.User;
import trg.talentsprint.starterkit.service.CartLineItemService;
import trg.talentsprint.starterkit.service.CustomerService;
import trg.talentsprint.starterkit.service.InvoiceService;
import trg.talentsprint.starterkit.service.MyCartOrderService;
import trg.talentsprint.starterkit.service.ProductService;
import trg.talentsprint.starterkit.service.SecurityService;
import trg.talentsprint.starterkit.service.UserService;
import trg.talentsprint.starterkit.validator.UserValidator;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
 
    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    
    @Autowired
	private ProductService productService;

    @Autowired
	private CustomerService customerservice;
    
    @Autowired
	private MyCartOrderService mycartOrderService;

    @Autowired
    private InvoiceService invoiceService;
    
    @Autowired
    private CartLineItemService cartlineitemService;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping({"/","/welcome"})
    public String welcome(Model model) {
        return "welcome";
    }
    
  
    
    @RequestMapping("/c")
	public ModelAndView createCustomer() {
		ModelAndView model = new ModelAndView();

		Customer customer = new Customer();
		model.addObject("customerForm", customer);
		model.setViewName("customer");
        //session.invalidate();
		return model;
	}
    
    @RequestMapping("/p")
	public ModelAndView createProduct() {
		ModelAndView model = new ModelAndView();

//Product product = new Product();
		model.addObject("PostForm", new Product());
		model.setViewName("product");

		return model;
	}

	@RequestMapping("/savep")
	public String AddProduct(@ModelAttribute("PostForm") Product product, Model model, BindingResult bindingResult) {
		product.setQuantityavailable(product.getQuantitesreceived());
		productService.saveMyProduct(product);
		return "redirect:/productslist";
	}
	
	@GetMapping("/productslist")
	public String registerProduct(ModelMap model) {
		List<Product> p = productService.findAll();
		model.addAttribute("p", p);
		return "productlist";
	}
    
	@GetMapping("/productsinvlist")
	public String showavailableProduct(ModelMap model) {
		List<Product> p = productService.findAllAvailableProducts();
		model.addAttribute("p", p);
		return "productavailablelist";
	}
    
    @PostMapping("/savec")
	public String addCustomer(@ModelAttribute("customerForm") Customer customer, Model model) {
		model.addAttribute("c", customer);

		customerservice.saveMyCustomer(customer);

		return "customerlist";
	}
   
    @GetMapping("/order")
    public ModelAndView order(HttpServletRequest request,HttpSession session ) {
    	List<Product> pl = new ArrayList<>();
    	ModelAndView model = new ModelAndView();
		int cid = Integer.parseInt(request.getParameter("cid"));
	    session.setAttribute("cid", cid);
		Customer c = customerservice.getByCustomerId(cid);
		CartLineItem cl = new CartLineItem();
    	
    	model.addObject("PostForm", cl);
		model.addObject("cid", cid);

    	
    	model.setViewName("order");
        return model;
    }
    
    @RequestMapping(value = "/productNamesAutocomplete", method = RequestMethod.GET)
	@ResponseBody
	public List<String> search(HttpServletRequest request) throws Exception {
		return productService.search(request.getParameter("term"));
	}
    
    
    @GetMapping("/go")
	public ModelAndView fav(@RequestParam(name="Product_Name") String productname, HttpServletRequest request,HttpSession session) {
	    ModelAndView model = new ModelAndView();
		Product p = productService.findbyProductname(productname);
		CartLineItem cl = new CartLineItem();
		cl.setProduct(p);
		
	    model.addObject("PostForm", cl);
    	model.setViewName("order");
        return model;
		}
    
  
    
    @PostMapping("/addproduct")
    public ModelAndView AddProduct(@ModelAttribute("PostForm") CartLineItem cartlineitem, HttpSession session, HttpServletRequest request) {
    	ModelAndView model = new ModelAndView();
    	List<CartLineItem> clist= null;
    	List<Integer> itemp = null;
    	int totAmount = 0;
    	
    	if(session.getAttribute("clistitems") == null) {
      	  clist = new ArrayList<>();
      	  itemp = new ArrayList<>();
    	} else {
    		clist = (List<CartLineItem>) session.getAttribute("clistitems");
    		itemp = (List<Integer>) session.getAttribute("itemplist");
    		for(int ip: itemp) {
    			totAmount += ip;
    		}
    	}
    	
    	
    	MyCartOrder mc = new MyCartOrder();
    	
    	
    	int cid = (Integer) session.getAttribute("cid");
		Customer c = customerservice.getByCustomerId(cid);
		session.setAttribute("customer", c);
    	mc.setCust(c);
   
    	int q = cartlineitem.getQuantitysold();
	    session.setAttribute("q", q);
	    
	    cartlineitem.setQuantitysold(q);
	    cartlineitem.getProduct().setQuantityavailable(cartlineitem.getProduct().getQuantityavailable()-q);
        
	    int itemprice = cartlineitem.getItemprice();
	    itemp.add(itemprice);
	    totAmount += itemprice;
	    cartlineitem.setItemprice(itemprice);
        //cl.setProduct(product);
        
        clist.add(cartlineitem);
        productService.saveMyProduct(cartlineitem.getProduct());
        cartlineitemService.saveMyCartLineItem(cartlineitem);
       
        
        session.setAttribute("cl", cartlineitem);
        session.setAttribute("clistitems", clist);
        session.setAttribute("itemplist", itemp);
        session.setAttribute("ta", totAmount);

    	model.addObject("PostTableForm",cartlineitem);
    	model.setViewName("order");
		
    	return model;
    	
    }
    
  
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html", value = "/generateinvoice")
    @ResponseBody
    public String invoice(HttpSession session)
    {
    	
    	
      final Invoice invoice = invoiceService.generateInvoice();
      int cid = (Integer) session.getAttribute("cid");
		Customer c = customerservice.getByCustomerId(cid);
      invoiceService.saveInvoice(invoice);
      String invcode = invoice.getCode();
      session.setAttribute("invcode", invcode);
      session.setAttribute("invoice", invoice);
      
      
      MyCartOrder mc = new MyCartOrder();
  	mc.setCartlineitemslist((List<CartLineItem>)session.getAttribute("clistitems"));
  	mc.setCust(c);
  	mc.setTotalAmount((int)session.getAttribute("ta"));
  	mc.setInvoice(invoice);
  	mycartOrderService.save(mc);
  	invoice.setCart(mc);
  	invoiceService.saveInvoice(invoice);
  	//System.out.println(invoice);
     return "<!DOCTYPE html>"
          + "<html>"
          + "  <head>"
          + "    <title>Invoice Generator</title>"
          + "    <style>"
          + "      body, html { background:#EEE; color:#333; font-family:Arial; font-size:12px; height:100%; margin:0; padding:0; width:100%; }"
          + "      #container { background:#FFF; margin:0 30px; min-height:100%; padding:40px; }"
          + "    </style>"
          + "  </head>"
          + "  <body>"
          + "    <div id='container'>"
          + "<h1>" + "Order has been submitted and invoice number is Generated. Please click the number to see the details" + "</h1>" + "<br>"
          + "<h1>" + "<a href=\"invoice\">" + invoice.getCode()  +  "</a>" + "</h1>"
          + "    </div>"
          + "  </body>"
          + "</html>";
    }
    
    @SuppressWarnings("unchecked")
	@GetMapping("/invoice")
    public String invoice(Model model, HttpSession session) {
    	
    	List<CartLineItem> clist= (List<CartLineItem>) session.getAttribute("clistitems");
    	model.addAttribute("clistitems",clist);
        return "invoice";
    }
    
    @GetMapping("/saleslist")
	public String showSalesOrdersList(ModelMap model) {
		List<MyCartOrder> cartlist = mycartOrderService.findall();
		
		model.addAttribute("cart", cartlist);
		return "salesn";
	}
    
    
    @GetMapping("/invoicep")
    public String printInvoice(Model model, HttpSession session) {
    	
	
		Customer c = (Customer) session.getAttribute("customer");
    	List<CartLineItem> clist= (List<CartLineItem>) session.getAttribute("clistitems");
    	String invcode =  (String) session.getAttribute("invcode");
    	int ta = (int)session.getAttribute("ta");
    	
    	model.addAttribute("clistitems",clist);
    	model.addAttribute("invcode",invcode);
    	model.addAttribute("ta",ta);
    	model.addAttribute("c",c);
    	session.invalidate();
    	return "invoiceprint";
    
    }
    
   /* @RequestMapping(value="saleslist/{min}/{max}", method=RequestMethod.GET)
	 public String search(ModelMap model,@PathVariable("min") String min,@PathVariable("max") String max){
			 List<MyCartOrder> cart = mycartOrderService.search(Integer.parseInt(min), Integer.parseInt(max));
			 //System.out.println(cart);
			 model.addAttribute("cart", cart);
			 return "salesn";
		 
    }*/
    
    @RequestMapping(value="pricesearch", method=RequestMethod.GET)
	 public String search(ModelMap model,@RequestParam(name="min_price") String min,@RequestParam(name="max_price") String max){
			 List<MyCartOrder> cart = mycartOrderService.search(Integer.parseInt(min), Integer.parseInt(max));
			 model.addAttribute("cart", cart);
			 return "salesn";
		 
   }
    
    @RequestMapping(value="datesearch", method=RequestMethod.GET)
	 public String searchOrdersBetweenDates(ModelMap model,@RequestParam(name="min_date") String mindate,@RequestParam(name="max_date") String maxdate) throws ParseException{
    	Date format = new SimpleDateFormat("yyyy-MM-dd").parse(mindate);
    	Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(maxdate);
			List<MyCartOrder> cart = mycartOrderService.searchOrdersBetweenDates(format,format1);
			 model.addAttribute("cart", cart);
			 return "salesn";
		 
  }

    
/*	/* It opens the products list for the given page id
	@RequestMapping(value="/productslist/{pageid}")  
    public ModelAndView edit(@PathVariable int pageid){  
        int total=5;  
        if(pageid==1){}  
        else{  
            pageid=(pageid-1)*total+1;  
        }  
        List<Product> list=productService.getStudentsByPage(pageid,total);  
          
        return new ModelAndView("productslist","list",list);  
    }*/
	
	/* It opens the record for the given id in editproduct page */
	 @RequestMapping(value="/editproduct/{productid}")  
	    public ModelAndView edit(@PathVariable int productid){  
			ModelAndView model = new ModelAndView();

	       Product product=productService.findById(productid); 
	      // model.addAttribute("product", product);
	       model.addObject("PostForm", product);
			model.setViewName("editproduct");

			return model;
	        
	        
	    } 
	 
	 /* It updates record for the given id in editproduct page and redirects to /productslist */  
	 @RequestMapping(value="/editsavep",method = RequestMethod.POST)  
	    public ModelAndView editsave(@ModelAttribute("PostForm") Product prod, Model model, BindingResult bindingResult){  
	    	productService.saveMyProduct(prod); 
	        return new ModelAndView("redirect:/productslist");  
	    }  
	/* 
	 /* It deletes record for the given id  and redirects to /productslist   
	    @RequestMapping(value="/deleteproduct/{productid}",method = RequestMethod.GET)  
	    public ModelAndView delete(@PathVariable int productid){ 
	    	Product p = productService.findById(productid);
	    	System.out.println(p);
	    	productService.delete(p);  
	        return new ModelAndView("redirect:/productslist");  
	    }  
	    
	    /* It deletes all records in product table and redirects to /p  
	    @RequestMapping(value="/delete",method = RequestMethod.GET)  
	    public ModelAndView delete(){  
	    	productService.deleteAll();  
	        return new ModelAndView("redirect:/p");  
	    }  */
   
    
	
}
