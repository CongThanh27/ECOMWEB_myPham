package vn.iotstar.Config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CustomSiteMeshFileter extends ConfigurableSiteMeshFilter {

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/product/user", "/decorators/cate.jsp")
		.addDecoratorPath("/", "/decorators/home.jsp")
		.addDecoratorPath("/product/user/list/*", "/decorators/detail.jsp")
		.addDecoratorPath("/product/*", "/decorators/cate.jsp")
		.addDecoratorPath("/user/cart/*", "/decorators/cart.jsp")
		.addDecoratorPath("/user/cart/Order", "/decorators/delivery.jsp")
		.addDecoratorPath("/admin/*", "/decorators/admin.jsp")
		.addDecoratorPath("/user/cart/AddThongTin", "/decorators/cart.jsp")
		.addDecoratorPath("/admin/carts/*", "/decorators/cart.jsp")
		.addDecoratorPath("/user/*", "/decorators/login.jsp")
		
		
				.addExcludedPath("/login*");
	}
}

/*
 * .addDecoratorPath("/*", "/decorators/web.jsp")
 */
