from setuptools import setup

setup(name='parkforruiyang',
      packages = setuptools.find_packages(),
      version='0.0.5',
      install_requires=['numpy', 'wget', 'networkx', 'gym', 'dill', 'pycapnp', 'pandas'],
      author = 'Ruiyang',                   # Type in your name
      author_email = 'ruiyang@ccs.neu.edu',      # Type in your E-Mail
      url = 'https://github.com/xuruiyang/parkforruiyang',   # Provide either the link to your github or to your website
      download_url = 'https://github.com/xuruiyang/parkforruiyang/archive/0.0.5.tar.gz',    # I explain this later on
)
