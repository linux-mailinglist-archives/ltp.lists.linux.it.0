Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C7EF8FC0
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 13:39:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3F2B3C2592
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 13:39:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8B0173C2586
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 13:38:59 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0AEEB2014B4
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 13:38:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573562334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u1dNSDvFKclHzRxenI9GhLt2Vci2I9ZPG1+/jMsO2yw=;
 b=EvGRbRQqpNUAd+gYYykw09HDyST4Ul5ub3RczniR253K5+bCMbnHrc3bX7k/83Di1R8OO8
 zRHeURJhXbbL2hZjcDBkozKceeMFc3+wgNQI0OwE2rtP1ylJQMeBBGh6U83xy2fAyRvYUb
 AoEbLNOP4VNY8qaReMEcE3oY6IVSHM0=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-h2Bm6wwrNi2BJjMI-_edyQ-1; Tue, 12 Nov 2019 07:38:52 -0500
Received: by mail-ot1-f70.google.com with SMTP id s1so13682806oth.15
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 04:38:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HGAkVkgzaXsju/t1F33VpoS/OTYCEaQ7X9agmEMGI7M=;
 b=gk0RlWJsHIUgIDO0mwigDm6vpFzHv6V04ugcGJcpe0aeyMB3KGy7er9UkfmEBRe3Oc
 Fm+I3InIvH88wMP8mnKYLGK+Wfs334ILpKNCpEvsjQCun7g8pKJ/11rzO8d+yt2y1wm2
 6BZshPCxbrpMW+HJiCPHYwWsk5vEcP9kil/Wzx1zZ7K/mit6a3eOxNVNaF+LRG8dYoL1
 mIRj9Rnxa9JgqwYNJh+b/Vlh1L+UsURZNGbEkueyKCtMNu1oUwFq+r8WimrE2IEovHjO
 zwAfvEgvo0mwZbe/u/3EViTm7naC3r/vWTdLK1x+aiwsO0YPW22WNClMWDd66PRuQWdX
 vu1A==
X-Gm-Message-State: APjAAAV3kwB06qJ1eQO2uVUsfMPuHwHTag0euhbuQK233nHvEDv5Ngzw
 8RaHNQChmv76W4fFA+9m2WFpAI3rDVgNiLkcddHYjialr/0mTHYEdsDJ68ghfIZeni1pXwznKuu
 kSufgmrc7VSUA35BmioaBDgVqIc0=
X-Received: by 2002:a9d:870:: with SMTP id 103mr18663586oty.67.1573562330830; 
 Tue, 12 Nov 2019 04:38:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6px4RmT/VJnTYrCnWR2wpe0ZZYMa18B2z10D8YtdEq3AHoA+B13XU5cVEqXQZZm5wablh6RozBC41l76ap4c=
X-Received: by 2002:a9d:870:: with SMTP id 103mr18663559oty.67.1573562330320; 
 Tue, 12 Nov 2019 04:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20191107153458.16917-1-rpalethorpe@suse.com>
 <20191107153458.16917-2-rpalethorpe@suse.com>
 <CACT4Y+aYVH=e+ZJhF2b-b92dkJZwjnPP4keup509twcQqK+wMg@mail.gmail.com>
In-Reply-To: <CACT4Y+aYVH=e+ZJhF2b-b92dkJZwjnPP4keup509twcQqK+wMg@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 12 Nov 2019 20:38:38 +0800
Message-ID: <CAEemH2eVR4U8dHR6anmirX_X5Y3hXKgL4cHxekeVXH_wSHnnpA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
X-MC-Unique: h2Bm6wwrNi2BJjMI-_edyQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Wrapper for Syzkaller reproducers
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Dmitry Vyukov <dvyukov@google.com>, syzkaller <syzkaller@googlegroups.com>,
 LTP List <ltp@lists.linux.it>, automated-testing@yoctoproject.org
Content-Type: multipart/mixed; boundary="===============1168500097=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1168500097==
Content-Type: multipart/alternative; boundary="000000000000bb33d4059725876c"

--000000000000bb33d4059725876c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2019 at 11:44 PM Dmitry Vyukov via ltp <ltp@lists.linux.it>
wrote:

