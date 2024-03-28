# genmetoo

My personal gentoo overlay


## How to install

Before all, make sure that `app-eselect/eselect-repository` is present in your system.

1. Add this repo:

```bash
eselect repository add genmetoo git https://github.com/apathoid/genmetoo.git
```

2. Sync it:

- with emaint (preffered)

```bash
emaint -r genmetoo sync
```

- with emerge

```bash
emerge --sync
```

3 (optional). Mask all packages and unmask only those you need:

- add to `/etc/portage/package.mask/genmetoo`

```bash
*/*::genmetoo
```

- add to `/etc/portage/package.unmask/genmetoo`

```bash
category/package::genmetoo
```
