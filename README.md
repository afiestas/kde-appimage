##Docker images
They are based in Centos 6.8, apparently it is the most used base for appimages
which makes it really reliable but at the same time really painful since it is
an ancient version.

There are 4 Docker which follow the natural order of dependencies:
    Tier 3 --> Tier 2 --> Tier 1 --> Qt

### Qt
docker pull afiestas/centos-qt/

### Tier 1
docker pull afiestas/centos-tier1/

### Tier 2
docker pull afiestas/centos-tier1/

### Tier 3
docker pull afiestas/centos-tier1/


## Missing frameworks
Some frameworks are too painful to compile (and I don't need them so far) so they are
not available in any of the images
 - KActivities, depends on boost 1.48 while centos has 1.10 or something
 - KActivities-stats, depends on Kactivities
 - Plasma, depends on KActivities
 - libnetworkmanager-qt, depends on newert NM which depends on newer autotools
 - libmodemmanager-qt, depends on newert mm which depends on newer autotools