> On Thu, Nov 7, 2019 at 4:35 PM Richard Palethorpe <rpalethorpe@suse.com>
> wrote:
> >
> > Allows one to run the Syzkaller reproducers as part of the LTP.
> >
> > Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> > ---
> >  .gitmodules                                  |   5 +
> >  configure.ac                                 |  11 ++
> >  include/mk/features.mk.default               |   2 +
> >  include/mk/features.mk.in                    |   2 +
> >  runtest/.gitignore                           |   1 +
> >  testcases/kernel/Makefile                    |   1 +
> >  testcases/kernel/syzkaller-repros/.gitignore |   1 +
> >  testcases/kernel/syzkaller-repros/Makefile   | 100 ++++++++++++++
> >  testcases/kernel/syzkaller-repros/README.md  |  45 +++++++
> >  testcases/kernel/syzkaller-repros/syzwrap.c  | 133 +++++++++++++++++++
> >  10 files changed, 301 insertions(+)
> >  create mode 100644 runtest/.gitignore
> >  create mode 100644 testcases/kernel/syzkaller-repros/.gitignore
> >  create mode 100644 testcases/kernel/syzkaller-repros/Makefile
> >  create mode 100644 testcases/kernel/syzkaller-repros/README.md
> >  create mode 100644 testcases/kernel/syzkaller-repros/syzwrap.c
> >
> > diff --git a/.gitmodules b/.gitmodules
> > index 1c9e9c38a..6a2d31f51 100644
> > --- a/.gitmodules
> > +++ b/.gitmodules
> > @@ -1,3 +1,8 @@
> >  [submodule "testcases/kernel/mce-test"]
> >         path =3D testcases/kernel/mce-test
> >         url =3D git://
> git.kernel.org/pub/scm/linux/kernel/git/gong.chen/mce-test.git
> > +[submodule "testcases/linux-arts"]
> > +       path =3D testcases/linux-arts
> > +       url =3D
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-arts.git
> > +       shallow =3D true
> > +       ignore =3D all
> > diff --git a/configure.ac b/configure.ac
> > index 3785dff63..ec4cae483 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -184,6 +184,17 @@ else
> >      AC_SUBST([WITH_OPEN_POSIX_TESTSUITE],["no"])
> >  fi
> >
> > +AC_ARG_WITH([syzkaller-repros],
> > +  [AC_HELP_STRING([--with-syzkaller-repros],
> > +    [compile and install Syzkaller reproducers (default=3Dno)])],
> > +  [with_syzkaller_repros=3D$withval]
> > +)
> > +if test "x$with_syzkaller_repros" =3D xyes; then
> > +    AC_SUBST([WITH_SYZKALLER_REPROS],["yes"])
> > +else
> > +    AC_SUBST([WITH_SYZKALLER_REPROS],["no"])
> > +fi
> > +
> >  # testcases/realtime requires bash and python.
> >  if test "x$with_bash" =3D xyes && test "x$with_python" =3D xyes; then
> >      AC_ARG_WITH([realtime-testsuite],
> > diff --git a/include/mk/features.mk.default b/include/mk/features.mk
> .default
> > index 3a6cc5176..71fb48c60 100644
> > --- a/include/mk/features.mk.default
> > +++ b/include/mk/features.mk.default
> > @@ -47,3 +47,5 @@ WITH_REALTIME_TESTSUITE               :=3D no
> >  else
> >  WITH_REALTIME_TESTSUITE                :=3D no
> >  endif
> > +
> > +WITH_SYZKALLER_REPROS          :=3D no
> > diff --git a/include/mk/features.mk.in b/include/mk/features.mk.in
> > index 8e561b738..3ab7f4721 100644
> > --- a/include/mk/features.mk.in
> > +++ b/include/mk/features.mk.in
> > @@ -47,3 +47,5 @@ WITH_REALTIME_TESTSUITE               :=3D no
> >  else
> >  WITH_REALTIME_TESTSUITE                :=3D @WITH_REALTIME_TESTSUITE@
> >  endif
> > +
> > +WITH_SYZKALLER_REPROS          :=3D @WITH_SYZKALLER_REPROS@
> > diff --git a/runtest/.gitignore b/runtest/.gitignore
> > new file mode 100644
> > index 000000000..2ae05bfac
> > --- /dev/null
> > +++ b/runtest/.gitignore
> > @@ -0,0 +1 @@
> > +syzkaller*
> > diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
> > index 3319b3163..0150cfb4f 100644
> > --- a/testcases/kernel/Makefile
> > +++ b/testcases/kernel/Makefile
> > @@ -53,6 +53,7 @@ SUBDIRS                       +=3D connectors \
> >                            sched \
> >                            security \
> >                            sound \
> > +                          syzkaller-repros \
> >                            tracing \
> >                            uevents \
> >
> > diff --git a/testcases/kernel/syzkaller-repros/.gitignore
> b/testcases/kernel/syzkaller-repros/.gitignore
> > new file mode 100644
> > index 000000000..dbda1c71f
> > --- /dev/null
> > +++ b/testcases/kernel/syzkaller-repros/.gitignore
> > @@ -0,0 +1 @@
> > +syzwrap
> > diff --git a/testcases/kernel/syzkaller-repros/Makefile
> b/testcases/kernel/syzkaller-repros/Makefile
> > new file mode 100644
> > index 000000000..d40d61ac1
> > --- /dev/null
> > +++ b/testcases/kernel/syzkaller-repros/Makefile
> > @@ -0,0 +1,100 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# Copyright (c) 2019 Linux Test Project
> > +
> > +top_srcdir             ?=3D ../../..
> > +
> > +include $(top_srcdir)/include/mk/testcases.mk
> > +
> > +CFLAGS                 +=3D -D_GNU_SOURCE
> > +
> > +ifeq ($(WITH_SYZKALLER_REPROS),yes)
> > +
> > +# The number of reproducers in each runtest file
> > +SYZKALLER_RUNFILES_SIZE ?=3D 100
> > +
> > +# Extra arguments to pass to syzwrap. Uncomment the below to add some
> > +# sandboxing.
> > +# SYZWRAP_ARGS ?=3D -s
> > +
> > +# Location where reproducers are installed
> > +SYZKALLER_INSTALL_DIR ?=3D $(abspath $(DESTDIR)/$(prefix)/testcases/bi=
n)
> > +
> > +# If the reproducers directory is missing then we automatically clone
> the repo.
> > +# We then have to call make recursively to revaluate the targets
> > +SYZKALLER_REPROS_DIR ?=3D
> $(abs_top_srcdir)/testcases/linux-arts/syzkaller-repros/linux
> > +$(SYZKALLER_REPROS_DIR):
> > +       git submodule update --init
> $(abs_top_srcdir)/testcases/linux-arts
>


Just to try build it in LTP and hit errors:

# cd ltp-new/
# make autotools
# ./configure --with-syzkaller-repros
# make -j32
...
error: pathspec '/root/ltp-new/testcases/linux-arts' did not match any
file(s) known to git
make[3]: *** [/root/ltp-new/testcases/kernel/syzkaller-repros/Makefile:26:
/root/ltp-new/testcases/linux-arts/syzkaller-repros/linux] Error 1
make[3]: Leaving directory '/root/ltp-new/testcases/kernel/syzkaller-repros=
'
make[2]: *** [../../include/mk/generic_trunk_target.inc:93: all] Error 2
make[2]: Leaving directory '/root/ltp-new/testcases/kernel'
make[1]: *** [../include/mk/generic_trunk_target.inc:93: all] Error 2
make[1]: Leaving directory '/root/ltp-new/testcases'
make: *** [Makefile:108: testcases-all] Error 2



> > +       $(MAKE) syzkaller_runfiles
> > +
> > +SYZKALLER_REPROS_SRCS =3D $(wildcard $(SYZKALLER_REPROS_DIR)/*.c)
> > +
> > +# Some useful compiler flags for the LTP will cause problems with the
> > +# syzkaller repros so the repros have seperate flags
> > +SYZKALLER_CFLAGS ?=3D -pthread
> > +SYZKALLER_REPROS =3D $(subst
> $(abs_top_srcdir),$(abs_top_builddir),$(SYZKALLER_REPROS_SRCS:.c=3D))
> > +$(SYZKALLER_REPROS): %: %.c
> > +       -@if grep -q "__NR_mmap2" $^; then \
> > +               M32=3D"-m32"; \
> > +       fi; \
> > +       $(CC) $(SYZKALLER_CFLAGS) $$M32 $(SYZKALLER_LDFLAGS) $^ -o $@; =
\
> > +       echo $(CC) $(SYZKALLER_CFLAGS) $$M32 $(SYZKALLER_LDFLAGS) $^ -o
> $@;
> > +
> > +# Generate the names of the runtest files. This uses Shell arithmetic =
to
> > +# calculate how many runtest files there will be.
> > +define SYZKALLER_RUNFILES !=3D
> > +       n=3D$(words $(SYZKALLER_REPROS));
> > +       m=3D$(SYZKALLER_RUNFILES_SIZE);
> > +       i=3D$$(( $$n / $$m + ($$n % $$m > 0) ));
> > +       while test $$i -gt 0;
> > +       do
> > +               echo $(top_srcdir)/runtest/syzkaller$$i;
> > +               i=3D$$(($$i - 1));
> > +       done
> > +endef
> > +
> > +# Get the index part of a runtest files name
> > +syz_n =3D $(subst $(top_srcdir)/runtest/syzkaller,,$(1))
> > +syz_m =3D $(SYZKALLER_RUNFILES_SIZE)
> > +# Gives the index of the first reproducer in a runtest file
> > +syz_i =3D $(shell echo $$((($(call syz_n,$(1)) - 1) * $(2) + 1)))
> > +# Gives the index of the last reproducer in a runtest file
> > +syz_j =3D $(shell echo $$(( $(call syz_i,$(1),$(2)) + $(2) - 1 )))
> > +# Gvien a runtest file name, get the reproducers it should contain
> > +syz_wordlist =3D $(wordlist $(call syz_i,$(1),$(syz_m)),$(call
> syz_j,$(1),$(syz_m)),$(SYZKALLER_REPROS))
> > +
> > +define syz_runfile_line
> > +$(notdir $(exe)) syzwrap $(SYZWRAP_ARGS) -d $(SYZKALLER_INSTALL_DIR) -=
n
> $(notdir $(exe))
> > +
> > +endef
> > +
> > +# Generate the runtest files based on the reproducer names and batch
> size.
> > +$(SYZKALLER_RUNFILES): $(SYZKALLER_REPROS)
> > +       @echo "Writing $@"
> > +       $(file >$@)
> > +       $(foreach exe,$(call syz_wordlist,$@),$(file
> >>$@,$(syz_runfile_line)))
> > +
> > +.PHONY: syzkaller_runfiles
> > +syzkaller_runfiles: $(SYZKALLER_RUNFILES) | $(SYZKALLER_REPROS_DIR)
> > +
> > +all: $(SYZKALLER_RUNFILES) | $(SYZKALLER_REPROS_DIR)
> > +
> > +# There are too many reproducers to pass all at once to rm, so we just
> pass
> > +# one at a time
> > +syzkaller_clean:
> > +       $(foreach f, $(SYZKALLER_REPROS), $(RM) $(f))
> > +CLEAN_DEPS +=3D syzkaller_clean
> > +CLEAN_TARGETS +=3D $(SYZKALLER_RUNFILES)
> > +
> > +INSTALL_MODE ?=3D 0775
> > +
> > +# For some reason part of the path is missing if we just try to instal=
l
> these
> > +# by adding them to INSTALL_FILES
> > +SYZKALLER_REPROS_INSTALLED :=3D $(subst
> $(SYZKALLER_REPROS_DIR),$(SYZKALLER_INSTALL_DIR),$(SYZKALLER_REPROS))
> > +$(SYZKALLER_REPROS_INSTALLED): $(SYZKALLER_INSTALL_DIR)/%:
> $(SYZKALLER_REPROS_DIR)/%
> > +       install -m $(INSTALL_MODE) -T $< $@
> > +
> > +install: $(SYZKALLER_REPROS_INSTALLED)
> > +
> > +endif
> > +
> > +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> > diff --git a/testcases/kernel/syzkaller-repros/README.md
> b/testcases/kernel/syzkaller-repros/README.md
> > new file mode 100644
> > index 000000000..2c88efd01
> > --- /dev/null
> > +++ b/testcases/kernel/syzkaller-repros/README.md
> > @@ -0,0 +1,45 @@
> > +# LTP wrapper for Syzkaller reproducers
> > +
> > +This allows you to run the autogenerated C bug reproducers from the
> Syzkaller
> > +fuzzer within the LTP framework. Meaning that you may use an existing
> test
> > +runner compatible with the LTP (with some constraints, see below).
> > +
> > +## Instructions
> > +
> > +1. Run `ltp/configure` with `--with-syzkaller-repros`.
> > +2. Build and install the LTP as normal.
> > +3. Run one or more of syzkallerN runtest files where N is a number.
> > +
> > +Make will automatically download the reproducers into
> `testcases/linux-arts`
> > +using git-submodule if necessary.
> > +
> > +By default each runtest file contains 100 reproducers. You may change
> this by
> > +overriding `SYZKALLER_RUNFILES_SIZE`.
> > +
> > +Extra parameters can be sent to syzwrap using `SYZWRAP_ARGS`. See
> `syzwrap
> > +-h`.
> > +
> > +## Kernel Requirements
> > +
> > +It is strongly recommended that you use KASAN and other debugging kern=
el
> > +features. See the Syzkaller documentation for the configuration you
> should
> > +use.
> > +
> > +## Test Runner Requirements
> > +
> > +Unlike most LTP tests these reproducers can leave your system in a
> broken
> > +state even if no bug is triggered.
> > +
> > +You will need to:
> > +
> > +A) Reboot the SUT
> > +B) Reset at least the root filesystem to a known good state
> > +
> > +Every time syzwrap fails.
> > +
> > +If syzwrap fails with TBROK or fails to run at all, then you probably
> need to
> > +reset the system and rerun that test. If a test fails with TFAIL, you
> may also
> > +want to run it once again with a clean state.
> > +
> > +It might be the case that some reproducers write to random devices or
> do other
> > +things which can effect the outside world.
> > diff --git a/testcases/kernel/syzkaller-repros/syzwrap.c
> b/testcases/kernel/syzkaller-repros/syzwrap.c
> > new file mode 100644
> > index 000000000..9f5d16078
> > --- /dev/null
> > +++ b/testcases/kernel/syzkaller-repros/syzwrap.c
> > @@ -0,0 +1,133 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
> > + *
> > + * Run a single reproducer generated by the Syzkaller fuzzer.
> > + */
> > +
> > +#include <sys/types.h>
> > +#include <sys/wait.h>
> > +#include <sys/prctl.h>
> > +#include <sched.h>
> > +#include <signal.h>
> > +#include <stdio.h>
> > +#include <pwd.h>
> > +
> > +#include "tst_test.h"
> > +#include "tst_taint.h"
> > +#include "tst_safe_stdio.h"
> > +
> > +#define SANDBOX_HELP "\n"\
> > +       "-s\t Add some sandboxing around the reproducer. This will
> prevent some\n"\
> > +       "\t reproducers from creating network devices and thus prevent
> them from\n"\
> > +       "\t working. However it will also prevent some reproducers from
> trashing\n"\
> > +       "\t the system using root privileges. Note that you may generat=
e
> the\n"\
> > +       "\t reproducers with various types of sandboxing built in
> using\n"\
> > +       "\t syz-reprolist"
> > +
> > +static char *dir;
> > +static char *name;
> > +static char *path;
> > +
> > +static char *sandbox;
> > +
> > +static struct tst_option options[] =3D {
> > +       {"d:", &dir, "\n-d PATH\t Mandatory directory containing
> reproducers"},
> > +       {"n:", &name, "-n NAME\t Mandatory executable name of
> reproducer"},
> > +       {"s", &sandbox, SANDBOX_HELP},
> > +       {NULL, NULL, NULL}
> > +};
> > +
> > +static void become_nobody(void)
> > +{
> > +       struct passwd *pw;
> > +       int gid, uid;
> > +
> > +       setgroups(0, NULL);
> > +
> > +       pw =3D getpwnam("nobody");
> > +       if (pw) {
> > +               gid =3D pw->pw_gid;
> > +               uid =3D pw->pw_uid;
> > +       } else {
> > +               gid =3D 65534;
> > +               uid =3D 65534;
> > +       }
> > +
> > +       SAFE_SETREGID(gid, gid);
> > +       SAFE_SETREUID(uid, uid);
> > +}
> > +
> > +static void setup(void)
> > +{
> > +       tst_taint_init(TST_TAINT_W | TST_TAINT_D | TST_TAINT_L);
> > +
> > +       if (!dir)
> > +               tst_brk(TBROK, "No reproducer directory specified");
> > +
> > +       if (!name)
> > +               tst_brk(TBROK, "No reproducer name specified");
> > +
> > +       tst_res(TINFO, "https://syzkaller.appspot.com/bug?id=3D%s", nam=
e);
> > +
> > +       SAFE_ASPRINTF(&path, "%s/%s", dir, name);
> > +       tst_res(TINFO, "%s", path);
> > +}
> > +
> > +static void run(void)
> > +{
> > +       unsigned int backoff =3D 100;
> > +       int rem, status, sent_kill =3D 0;
> > +       float exec_time_start =3D (float)tst_timeout_remaining();
> > +       int pid;
> > +
> > +       if (sandbox)
> > +               SAFE_UNSHARE(CLONE_NEWPID);
> > +
> > +       pid =3D SAFE_FORK();
> > +       if (!pid) {
> > +               if (sandbox) {
> > +                       SAFE_UNSHARE(CLONE_NEWNET);
> > +                       become_nobody();
> > +               }
> > +
> > +               if (prctl(PR_SET_DUMPABLE, 1, 0, 0, 0)) {
> > +                       tst_res(TWARN | TERRNO,
> > +                               "Failed to set dumpable; won't be able
> to open /proc/self/*");
> > +               }
> > +
> > +               execl(path, name, NULL);
> > +               tst_brk(TBROK | TERRNO, "Failed to exec reproducer");
> > +       }
> > +
> > +       while (!waitpid(pid, &status, WNOHANG)) {
> > +               rem =3D tst_timeout_remaining();
> > +
> > +               if (!sent_kill && rem / exec_time_start < 0.5) {
> > +                       tst_res(TINFO, "Timeout; killing reproducer");
> > +
> > +                       TEST(kill(pid, SIGKILL));
> > +                       if (TST_RET =3D=3D -1)
> > +                               tst_res(TWARN | TTERRNO, "kill()
> failed");
> > +                       else
> > +                               sent_kill =3D 1;
> > +               }
> > +
> > +               usleep(backoff);
> > +               backoff =3D MIN(2 * backoff, 1000000);
> > +       }
> > +
> > +       if (tst_taint_check()) {
> > +               tst_res(TFAIL, "Kernel is tainted");
> > +       } else {
> > +               tst_res(TPASS, "Kernel is not tainted");
> > +       }
> > +}
> > +
> > +static struct tst_test test =3D {
> > +       .setup =3D setup,
> > +       .test_all =3D run,
> > +       .options =3D options,
> > +       .needs_tmpdir =3D 1,
> > +       .forks_child =3D 1
> > +};
> > --
> > 2.23.0
> >
>
> +syzkaller mailing list FTR
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


--=20
Regards,
Li Wang

--000000000000bb33d4059725876c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 7, 2019 at 11:44 PM Dmitry Vyukov via l=
tp &lt;<a href=3D"mailto:ltp@lists.linux.it">ltp@lists.linux.it</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Nov =
7, 2019 at 4:35 PM Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@sus=
e.com" target=3D"_blank">rpalethorpe@suse.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Allows one to run the Syzkaller reproducers as part of the LTP.<br>
&gt;<br>
&gt; Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@su=
se.com" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .gitmodules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A05 +<br>
&gt;=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
1 ++<br>
&gt;=C2=A0 include/mk/features.mk.default=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 include/mk/<a href=3D"http://features.mk.in" rel=3D"noreferrer" =
target=3D"_blank">features.mk.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 runtest/.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 testcases/kernel/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 testcases/kernel/syzkaller-repros/.gitignore |=C2=A0 =C2=A01 +<b=
r>
&gt;=C2=A0 testcases/kernel/syzkaller-repros/Makefile=C2=A0 =C2=A0| 100 +++=
+++++++++++<br>
&gt;=C2=A0 testcases/kernel/syzkaller-repros/README.md=C2=A0 |=C2=A0 45 +++=
++++<br>
&gt;=C2=A0 testcases/kernel/syzkaller-repros/syzwrap.c=C2=A0 | 133 ++++++++=
+++++++++++<br>
&gt;=C2=A0 10 files changed, 301 insertions(+)<br>
&gt;=C2=A0 create mode 100644 runtest/.gitignore<br>
&gt;=C2=A0 create mode 100644 testcases/kernel/syzkaller-repros/.gitignore<=
br>
&gt;=C2=A0 create mode 100644 testcases/kernel/syzkaller-repros/Makefile<br=
>
&gt;=C2=A0 create mode 100644 testcases/kernel/syzkaller-repros/README.md<b=
r>
&gt;=C2=A0 create mode 100644 testcases/kernel/syzkaller-repros/syzwrap.c<b=
r>
&gt;<br>
&gt; diff --git a/.gitmodules b/.gitmodules<br>
&gt; index 1c9e9c38a..6a2d31f51 100644<br>
&gt; --- a/.gitmodules<br>
&gt; +++ b/.gitmodules<br>
&gt; @@ -1,3 +1,8 @@<br>
&gt;=C2=A0 [submodule &quot;testcases/kernel/mce-test&quot;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D testcases/kernel/mce-test<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0url =3D git://<a href=3D"http://git.k=
ernel.org/pub/scm/linux/kernel/git/gong.chen/mce-test.git" rel=3D"noreferre=
r" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/gong.chen/mce-=
test.git</a><br>
&gt; +[submodule &quot;testcases/linux-arts&quot;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D testcases/linux-arts<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0url =3D <a href=3D"https://git.kernel.org/=
pub/scm/linux/kernel/git/shuah/linux-arts.git" rel=3D"noreferrer" target=3D=
"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-arts.g=
it</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0shallow =3D true<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ignore =3D all<br>
&gt; diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a><br>
&gt; index 3785dff63..ec4cae483 100644<br>
&gt; --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a><br>
&gt; +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a><br>
&gt; @@ -184,6 +184,17 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 AC_SUBST([WITH_OPEN_POSIX_TESTSUITE],[&quot;no&quo=
t;])<br>
&gt;=C2=A0 fi<br>
&gt;<br>
&gt; +AC_ARG_WITH([syzkaller-repros],<br>
&gt; +=C2=A0 [AC_HELP_STRING([--with-syzkaller-repros],<br>
&gt; +=C2=A0 =C2=A0 [compile and install Syzkaller reproducers (default=3Dn=
o)])],<br>
&gt; +=C2=A0 [with_syzkaller_repros=3D$withval]<br>
&gt; +)<br>
&gt; +if test &quot;x$with_syzkaller_repros&quot; =3D xyes; then<br>
&gt; +=C2=A0 =C2=A0 AC_SUBST([WITH_SYZKALLER_REPROS],[&quot;yes&quot;])<br>
&gt; +else<br>
&gt; +=C2=A0 =C2=A0 AC_SUBST([WITH_SYZKALLER_REPROS],[&quot;no&quot;])<br>
&gt; +fi<br>
&gt; +<br>
&gt;=C2=A0 # testcases/realtime requires bash and python.<br>
&gt;=C2=A0 if test &quot;x$with_bash&quot; =3D xyes &amp;&amp; test &quot;x=
$with_python&quot; =3D xyes; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 AC_ARG_WITH([realtime-testsuite],<br>
&gt; diff --git a/include/mk/<a href=3D"http://features.mk" target=3D"_blan=
k">features.mk</a>.default b/include/mk/<a href=3D"http://features.mk" targ=
et=3D"_blank">features.mk</a>.default<br>
&gt; index 3a6cc5176..71fb48c60 100644<br>
&gt; --- a/include/mk/<a href=3D"http://features.mk" target=3D"_blank">feat=
ures.mk</a>.default<br>
&gt; +++ b/include/mk/<a href=3D"http://features.mk" target=3D"_blank">feat=
ures.mk</a>.default<br>
&gt; @@ -47,3 +47,5 @@ WITH_REALTIME_TESTSUITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D no<br>
&gt;=C2=A0 else<br>
&gt;=C2=A0 WITH_REALTIME_TESTSUITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 :=3D no<br>
&gt;=C2=A0 endif<br>
&gt; +<br>
&gt; +WITH_SYZKALLER_REPROS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D no<br>
&gt; diff --git a/include/mk/<a href=3D"http://features.mk.in" rel=3D"noref=
errer" target=3D"_blank">features.mk.in</a> b/include/mk/<a href=3D"http://=
features.mk.in" rel=3D"noreferrer" target=3D"_blank">features.mk.in</a><br>
&gt; index 8e561b738..3ab7f4721 100644<br>
&gt; --- a/include/mk/<a href=3D"http://features.mk.in" rel=3D"noreferrer" =
target=3D"_blank">features.mk.in</a><br>
&gt; +++ b/include/mk/<a href=3D"http://features.mk.in" rel=3D"noreferrer" =
target=3D"_blank">features.mk.in</a><br>
&gt; @@ -47,3 +47,5 @@ WITH_REALTIME_TESTSUITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D no<br>
&gt;=C2=A0 else<br>
&gt;=C2=A0 WITH_REALTIME_TESTSUITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 :=3D @WITH_REALTIME_TESTSUITE@<br>
&gt;=C2=A0 endif<br>
&gt; +<br>
&gt; +WITH_SYZKALLER_REPROS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D @WITH_SY=
ZKALLER_REPROS@<br>
&gt; diff --git a/runtest/.gitignore b/runtest/.gitignore<br>
&gt; new file mode 100644<br>
&gt; index 000000000..2ae05bfac<br>
&gt; --- /dev/null<br>
&gt; +++ b/runtest/.gitignore<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +syzkaller*<br>
&gt; diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile<br>
&gt; index 3319b3163..0150cfb4f 100644<br>
&gt; --- a/testcases/kernel/Makefile<br>
&gt; +++ b/testcases/kernel/Makefile<br>
&gt; @@ -53,6 +53,7 @@ SUBDIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D connectors \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sched \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 security \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sound \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 syzkaller-repros \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tracing \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uevents \<br>
&gt;<br>
&gt; diff --git a/testcases/kernel/syzkaller-repros/.gitignore b/testcases/=
kernel/syzkaller-repros/.gitignore<br>
&gt; new file mode 100644<br>
&gt; index 000000000..dbda1c71f<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syzkaller-repros/.gitignore<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +syzwrap<br>
&gt; diff --git a/testcases/kernel/syzkaller-repros/Makefile b/testcases/ke=
rnel/syzkaller-repros/Makefile<br>
&gt; new file mode 100644<br>
&gt; index 000000000..d40d61ac1<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syzkaller-repros/Makefile<br>
&gt; @@ -0,0 +1,100 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +# Copyright (c) 2019 Linux Test Project<br>
&gt; +<br>
&gt; +top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D ../../=
..<br>
&gt; +<br>
&gt; +include $(top_srcdir)/include/mk/<a href=3D"http://testcases.mk" rel=
=3D"noreferrer" target=3D"_blank">testcases.mk</a><br>
&gt; +<br>
&gt; +CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D -D_GNU_SOURCE<br>
&gt; +<br>
&gt; +ifeq ($(WITH_SYZKALLER_REPROS),yes)<br>
&gt; +<br>
&gt; +# The number of reproducers in each runtest file<br>
&gt; +SYZKALLER_RUNFILES_SIZE ?=3D 100<br>
&gt; +<br>
&gt; +# Extra arguments to pass to syzwrap. Uncomment the below to add some=
<br>
&gt; +# sandboxing.<br>
&gt; +# SYZWRAP_ARGS ?=3D -s<br>
&gt; +<br>
&gt; +# Location where reproducers are installed<br>
&gt; +SYZKALLER_INSTALL_DIR ?=3D $(abspath $(DESTDIR)/$(prefix)/testcases/b=
in)<br>
&gt; +<br>
&gt; +# If the reproducers directory is missing then we automatically clone=
 the repo.<br>
&gt; +# We then have to call make recursively to revaluate the targets<br>
&gt; +SYZKALLER_REPROS_DIR ?=3D $(abs_top_srcdir)/testcases/linux-arts/syzk=
aller-repros/linux<br>
&gt; +$(SYZKALLER_REPROS_DIR):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0git submodule update --init $(abs_top_srcd=
ir)/testcases/linux-arts<br></blockquote><div><br></div><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">Just to try build i=
t in LTP and hit errors:</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
# cd ltp-new/<br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l"># make autotools<br>#=C2=A0./configure --with-syzkaller-repros<br></div>=
<div class=3D"gmail_default" style=3D"font-size:small"># make -j32</div><di=
v class=3D"gmail_default" style=3D"font-size:small">...</div>error: pathspe=
c &#39;/root/ltp-new/testcases/linux-arts&#39; did not match any file(s) kn=
own to git<br>make[3]: *** [/root/ltp-new/testcases/kernel/syzkaller-repros=
/Makefile:26: /root/ltp-new/testcases/linux-arts/syzkaller-repros/linux] Er=
ror 1<br>make[3]: Leaving directory &#39;/root/ltp-new/testcases/kernel/syz=
kaller-repros&#39;<br>make[2]: *** [../../include/mk/generic_trunk_target.i=
nc:93: all] Error 2<br>make[2]: Leaving directory &#39;/root/ltp-new/testca=
ses/kernel&#39;<br>make[1]: *** [../include/mk/generic_trunk_target.inc:93:=
 all] Error 2<br>make[1]: Leaving directory &#39;/root/ltp-new/testcases&#3=
9;<br>make: *** [Makefile:108: testcases-all] Error 2<br><div class=3D"gmai=
l_default" style=3D"font-size:small"></div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) syzkaller_runfiles<br>
&gt; +<br>
&gt; +SYZKALLER_REPROS_SRCS =3D $(wildcard $(SYZKALLER_REPROS_DIR)/*.c)<br>
&gt; +<br>
&gt; +# Some useful compiler flags for the LTP will cause problems with the=
<br>
&gt; +# syzkaller repros so the repros have seperate flags<br>
&gt; +SYZKALLER_CFLAGS ?=3D -pthread<br>
&gt; +SYZKALLER_REPROS =3D $(subst $(abs_top_srcdir),$(abs_top_builddir),$(=
SYZKALLER_REPROS_SRCS:.c=3D))<br>
&gt; +$(SYZKALLER_REPROS): %: %.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-@if grep -q &quot;__NR_mmap2&quot; $^; th=
en \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0M32=3D&quot;-m=
32&quot;; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(SYZKALLER_CFLAGS) $$M32 $(SYZKALLE=
R_LDFLAGS) $^ -o $@; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(CC) $(SYZKALLER_CFLAGS) $$M32 $(SYZ=
KALLER_LDFLAGS) $^ -o $@;<br>
&gt; +<br>
&gt; +# Generate the names of the runtest files. This uses Shell arithmetic=
 to<br>
&gt; +# calculate how many runtest files there will be.<br>
&gt; +define SYZKALLER_RUNFILES !=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0n=3D$(words $(SYZKALLER_REPROS));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0m=3D$(SYZKALLER_RUNFILES_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i=3D$$(( $$n / $$m + ($$n % $$m &gt; 0) ))=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0while test $$i -gt 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(top_src=
dir)/runtest/syzkaller$$i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=3D$$(($$i - =
1));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; +endef<br>
&gt; +<br>
&gt; +# Get the index part of a runtest files name<br>
&gt; +syz_n =3D $(subst $(top_srcdir)/runtest/syzkaller,,$(1))<br>
&gt; +syz_m =3D $(SYZKALLER_RUNFILES_SIZE)<br>
&gt; +# Gives the index of the first reproducer in a runtest file<br>
&gt; +syz_i =3D $(shell echo $$((($(call syz_n,$(1)) - 1) * $(2) + 1)))<br>
&gt; +# Gives the index of the last reproducer in a runtest file<br>
&gt; +syz_j =3D $(shell echo $$(( $(call syz_i,$(1),$(2)) + $(2) - 1 )))<br=
>
&gt; +# Gvien a runtest file name, get the reproducers it should contain<br=
>
&gt; +syz_wordlist =3D $(wordlist $(call syz_i,$(1),$(syz_m)),$(call syz_j,=
$(1),$(syz_m)),$(SYZKALLER_REPROS))<br>
&gt; +<br>
&gt; +define syz_runfile_line<br>
&gt; +$(notdir $(exe)) syzwrap $(SYZWRAP_ARGS) -d $(SYZKALLER_INSTALL_DIR) =
-n $(notdir $(exe))<br>
&gt; +<br>
&gt; +endef<br>
&gt; +<br>
&gt; +# Generate the runtest files based on the reproducer names and batch =
size.<br>
&gt; +$(SYZKALLER_RUNFILES): $(SYZKALLER_REPROS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Writing $@&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(file &gt;$@)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach exe,$(call syz_wordlist,$@),$(fi=
le &gt;&gt;$@,$(syz_runfile_line)))<br>
&gt; +<br>
&gt; +.PHONY: syzkaller_runfiles<br>
&gt; +syzkaller_runfiles: $(SYZKALLER_RUNFILES) | $(SYZKALLER_REPROS_DIR)<b=
r>
&gt; +<br>
&gt; +all: $(SYZKALLER_RUNFILES) | $(SYZKALLER_REPROS_DIR)<br>
&gt; +<br>
&gt; +# There are too many reproducers to pass all at once to rm, so we jus=
t pass<br>
&gt; +# one at a time<br>
&gt; +syzkaller_clean:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach f, $(SYZKALLER_REPROS), $(RM) $(=
f))<br>
&gt; +CLEAN_DEPS +=3D syzkaller_clean<br>
&gt; +CLEAN_TARGETS +=3D $(SYZKALLER_RUNFILES)<br>
&gt; +<br>
&gt; +INSTALL_MODE ?=3D 0775<br>
&gt; +<br>
&gt; +# For some reason part of the path is missing if we just try to insta=
ll these<br>
&gt; +# by adding them to INSTALL_FILES<br>
&gt; +SYZKALLER_REPROS_INSTALLED :=3D $(subst $(SYZKALLER_REPROS_DIR),$(SYZ=
KALLER_INSTALL_DIR),$(SYZKALLER_REPROS))<br>
&gt; +$(SYZKALLER_REPROS_INSTALLED): $(SYZKALLER_INSTALL_DIR)/%: $(SYZKALLE=
R_REPROS_DIR)/%<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m $(INSTALL_MODE) -T $&lt; $@<br>
&gt; +<br>
&gt; +install: $(SYZKALLER_REPROS_INSTALLED)<br>
&gt; +<br>
&gt; +endif<br>
&gt; +<br>
&gt; +include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_targe=
t.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
&gt; diff --git a/testcases/kernel/syzkaller-repros/README.md b/testcases/k=
ernel/syzkaller-repros/README.md<br>
&gt; new file mode 100644<br>
&gt; index 000000000..2c88efd01<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syzkaller-repros/README.md<br>
&gt; @@ -0,0 +1,45 @@<br>
&gt; +# LTP wrapper for Syzkaller reproducers<br>
&gt; +<br>
&gt; +This allows you to run the autogenerated C bug reproducers from the S=
yzkaller<br>
&gt; +fuzzer within the LTP framework. Meaning that you may use an existing=
 test<br>
&gt; +runner compatible with the LTP (with some constraints, see below).<br=
>
&gt; +<br>
&gt; +## Instructions<br>
&gt; +<br>
&gt; +1. Run `ltp/configure` with `--with-syzkaller-repros`.<br>
&gt; +2. Build and install the LTP as normal.<br>
&gt; +3. Run one or more of syzkallerN runtest files where N is a number.<b=
r>
&gt; +<br>
&gt; +Make will automatically download the reproducers into `testcases/linu=
x-arts`<br>
&gt; +using git-submodule if necessary.<br>
&gt; +<br>
&gt; +By default each runtest file contains 100 reproducers. You may change=
 this by<br>
&gt; +overriding `SYZKALLER_RUNFILES_SIZE`.<br>
&gt; +<br>
&gt; +Extra parameters can be sent to syzwrap using `SYZWRAP_ARGS`. See `sy=
zwrap<br>
&gt; +-h`.<br>
&gt; +<br>
&gt; +## Kernel Requirements<br>
&gt; +<br>
&gt; +It is strongly recommended that you use KASAN and other debugging ker=
nel<br>
&gt; +features. See the Syzkaller documentation for the configuration you s=
hould<br>
&gt; +use.<br>
&gt; +<br>
&gt; +## Test Runner Requirements<br>
&gt; +<br>
&gt; +Unlike most LTP tests these reproducers can leave your system in a br=
oken<br>
&gt; +state even if no bug is triggered.<br>
&gt; +<br>
&gt; +You will need to:<br>
&gt; +<br>
&gt; +A) Reboot the SUT<br>
&gt; +B) Reset at least the root filesystem to a known good state<br>
&gt; +<br>
&gt; +Every time syzwrap fails.<br>
&gt; +<br>
&gt; +If syzwrap fails with TBROK or fails to run at all, then you probably=
 need to<br>
&gt; +reset the system and rerun that test. If a test fails with TFAIL, you=
 may also<br>
&gt; +want to run it once again with a clean state.<br>
&gt; +<br>
&gt; +It might be the case that some reproducers write to random devices or=
 do other<br>
&gt; +things which can effect the outside world.<br>
&gt; diff --git a/testcases/kernel/syzkaller-repros/syzwrap.c b/testcases/k=
ernel/syzkaller-repros/syzwrap.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..9f5d16078<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syzkaller-repros/syzwrap.c<br>
&gt; @@ -0,0 +1,133 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2019 Richard Palethorpe &lt;<a href=3D"mailto:rpalet=
horpe@suse.com" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Run a single reproducer generated by the Syzkaller fuzzer.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;sys/types.h&gt;<br>
&gt; +#include &lt;sys/wait.h&gt;<br>
&gt; +#include &lt;sys/prctl.h&gt;<br>
&gt; +#include &lt;sched.h&gt;<br>
&gt; +#include &lt;signal.h&gt;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;pwd.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;tst_test.h&quot;<br>
&gt; +#include &quot;tst_taint.h&quot;<br>
&gt; +#include &quot;tst_safe_stdio.h&quot;<br>
&gt; +<br>
&gt; +#define SANDBOX_HELP &quot;\n&quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-s\t Add some sandboxing around the =
reproducer. This will prevent some\n&quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\t reproducers from creating network=
 devices and thus prevent them from\n&quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\t working. However it will also pre=
vent some reproducers from trashing\n&quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\t the system using root privileges.=
 Note that you may generate the\n&quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\t reproducers with various types of=
 sandboxing built in using\n&quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\t syz-reprolist&quot;<br>
&gt; +<br>
&gt; +static char *dir;<br>
&gt; +static char *name;<br>
&gt; +static char *path;<br>
&gt; +<br>
&gt; +static char *sandbox;<br>
&gt; +<br>
&gt; +static struct tst_option options[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;d:&quot;, &amp;dir, &quot;\n-d PATH=
\t Mandatory directory containing reproducers&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;n:&quot;, &amp;name, &quot;-n NAME\=
t Mandatory executable name of reproducer&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;s&quot;, &amp;sandbox, SANDBOX_HELP=
},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NULL, NULL, NULL}<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void become_nobody(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct passwd *pw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int gid, uid;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0setgroups(0, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pw =3D getpwnam(&quot;nobody&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pw) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gid =3D pw-&gt=
;pw_gid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uid =3D pw-&gt=
;pw_uid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gid =3D 65534;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uid =3D 65534;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SETREGID(gid, gid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SETREUID(uid, uid);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void setup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_taint_init(TST_TAINT_W | TST_TAINT_D |=
 TST_TAINT_L);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK,=
 &quot;No reproducer directory specified&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!name)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK,=
 &quot;No reproducer name specified&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;<a href=3D"https://sy=
zkaller.appspot.com/bug?id=3D%s" rel=3D"noreferrer" target=3D"_blank">https=
://syzkaller.appspot.com/bug?id=3D%s</a>&quot;, name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_ASPRINTF(&amp;path, &quot;%s/%s&quot;=
, dir, name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;%s&quot;, path);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void run(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int backoff =3D 100;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int rem, status, sent_kill =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0float exec_time_start =3D (float)tst_timeo=
ut_remaining();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int pid;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sandbox)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_UNSHARE(C=
LONE_NEWPID);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pid) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sandbox) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0SAFE_UNSHARE(CLONE_NEWNET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0become_nobody();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (prctl(PR_S=
ET_DUMPABLE, 1, 0, 0, 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tst_res(TWARN | TERRNO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to set dumpable; won=
&#39;t be able to open /proc/self/*&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(path, na=
me, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK =
| TERRNO, &quot;Failed to exec reproducer&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!waitpid(pid, &amp;status, WNOHANG)=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rem =3D tst_ti=
meout_remaining();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sent_kill=
 &amp;&amp; rem / exec_time_start &lt; 0.5) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tst_res(TINFO, &quot;Timeout; killing reproducer&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0TEST(kill(pid, SIGKILL));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (TST_RET =3D=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TWARN | TTERRNO, &quot;ki=
ll() failed&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sent_kill =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep(backoff=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backoff =3D MI=
N(2 * backoff, 1000000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_taint_check()) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,=
 &quot;Kernel is tainted&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS,=
 &quot;Kernel is not tainted&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct tst_test test =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D run,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.options =3D options,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_tmpdir =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.forks_child =3D 1<br>
&gt; +};<br>
&gt; --<br>
&gt; 2.23.0<br>
&gt;<br>
<br>
+syzkaller mailing list FTR<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000bb33d4059725876c--


--===============1168500097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1168500097==--

