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
		
		
		.addDecoratorPath("/admin/carts/*", "/decorators/cart.jsp")
		
				.addExcludedPath("/login*");
	}
}

/*
 * .addDecoratorPath("/*", "/decorators/web.jsp")
 */
