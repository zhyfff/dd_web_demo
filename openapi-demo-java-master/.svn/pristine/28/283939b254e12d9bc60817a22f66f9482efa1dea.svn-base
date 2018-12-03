package Hisign.authority;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * 建立表示权限annotation类
 * 建立annotation类, 用于标注到需要权限验证的地方
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface FireAuthority {
	AuthorityType[] authorityTypes();
	ResultTypeEnum resultType() default ResultTypeEnum.page;
}
