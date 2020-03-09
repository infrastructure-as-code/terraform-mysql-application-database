SHELL = /bin/bash
tf = time terraform

init:
	$(tf) $@

plan output:
	$(tf) $@

apply destroy:
	$(tf) $@ --auto-approve

create: apply

delete: destroy

################################################################################
# terraform_tfvars
terraform.tfvars:
	echo 'mysql_host = "127.0.0.1"' > $@
	echo 'mysql_port = "$(db_port)"' >> $@
	echo 'mysql_user = "root"' >> $@
	echo 'mysql_password = "$(db_root_password)"' >> $@

clean:
	rm terraform.tfvars

################################################################################
# test database
db_image = mysql:5.7
db_container = mysql_692feab8
db_name = hello
db_port = 21830
db_root_password = hello123

db_create: terraform.tfvars
	docker container run --rm --detach \
		--name $(db_container) \
		--hostname $(db_container) \
		--env MYSQL_ROOT_PASSWORD=$(db_root_password) \
		--env MYSQL_DATABASE=$(db_name) \
		--publish $(db_port):3306 \
		$(db_image)

db_delete: clean
	-docker container stop $(db_container)

db_ping:
	docker container exec -it \
		--env MYSQL_HOST=127.0.0.1 \
		--env MYSQL_PWD=$(db_root_password) \
		$(db_container) \
  		mysql --batch --user=root $(db_name) --execute='select version();'

db_shell:
	docker container exec -it \
		--env MYSQL_HOST=127.0.0.1 \
		--env MYSQL_PWD=$(db_root_password) \
		$(db_container) \
  		mysql --user=root $(db_name)
