# Setting Sample Data Upload alias.
if [[ "${HOSTNAME}" =~ "wmc" ]]; then
  export UPLOAD_DIR='/mnt/uploads';
  export SAMPLE_DIR='/home/ubuntu/sample_data_set'
  alias SDU='mkdir -p ${UPLOAD_DIR} ; mv ${SAMPLE_DIR}/* . ; chmod -R 555 ${UPLOAD_DIR} ; chown -R www-data:www-data ${UPLOAD_DIR}';
elif [[ "${HOSTNAME}" =~ "usfws" ]]; then
  export UPLOAD_DIR='/sftp/sftp_usfws/uploads';
  export SAMPLE_DIR='/home/ubuntu/sample_data_set';
  alias SDU='cd ${UPLOAD_DIR} ; cp ${SAMPLE_DIR}/* ${UPLOAD_DIR} ; chmod -R 555 ${UPLOAD_DIR} ; chown -R www-data:www-data ${UPLOAD_DIR}';
elif [[ "${HOSTNAME}" =~ "ddev" ]]; then
  alias SDU='mkdir -p /opt/ingest_data/csv_image_upload ; mv /home/noelchiasson/import_data/* /opt/ingest_data/csv_image_upload ; chmod -R 550 /opt/ingest_data ; chown -R noelchiasson:noelchiasson /opt/ingest_data'
else
  export UPLOAD_DIR='/opt/ingest_data/csv_image_upload';
  alias SD='mv /home/vagrant/sample_data_set/* ${UPLOAD_DIR} ; chmod -R 555 /opt/ingest_data ; chown -R www-data:www-data /opt/ingest_data';
  alias SDU='mv /home/ubuntu/sample_data_set/* ${UPLOAD_DIR} ; chmod -R 555 /opt/ingest_data ; chown -R www-data:www-data /opt/ingest_data';
fi

# Specifying DR and COMPOSER commands
if [[ "${HOSTNAME}" =~ "ddev" ]]; then
  export HOST_URI='https://ctda-drupal.ddev.site';
  alias DR='drush';
else
  #export HOST_URI='http://$(hostname).dev.dgi';
  export HOST_URI="$(eval echo 'http://$(hostname).dev.dgi')"
  alias DR='sudo -u www-data /opt/www/drupal/vendor/bin/drush';
  alias drush='sudo -u www-data /opt/www/drupal/vendor/bin/drush';
  alias COMPOSER='sudo -u www-data COMPOSER_HOME=/var/local/composer COMPOSER_MEMORY_LIMIT=-1 composer';
fi

# Drush Commands
alias BI='DR --uri=${HOST_URI} migrate:batch-import --user=1';
alias BIT='DR --uri=${HOST_URI} migrate:batch-import --user=1 --group=isi__test_ingest';
alias RB='DR --uri=${HOST_URI} migrate:rollback --user=1';
alias RBT='DR --uri=${HOST_URI} migrate:rollback --user=1 --group=isi__test_ingest';
alias MR='DR --uri=${HOST_URI} migrate-reset';
alias CR='DR --root=/opt/www/drupal --uri=${HOST_URI} cache:rebuild';
alias provision='DR -y dgi-migrate:rollback --user=1 --group=islandora ; DR en content_sync -y ; DR content-sync:import provisioned_content --actions=create --user=1 -y ; DR content-sync:import i8-specific --actions=create --user=1 -y ; DR -y migrate:import --userid=1 --group=islandora ; DR pm:uninstall content_sync -y';
alias INDEX='DR sapi-i default_solr_index';

# Misc aliases
alias remove_content='rm -rf /root/puppet-file-i8-specific ; rm -rf /root/puppet-file-provisioned_content ; rm -rf /opt/www/drupal/sites/default/i8-specific ; rm -rf /opt/www/drupal/sites/default/provisioned_content ; cd /opt/www/drupal/sites/default ; rm provisioned_content-*.tar.gz ; rm i8-specific-*.tar.gz'
alias TAIL='tail --pid=$(pgrep -x puppet) -f /var/log/cloud-init-output.log'
alias git_creds='git config --global user.email "noel@discoverygarden.ca" ; git config --global user.name "Noel Chiasson"'
alias AR='sudo bash /home/ubuntu/bin/add_remotes.sh'
alias ll='ls -alhp --color=auto'
