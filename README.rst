socorro
=======

Install Socorro (processor and collector components) and Kibana.

Role Variables
--------------

============================== =================================================== ===================
Name                           Description                                         Example
============================== =================================================== ===================
socorro_upload_testing_symbols Symbols to upload during Ansible playbook execution demoapp.sym
============================== =================================================== ===================

Example Playbook
----------------

Create user ``socorro`` to run server:

.. code-block:: yaml

  - hosts: socorro
    tasks:
      - name: Create 'socorro' group
        become: yes
        group:
          name=socorro
      - name: Create 'socorro' user
        become: yes
        user:
          name=socorro
          group=socorro

Create server and upload basic symbols (if path is relative they will be
searched in ``files`` directory):

.. code-block:: yaml

  - hosts: socorro
    become_user: socorro
    become: yes
    roles:
      - socorro
    vars:
      socorro_upload_testing_symbols:
        - demoapp.sym
        - libMakeSegv.so.sym

Run on testing environment:

.. code-block:: shell

  > ansible-playbook --inventory-file stage stage.yml --ask-become-pass

Run on production:

.. code-block:: shell

  > ansible-playbook --inventory-file prod prod.yml --ask-become-pass

License
-------

BSD

Author Information
------------------

Ruslan Baratov <ruslan@qed.ai>
