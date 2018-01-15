This script installs Lemon Graph library automatically.

## To make the package universal, both of the following steps are necessary.
* On Linux:

```bash
git clone deepmap.aws:/srv/deepmap_third_party/compiled/lemon_graph.git
cd lemon_graph
./install.sh
git add .
git commit -m "Compile on Linux."
git push origin
```

* On Mac:

```bash
git clone deepmap.aws:/srv/deepmap_third_party/compiled/lemon_graph.git
cd lemon_graph
./install.sh
git add .
git commit -m "Compile on Linux."
git push origin
```

After the two steps, the lib is ready. Make a tar ball from lemon_graph (which
includes both the linux and mac libs), and you are good to go.

## Create a tar.gz file to be downloadable in /srv/deepmap_third_party/. In your local git directory (Ubuntu or AWS), create a tar.gz file

```bash
tar cvzf /srv/deepmap_third_party/<your_package_name>.<date e.g. 20161216>.tar.gz *
chmod 775 /srv/deepmap_third_party/<your_package_name>.<date e.g. 20161216>.tar.gz
```

## Gets the sha256 hash

```bash
sha256sum /srv/deepmap_third_party/<your_package_name>.<date e.g. 20161216>.tar.gz
```

Then in the WORKSPACE file of deepmap.review:deepmap, you can add the rule:

```python
http_archive(
	name = "precompiled_<your_package_name>",
	url = "https://deepmap.ai/git/<your_package_name>.<date e.g. 20161216>.tar.gz",
	sha256 = "3120e1b8d5a554874b7170935782034dd4ddb2d0fc5aae3af19ee34222eea8c2"
)
bind(
	name = "opencv",
	actual = "@precompiled_<your_package_name>//:opencv_lib",
)
```


