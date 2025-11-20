FROM nginx:alpine

# remove default Nginx website
RUN rm -rf /usr/share/nginx/html/*

# copy the Vite build files from dist folder
COPY dist/ /usr/share/nginx/html/

# expose port 3000 (your requirement)
EXPOSE 3000

# change nginx default port from 80 -> 3000
# use a full sed command with proper quoting and trailing slash
RUN sed -i 's/listen\s\+80;/listen       3000;/' /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
