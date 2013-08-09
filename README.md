Dante Cookbook
==============
A cookbook for installing the dante socks proxy. At the moment it only
supports configuring the server. The cookbook exposes a dante_server
LWRP which can be used to deploy the server as well as a recipe to just
install the default server.

The cookbook has only been tested on Ubuntu 12.04, but should work on
any recent Ubuntu (and probably debian) which has universe enabled.

Requirements
------------
None, at the moment

Attributes
----------
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['dante']['server']['log_dir']</tt></td>
    <td>String</td>
    <td>Directory in which to write logs</td>
    <td><tt>/var/log/danted</tt></td>
  </tr>
</table>

Usage
-----
```

Contributing
------------
e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Tom Howe <turtlebender@gmail.com>
