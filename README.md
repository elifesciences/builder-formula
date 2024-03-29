# `builder` formula

This repository contains instructions for installing and configuring the `builder`
project.

Yes, you would have builder building builder.

This is only used as a common environment for debugging builder and infrastructure issues.

It contains:

* AWS CLI tools
* Python 2 and 3
* PHP 7.2, Phive, Yarn, Composer
* kubectl, helm, pluto, fluxctl
* and the [builder](https://github.com/elifesciences/builder) project installed at `~/builder`

---

This repository should be structured as any Saltstack formula should, but it 
should also conform to the structure required by the [builder](https://github.com/elifesciences/builder) 
project.

See the eLife [builder example project](https://github.com/elifesciences/builder-example-project)
for a reference on how to integrate with the `builder` project.

[MIT licensed](LICENCE.txt)
