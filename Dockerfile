# Tomcat 9 + JDK 11 (Java EE 8 호환)
FROM tomcat:9.0-jdk11-temurin

# JVM 옵션(인코딩/타임존 등)
ENV CATALINA_OPTS="-Dfile.encoding=UTF-8 -Duser.timezone=Asia/Seoul"

# 기본 앱 제거(원하면 유지 가능)
RUN rm -rf $CATALINA_HOME/webapps/*

# 로컬 WAR을 컨테이너에 배포 (ROOT.war → 루트 컨텍스트 /)
COPY target/root.war $CATALINA_HOME/webapps/root.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
