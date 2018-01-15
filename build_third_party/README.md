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
