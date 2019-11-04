Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A066ED9D9
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 08:13:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2794D3C2572
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 08:13:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 810183C2443
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 08:13:25 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 0DE72140111E
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 08:13:21 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,266,1569254400"; d="scan'208,217";a="77881949"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Nov 2019 15:13:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 512504CE1641;
 Mon,  4 Nov 2019 15:05:16 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 4 Nov 2019 15:13:20 +0800
To: Petr Vorel <pvorel@suse.cz>, <ltp@lists.linux.it>
References: <20191104064119.11510-1-pvorel@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <07a66085-589c-25a8-52b0-865d2fee7187@cn.fujitsu.com>
Date: Mon, 4 Nov 2019 15:13:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191104064119.11510-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 512504CE1641.ABF68
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] build: Remove {config.h, config.mk,
 features.mk, }.default
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
Content-Type: multipart/mixed; boundary="===============1740827610=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1740827610==
Content-Type: multipart/alternative;
	boundary="------------55C5BBF73C8AD3A1C437C488"

--------------55C5BBF73C8AD3A1C437C488
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/11/04 14:41, Petr Vorel wrote:

> Nowadays most distributions have autoconf, we can require it.
>
> include/config.h.default was outdated anyway.

LGTM.
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> BTW INSTALL needs update. doc/mini-howto-building-ltp-from-git.txt is in
> much better shape, but contains just compilation from git.
>
> I'd either create single markdown page doc/installation.txt, which would
> contain both installation from tarball and git (preferred) or had 2 separate pages.

I think one page is enough and don't need to make 2 separate pages. Also, linking this page in README.md
is ok.

>
> And INSTALL only contain see doc/*.
>
> Kind regards,
> Petr
>
>   INSTALL                        |  28 +---
>   include/config.h.default       | 241 ---------------------------------
>   include/mk/config.mk.default   |  77 -----------
>   include/mk/features.mk.default |  49 -------
>   4 files changed, 7 insertions(+), 388 deletions(-)
>   delete mode 100644 include/config.h.default
>   delete mode 100644 include/mk/config.mk.default
>   delete mode 100644 include/mk/features.mk.default
>
> diff --git a/INSTALL b/INSTALL
> index 6e3b26e24..3d86415a9 100644
> --- a/INSTALL
> +++ b/INSTALL
> @@ -38,32 +38,18 @@ downloaded from:
>   Configuration
>   -------------------
>   
> -Using autoconf (preferred):
> -	$ make autotools # This must be run from "$TOP_SRCDIR"!
> -	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
> -	$ cd "$TOP_BUILDDIR" && "$TOP_SRCDIR/configure" \
> -	  # [configure args go here, e.g. CC=$CC, LDFLAGS=$LDFLAGS, etc]
> -
> -Not using autoconf:
> -
> -	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
> -	$ cp "$TOP_SRCDIR/include/config.h.default" \
> -	     "$TOP_BUILDDIR/include/config.h"
> -	$ cp "$TOP_SRCDIR/include/mk/config.mk.default" \
> -	     "$TOP_BUILDDIR/include/mk/config.mk"
> -	$ cp "$TOP_SRCDIR/include/mk/features.mk.default" \
> -	     "$TOP_BUILDDIR/include/mk/features.mk"
> -
> -	# Fire up your favorite editor and set each value appropriately in
> -	# include/mk/config.mk. Uncomment all values commented out, such as
> -	# NUMA_LIBS, etc, but only if you're sure that the libraries exist and
> -	# can be linked on your system.
> +Configuration requires autoconf:
> +
> +	$ cd $TOP_SRCDIR
> +	$ make autotools
> +	$ mkdir -p $TOP_BUILDDIR
> +	$ cd $TOP_BUILDDIR && ./configure # configure args go here, e.g. CC=$CC, LDFLAGS=$LDFLAGS, etc
>   
>   - $TOP_SRCDIR and $TOP_BUILDDIR are the same for in-build-tree scenarios.
>   - $TOP_SRCDIR and $TOP_BUILDDIR differ for out-of-build-tree scenarios.
>   
>   See the In-build-tree and Out-of-build-tree sections below for more details on
> -what to do next...
> +what to do next.
>   
>   Compiling LTP
>   -------------------
> diff --git a/include/config.h.default b/include/config.h.default
> deleted file mode 100644
> index 9490b08c5..000000000
> --- a/include/config.h.default
> +++ /dev/null
> @@ -1,241 +0,0 @@
> -/* include/config.h.default.
> -   A semi-sane set of defaults for more recent Linux platforms. Please tailor
> -   to meet your needs.
> - */
> -
> -/* Define to 1 if you have the new implementation of quotactl that only
> -   requires sys/types.h and sys/quota.h */
> -#define HAS_NEW_MINIMAL_QUOTACTL 1
> -
> -/* Define to 1 if you have the RHEL 4.8+ version of quotactl, e.g. require
> -   sys/quota.h */
> -#define HAS_RHEL48_QUOTACTL
> -
> -/* Define to 1 if you have the <asm/ldt.h> header file. */
> -#undef HAVE_ASM_LDT_H
> -
> -/* Define to 1 if you have the <sys/xattr.h> header file. */
> -#undef HAVE_SYS_XATTR_H
> -
> -/* Define to 1 if you have the declaration of `CAP_BSET_DROP', and to 0 if you
> -   don't. */
> -#undef HAVE_DECL_CAP_BSET_DROP
> -
> -/* Define to 1 if you have the declaration of `CAP_BSET_READ', and to 0 if you
> -   don't. */
> -#undef HAVE_DECL_CAP_BSET_READ
> -
> -/* Define to 1 if you have the declaration of `cap_compare', and to 0 if you
> -   don't. */
> -#undef HAVE_DECL_CAP_COMPARE
> -
> -/* Define to 1 if you have the declaration of `cap_free', and to 0 if you
> -   don't. */
> -#undef HAVE_DECL_CAP_FREE
> -
> -/* Define to 1 if you have the declaration of `cap_from_text', and to 0 if you
> -   don't. */
> -#undef HAVE_DECL_CAP_FROM_TEXT
> -
> -/* Define to 1 if you have the declaration of `cap_get_proc', and to 0 if you
> -   don't. */
> -#undef HAVE_DECL_CAP_GET_PROC
> -
> -/* Define to 1 if you have the declaration of `cap_set_file', and to 0 if you
> -   don't. */
> -#undef HAVE_DECL_CAP_SET_FILE
> -
> -/* Define to 1 if you have the declaration of `cap_set_flag', and to 0 if you
> -   don't. */
> -#undef HAVE_DECL_CAP_SET_FLAG
> -
> -/* Define to 1 if you have the declaration of `cap_set_proc', and to 0 if you
> -   don't. */
> -#undef HAVE_DECL_CAP_SET_PROC
> -
> -/* Define to 1 if you have the declaration of `cap_to_text', and to 0 if you
> -   don't. */
> -#undef HAVE_DECL_CAP_TO_TEXT
> -
> -/* Define to 1 if you have the declaration of `PR_CAPBSET_READ', and to 0 if
> -   you don't. */
> -#undef HAVE_DECL_PR_CAPBSET_READ
> -
> -/* Define to 1 if you have the declaration of `PTRACE_GETSIGINFO', and to 0 if
> -   you don't. */
> -#define HAVE_DECL_PTRACE_GETSIGINFO 1
> -
> -/* Define to 1 if you have the declaration of `PTRACE_O_TRACEVFORKDONE', and
> -   to 0 if you don't. */
> -#define HAVE_DECL_PTRACE_O_TRACEVFORKDONE 1
> -
> -/* Define to 1 if you have the declaration of `PTRACE_SETOPTIONS', and to 0 if
> -   you don't. */
> -#undef HAVE_DECL_PTRACE_SETOPTIONS
> -
> -/* Define to 1 if you have the <ifaddrs.h> header file. */
> -#define HAVE_IFADDRS_H 1
> -
> -/* Define to 1 if you have the <inttypes.h> header file. */
> -#define HAVE_INTTYPES_H 1
> -
> -/* Define to 1 if you have the `io_set_eventfd' function. */
> -#undef HAVE_IO_SET_EVENTFD
> -
> -/* Define to 1 if you have the <libaio.h> header file. */
> -#undef HAVE_LIBAIO_H
> -
> -/* Define to 1 if you have both SELinux libraries and headers. */
> -#undef HAVE_LIBSELINUX_DEVEL
> -
> -/* Define to 1 if you have the <linux/genetlink.h> header file. */
> -#undef HAVE_LINUX_GENETLINK_H
> -
> -/* Define to 1 if you have the <linux/module.h> header file. */
> -#undef HAVE_LINUX_MODULE_H
> -
> -/* Define to 1 if you have the <linux/netlink.h> header file. */
> -#undef HAVE_LINUX_NETLINK_H
> -
> -/* Define to 1 if you have the <linux/ptrace.h> header file. */
> -#undef HAVE_LINUX_PTRACE_H
> -
> -/* Define to 1 if you have the <linux/signalfd.h> header file. */
> -#undef HAVE_LINUX_SIGNALFD_H
> -
> -/* Define to 1 if you have the <linux/taskstats.h> header file. */
> -#undef HAVE_LINUX_TASKSTATS_H
> -
> -/* Define to 1 if you have the <linux/types.h> header file. */
> -#undef HAVE_LINUX_TYPES_H
> -
> -/* Define to 1 if you have the <memory.h> header file. */
> -#undef HAVE_MEMORY_H
> -
> -/* Define to 1 if you have the <mm.h> header file. */
> -#undef HAVE_MM_H
> -
> -/* Define to 1 if you have the `modify_ldt' function. */
> -#undef HAVE_MODIFY_LDT
> -
> -/* 2.6 version of swapon/swapoff */
> -#define HAVE_NEW_SWAPONOFF 1
> -
> -/* Define to 1 if you have the <numa.h> header file. */
> -#undef HAVE_NUMA_H
> -
> -/* 2.4 version of swapon/swapoff */
> -#undef HAVE_OLD_SWAPONOFF
> -
> -/* Define to 1 if you have the <openssl/sha.h> header file. */
> -#undef HAVE_OPENSSL_SHA_H
> -
> -/* Define to 1 if you have the <pthread.h> header file. */
> -#undef HAVE_PTHREAD_H
> -
> -/* Define to 1 if you have the <selinux/selinux.h> header file. */
> -#undef HAVE_SELINUX_SELINUX_H
> -
> -/* Define to 1 if you have the `signalfd' function. */
> -#define HAVE_SIGNALFD 1
> -
> -/* Define to 1 if you have the <signalfd.h> header file. */
> -#define HAVE_SIGNALFD_H 1
> -
> -/* Define to 1 if you have the <stdint.h> header file. */
> -#undef HAVE_STDINT_H
> -
> -/* Define to 1 if you have the <stdlib.h> header file. */
> -#define HAVE_STDLIB_H 1
> -
> -/* Define to 1 if you have the <strings.h> header file. */
> -#define HAVE_STRINGS_H 1
> -
> -/* Define to 1 if you have the <string.h> header file. */
> -#define HAVE_STRING_H 1
> -
> -/* Define to 1 if the system has the type `struct modify_ldt_ldt_s'. */
> -#undef HAVE_STRUCT_MODIFY_LDT_LDT_S
> -
> -/* Define to 1 if the system has the type `struct ptrace_peeksiginfo_args'. */
> -#undef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
> -
> -/* Define to 1 if `signo' is member of `struct signalfd_siginfo'. */
> -#undef HAVE_STRUCT_SIGNALFD_SIGINFO_SIGNO
> -
> -/* Define to 1 if `ssi_signo' is member of `struct signalfd_siginfo'. */
> -#undef HAVE_STRUCT_SIGNALFD_SIGINFO_SSI_SIGNO
> -
> -/* Define to 1 if `freepages_count' is member of `struct taskstats'. */
> -#undef HAVE_STRUCT_TASKSTATS_FREEPAGES_COUNT
> -
> -/* Define to 1 if `nvcsw' is member of `struct taskstats'. */
> -#undef HAVE_STRUCT_TASKSTATS_NVCSW
> -
> -/* Define to 1 if `read_bytes' is member of `struct taskstats'. */
> -#undef HAVE_STRUCT_TASKSTATS_READ_BYTES
> -
> -/* Define to 1 if the system has the type `struct user_desc'. */
> -#undef HAVE_STRUCT_USER_DESC
> -
> -/* Define to 1 if you have the <sys/acl.h> header file. */
> -#define HAVE_SYS_ACL_H 1
> -
> -/* Define to 1 if you have the <sys/capability.h> header file. */
> -#define HAVE_SYS_CAPABILITY_H 1
> -
> -/* Define to 1 if you have the <sys/epoll.h> header file. */
> -#define HAVE_SYS_EPOLL_H 1
> -
> -/* Define to 1 if you have the <sys/inotify.h> header file. */
> -#define HAVE_SYS_INOTIFY_H 1
> -
> -/* Define to 1 if you have the <sys/prctl.h> header file. */
> -#undef HAVE_SYS_PRCTL_H
> -
> -/* Define to 1 if you have the <sys/signalfd.h> header file. */
> -#undef HAVE_SYS_SIGNALFD_H
> -
> -/* Define to 1 if you have the <sys/stat.h> header file. */
> -#define HAVE_SYS_STAT_H 1
> -
> -/* Define to 1 if you have the <sys/types.h> header file. */
> -#define HAVE_SYS_TYPES_H 1
> -
> -/* Define to 1 if you have the <unistd.h> header file. */
> -#define HAVE_UNISTD_H 1
> -
> -/* Define to 1 if you have the `unshare' function. */
> -#undef HAVE_UNSHARE
> -
> -/* Name of package */
> -#undef PACKAGE
> -
> -/* Define to the address where bug reports for this package should be sent. */
> -#undef PACKAGE_BUGREPORT
> -
> -/* Define to the full name of this package. */
> -#undef PACKAGE_NAME
> -
> -/* Define to the full name and version of this package. */
> -#undef PACKAGE_STRING
> -
> -/* Define to the one symbol short name of this package. */
> -#undef PACKAGE_TARNAME
> -
> -/* Define to the version of this package. */
> -#undef PACKAGE_VERSION
> -
> -/* Define to 1 if you have the ANSI C header files. */
> -#define STDC_HEADERS 1
> -
> -/* Version number of package */
> -#undef VERSION
> -
> -/* Define to 1 if `lex' declares `yytext' as a `char *' by default, not a
> -   `char[]'. */
> -#undef YYTEXT_POINTER
> -
> -/*
> - * vim: syntax=c
> - */
> diff --git a/include/mk/config.mk.default b/include/mk/config.mk.default
> deleted file mode 100644
> index 857067cb3..000000000
> --- a/include/mk/config.mk.default
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -#
> -#    config.mk.in.
> -#
> -#    Copyright (C) 2009, Cisco Systems Inc.
> -#
> -#    This program is free software; you can redistribute it and/or modify
> -#    it under the terms of the GNU General Public License as published by
> -#    the Free Software Foundation; either version 2 of the License, or
> -#    (at your option) any later version.
> -#
> -#    This program is distributed in the hope that it will be useful,
> -#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -#    GNU General Public License for more details.
> -#
> -#    You should have received a copy of the GNU General Public License along
> -#    with this program; if not, write to the Free Software Foundation, Inc.,
> -#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -#
> -# Ngie Cooper, July 2009
> -#
> -
> -# See this page for more info about LEX*:
> -# http://www.gnu.org/software/hello/manual/autoconf/Particular-Programs.html
> -
> -# Application specifying variables. You should never have to change these.
> -AR			:= $(CROSS_COMPILE)ar
> -CC			:= $(CROSS_COMPILE)cc
> -LEX			:= flex
> -RANLIB			:= $(CROSS_COMPILE)ranlib
> -STRIP			:= $(CROSS_COMPILE)strip
> -YACC			:= bison -y
> -
> -#JAR			:= jar
> -#JAVAC			:= javac
> -
> -#AIO_LIBS		:= -laio
> -#CAP_LIBS		:= -lcap
> -#ACL_LIBS		:= -lacl
> -#CRYPTO_LIBS		:= -lcrypto
> -#LEXLIB			:= -lfl
> -#NUMA_LIBS		:= -lnuma
> -#SELINUX_LIBS		:= -lselinux
> -#TIRPC_CPPFLAGS		:= -I/usr/include/tirpc
> -#TIRPC_LIBS		:= -ltirpc
> -
> -prefix			:= /opt/ltp
> -
> -datarootdir		:= ${prefix}/share
> -includedir		:= ${prefix}/include
> -exec_prefix		:= ${prefix}
> -bindir			:= ${exec_prefix}/bin
> -libdir			:= ${exec_prefix}/lib
> -mandir			:= ${datarootdir}/man
> -
> -CPPFLAGS		:=
> -CFLAGS			:= -g -O2
> -LDLIBS			:=
> -LDFLAGS			:=
> -
> -DEBUG_CFLAGS		?= -g
> -
> -# Please see README.mk-devel about -fstrict-aliasing.
> -OPT_CFLAGS		?= -O2 -fno-strict-aliasing -pipe
> -
> -WCFLAGS			?= -Wall
> -
> -LDFLAGS			+= $(WLDFLAGS)
> -CFLAGS			+= $(DEBUG_CFLAGS) $(OPT_CFLAGS) $(WCFLAGS)
> -
> -LINUX_VERSION		:=
> -LINUX_DIR		:=
> -LINUX_VERSION_MAJOR	:=
> -LINUX_VERSION_PATCH	:=
> -WITH_MODULES		:= no
> -
> -export datarootdir includedir libdir mandir prefix
> diff --git a/include/mk/features.mk.default b/include/mk/features.mk.default
> deleted file mode 100644
> index 3a6cc5176..000000000
> --- a/include/mk/features.mk.default
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -#
> -#    features.mk.default - feature tuning include Makefile.
> -#
> -#    Copyright (C) 2010, Linux Test Project.
> -#
> -#    This program is free software; you can redistribute it and/or modify
> -#    it under the terms of the GNU General Public License as published by
> -#    the Free Software Foundation; either version 2 of the License, or
> -#    (at your option) any later version.
> -#
> -#    This program is distributed in the hope that it will be useful,
> -#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -#    GNU General Public License for more details.
> -#
> -#    You should have received a copy of the GNU General Public License along
> -#    with this program; if not, write to the Free Software Foundation, Inc.,
> -#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -#
> -# Ngie Cooper, October 2010
> -#
> -
> -# Tools enable knobs
> -WITH_EXPECT			:= no
> -
> -WITH_PERL			:= no
> -
> -WITH_PYTHON			:= no
> -
> -# Features knobs
> -
> -# Test suite knobs
> -
> -# Enable testcases/kernel/power_management's compile and install?
> -ifeq ($(UCLINUX),1)
> -WITH_POWER_MANAGEMENT_TESTSUITE	:= no
> -else
> -WITH_POWER_MANAGEMENT_TESTSUITE	:= yes
> -endif
> -
> -# Enable testcases/open_posix_testsuite's compile and install?
> -WITH_OPEN_POSIX_TESTSUITE	:= no
> -
> -# Enable testcases/realtime's compile and install?
> -ifeq ($(UCLINUX),1)
> -WITH_REALTIME_TESTSUITE		:= no
> -else
> -WITH_REALTIME_TESTSUITE		:= no
> -endif



--------------55C5BBF73C8AD3A1C437C488
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/04 14:41, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20191104064119.11510-1-pvorel@suse.cz">
      <pre class="moz-quote-pre" wrap="">Nowadays most distributions have autoconf, we can require it.

include/config.h.default was outdated anyway.</pre>
    </blockquote>
    <pre>LGTM.
Reviewed-by: Yang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuyang2018.jy@cn.fujitsu.com">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20191104064119.11510-1-pvorel@suse.cz">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Petr Vorel <a class="moz-txt-link-rfc2396E" href="mailto:pvorel@suse.cz">&lt;pvorel@suse.cz&gt;</a>
---
Hi,

BTW INSTALL needs update. doc/mini-howto-building-ltp-from-git.txt is in
much better shape, but contains just compilation from git.

I'd either create single markdown page doc/installation.txt, which would
contain both installation from tarball and git (preferred) or had 2 separate pages.</pre>
    </blockquote>
    <pre>I think one page is enough and don't need to make 2 separate pages. Also, linking this page in README.md
is ok.
</pre>
    <blockquote type="cite"
      cite="mid:20191104064119.11510-1-pvorel@suse.cz">
      <pre class="moz-quote-pre" wrap="">

And INSTALL only contain see doc/*.

Kind regards,
Petr

 INSTALL                        |  28 +---
 include/config.h.default       | 241 ---------------------------------
 include/mk/config.mk.default   |  77 -----------
 include/mk/features.mk.default |  49 -------
 4 files changed, 7 insertions(+), 388 deletions(-)
 delete mode 100644 include/config.h.default
 delete mode 100644 include/mk/config.mk.default
 delete mode 100644 include/mk/features.mk.default

diff --git a/INSTALL b/INSTALL
index 6e3b26e24..3d86415a9 100644
--- a/INSTALL
+++ b/INSTALL
@@ -38,32 +38,18 @@ downloaded from:
 Configuration
 -------------------
 
-Using autoconf (preferred):
-	$ make autotools # This must be run from "$TOP_SRCDIR"!
-	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
-	$ cd "$TOP_BUILDDIR" &amp;&amp; "$TOP_SRCDIR/configure" \
-	  # [configure args go here, e.g. CC=$CC, LDFLAGS=$LDFLAGS, etc]
-
-Not using autoconf:
-
-	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
-	$ cp "$TOP_SRCDIR/include/config.h.default" \
-	     "$TOP_BUILDDIR/include/config.h"
-	$ cp "$TOP_SRCDIR/include/mk/config.mk.default" \
-	     "$TOP_BUILDDIR/include/mk/config.mk"
-	$ cp "$TOP_SRCDIR/include/mk/features.mk.default" \
-	     "$TOP_BUILDDIR/include/mk/features.mk"
-
-	# Fire up your favorite editor and set each value appropriately in
-	# include/mk/config.mk. Uncomment all values commented out, such as
-	# NUMA_LIBS, etc, but only if you're sure that the libraries exist and
-	# can be linked on your system.
+Configuration requires autoconf:
+
+	$ cd $TOP_SRCDIR
+	$ make autotools
+	$ mkdir -p $TOP_BUILDDIR
+	$ cd $TOP_BUILDDIR &amp;&amp; ./configure # configure args go here, e.g. CC=$CC, LDFLAGS=$LDFLAGS, etc
 
 - $TOP_SRCDIR and $TOP_BUILDDIR are the same for in-build-tree scenarios.
 - $TOP_SRCDIR and $TOP_BUILDDIR differ for out-of-build-tree scenarios.
 
 See the In-build-tree and Out-of-build-tree sections below for more details on
-what to do next...
+what to do next.
 
 Compiling LTP
 -------------------
diff --git a/include/config.h.default b/include/config.h.default
deleted file mode 100644
index 9490b08c5..000000000
--- a/include/config.h.default
+++ /dev/null
@@ -1,241 +0,0 @@
-/* include/config.h.default.
-   A semi-sane set of defaults for more recent Linux platforms. Please tailor
-   to meet your needs.
- */
-
-/* Define to 1 if you have the new implementation of quotactl that only
-   requires sys/types.h and sys/quota.h */
-#define HAS_NEW_MINIMAL_QUOTACTL 1
-
-/* Define to 1 if you have the RHEL 4.8+ version of quotactl, e.g. require
-   sys/quota.h */
-#define HAS_RHEL48_QUOTACTL
-
-/* Define to 1 if you have the &lt;asm/ldt.h&gt; header file. */
-#undef HAVE_ASM_LDT_H
-
-/* Define to 1 if you have the &lt;sys/xattr.h&gt; header file. */
-#undef HAVE_SYS_XATTR_H
-
-/* Define to 1 if you have the declaration of `CAP_BSET_DROP', and to 0 if you
-   don't. */
-#undef HAVE_DECL_CAP_BSET_DROP
-
-/* Define to 1 if you have the declaration of `CAP_BSET_READ', and to 0 if you
-   don't. */
-#undef HAVE_DECL_CAP_BSET_READ
-
-/* Define to 1 if you have the declaration of `cap_compare', and to 0 if you
-   don't. */
-#undef HAVE_DECL_CAP_COMPARE
-
-/* Define to 1 if you have the declaration of `cap_free', and to 0 if you
-   don't. */
-#undef HAVE_DECL_CAP_FREE
-
-/* Define to 1 if you have the declaration of `cap_from_text', and to 0 if you
-   don't. */
-#undef HAVE_DECL_CAP_FROM_TEXT
-
-/* Define to 1 if you have the declaration of `cap_get_proc', and to 0 if you
-   don't. */
-#undef HAVE_DECL_CAP_GET_PROC
-
-/* Define to 1 if you have the declaration of `cap_set_file', and to 0 if you
-   don't. */
-#undef HAVE_DECL_CAP_SET_FILE
-
-/* Define to 1 if you have the declaration of `cap_set_flag', and to 0 if you
-   don't. */
-#undef HAVE_DECL_CAP_SET_FLAG
-
-/* Define to 1 if you have the declaration of `cap_set_proc', and to 0 if you
-   don't. */
-#undef HAVE_DECL_CAP_SET_PROC
-
-/* Define to 1 if you have the declaration of `cap_to_text', and to 0 if you
-   don't. */
-#undef HAVE_DECL_CAP_TO_TEXT
-
-/* Define to 1 if you have the declaration of `PR_CAPBSET_READ', and to 0 if
-   you don't. */
-#undef HAVE_DECL_PR_CAPBSET_READ
-
-/* Define to 1 if you have the declaration of `PTRACE_GETSIGINFO', and to 0 if
-   you don't. */
-#define HAVE_DECL_PTRACE_GETSIGINFO 1
-
-/* Define to 1 if you have the declaration of `PTRACE_O_TRACEVFORKDONE', and
-   to 0 if you don't. */
-#define HAVE_DECL_PTRACE_O_TRACEVFORKDONE 1
-
-/* Define to 1 if you have the declaration of `PTRACE_SETOPTIONS', and to 0 if
-   you don't. */
-#undef HAVE_DECL_PTRACE_SETOPTIONS
-
-/* Define to 1 if you have the &lt;ifaddrs.h&gt; header file. */
-#define HAVE_IFADDRS_H 1
-
-/* Define to 1 if you have the &lt;inttypes.h&gt; header file. */
-#define HAVE_INTTYPES_H 1
-
-/* Define to 1 if you have the `io_set_eventfd' function. */
-#undef HAVE_IO_SET_EVENTFD
-
-/* Define to 1 if you have the &lt;libaio.h&gt; header file. */
-#undef HAVE_LIBAIO_H
-
-/* Define to 1 if you have both SELinux libraries and headers. */
-#undef HAVE_LIBSELINUX_DEVEL
-
-/* Define to 1 if you have the &lt;linux/genetlink.h&gt; header file. */
-#undef HAVE_LINUX_GENETLINK_H
-
-/* Define to 1 if you have the &lt;linux/module.h&gt; header file. */
-#undef HAVE_LINUX_MODULE_H
-
-/* Define to 1 if you have the &lt;linux/netlink.h&gt; header file. */
-#undef HAVE_LINUX_NETLINK_H
-
-/* Define to 1 if you have the &lt;linux/ptrace.h&gt; header file. */
-#undef HAVE_LINUX_PTRACE_H
-
-/* Define to 1 if you have the &lt;linux/signalfd.h&gt; header file. */
-#undef HAVE_LINUX_SIGNALFD_H
-
-/* Define to 1 if you have the &lt;linux/taskstats.h&gt; header file. */
-#undef HAVE_LINUX_TASKSTATS_H
-
-/* Define to 1 if you have the &lt;linux/types.h&gt; header file. */
-#undef HAVE_LINUX_TYPES_H
-
-/* Define to 1 if you have the &lt;memory.h&gt; header file. */
-#undef HAVE_MEMORY_H
-
-/* Define to 1 if you have the &lt;mm.h&gt; header file. */
-#undef HAVE_MM_H
-
-/* Define to 1 if you have the `modify_ldt' function. */
-#undef HAVE_MODIFY_LDT
-
-/* 2.6 version of swapon/swapoff */
-#define HAVE_NEW_SWAPONOFF 1
-
-/* Define to 1 if you have the &lt;numa.h&gt; header file. */
-#undef HAVE_NUMA_H
-
-/* 2.4 version of swapon/swapoff */
-#undef HAVE_OLD_SWAPONOFF
-
-/* Define to 1 if you have the &lt;openssl/sha.h&gt; header file. */
-#undef HAVE_OPENSSL_SHA_H
-
-/* Define to 1 if you have the &lt;pthread.h&gt; header file. */
-#undef HAVE_PTHREAD_H
-
-/* Define to 1 if you have the &lt;selinux/selinux.h&gt; header file. */
-#undef HAVE_SELINUX_SELINUX_H
-
-/* Define to 1 if you have the `signalfd' function. */
-#define HAVE_SIGNALFD 1
-
-/* Define to 1 if you have the &lt;signalfd.h&gt; header file. */
-#define HAVE_SIGNALFD_H 1
-
-/* Define to 1 if you have the &lt;stdint.h&gt; header file. */
-#undef HAVE_STDINT_H
-
-/* Define to 1 if you have the &lt;stdlib.h&gt; header file. */
-#define HAVE_STDLIB_H 1
-
-/* Define to 1 if you have the &lt;strings.h&gt; header file. */
-#define HAVE_STRINGS_H 1
-
-/* Define to 1 if you have the &lt;string.h&gt; header file. */
-#define HAVE_STRING_H 1
-
-/* Define to 1 if the system has the type `struct modify_ldt_ldt_s'. */
-#undef HAVE_STRUCT_MODIFY_LDT_LDT_S
-
-/* Define to 1 if the system has the type `struct ptrace_peeksiginfo_args'. */
-#undef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
-
-/* Define to 1 if `signo' is member of `struct signalfd_siginfo'. */
-#undef HAVE_STRUCT_SIGNALFD_SIGINFO_SIGNO
-
-/* Define to 1 if `ssi_signo' is member of `struct signalfd_siginfo'. */
-#undef HAVE_STRUCT_SIGNALFD_SIGINFO_SSI_SIGNO
-
-/* Define to 1 if `freepages_count' is member of `struct taskstats'. */
-#undef HAVE_STRUCT_TASKSTATS_FREEPAGES_COUNT
-
-/* Define to 1 if `nvcsw' is member of `struct taskstats'. */
-#undef HAVE_STRUCT_TASKSTATS_NVCSW
-
-/* Define to 1 if `read_bytes' is member of `struct taskstats'. */
-#undef HAVE_STRUCT_TASKSTATS_READ_BYTES
-
-/* Define to 1 if the system has the type `struct user_desc'. */
-#undef HAVE_STRUCT_USER_DESC
-
-/* Define to 1 if you have the &lt;sys/acl.h&gt; header file. */
-#define HAVE_SYS_ACL_H 1
-
-/* Define to 1 if you have the &lt;sys/capability.h&gt; header file. */
-#define HAVE_SYS_CAPABILITY_H 1
-
-/* Define to 1 if you have the &lt;sys/epoll.h&gt; header file. */
-#define HAVE_SYS_EPOLL_H 1
-
-/* Define to 1 if you have the &lt;sys/inotify.h&gt; header file. */
-#define HAVE_SYS_INOTIFY_H 1
-
-/* Define to 1 if you have the &lt;sys/prctl.h&gt; header file. */
-#undef HAVE_SYS_PRCTL_H
-
-/* Define to 1 if you have the &lt;sys/signalfd.h&gt; header file. */
-#undef HAVE_SYS_SIGNALFD_H
-
-/* Define to 1 if you have the &lt;sys/stat.h&gt; header file. */
-#define HAVE_SYS_STAT_H 1
-
-/* Define to 1 if you have the &lt;sys/types.h&gt; header file. */
-#define HAVE_SYS_TYPES_H 1
-
-/* Define to 1 if you have the &lt;unistd.h&gt; header file. */
-#define HAVE_UNISTD_H 1
-
-/* Define to 1 if you have the `unshare' function. */
-#undef HAVE_UNSHARE
-
-/* Name of package */
-#undef PACKAGE
-
-/* Define to the address where bug reports for this package should be sent. */
-#undef PACKAGE_BUGREPORT
-
-/* Define to the full name of this package. */
-#undef PACKAGE_NAME
-
-/* Define to the full name and version of this package. */
-#undef PACKAGE_STRING
-
-/* Define to the one symbol short name of this package. */
-#undef PACKAGE_TARNAME
-
-/* Define to the version of this package. */
-#undef PACKAGE_VERSION
-
-/* Define to 1 if you have the ANSI C header files. */
-#define STDC_HEADERS 1
-
-/* Version number of package */
-#undef VERSION
-
-/* Define to 1 if `lex' declares `yytext' as a `char *' by default, not a
-   `char[]'. */
-#undef YYTEXT_POINTER
-
-/*
- * vim: syntax=c
- */
diff --git a/include/mk/config.mk.default b/include/mk/config.mk.default
deleted file mode 100644
index 857067cb3..000000000
--- a/include/mk/config.mk.default
+++ /dev/null
@@ -1,77 +0,0 @@
-#
-#    config.mk.in.
-#
-#    Copyright (C) 2009, Cisco Systems Inc.
-#
-#    This program is free software; you can redistribute it and/or modify
-#    it under the terms of the GNU General Public License as published by
-#    the Free Software Foundation; either version 2 of the License, or
-#    (at your option) any later version.
-#
-#    This program is distributed in the hope that it will be useful,
-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-#    GNU General Public License for more details.
-#
-#    You should have received a copy of the GNU General Public License along
-#    with this program; if not, write to the Free Software Foundation, Inc.,
-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Ngie Cooper, July 2009
-#
-
-# See this page for more info about LEX*:
-# <a class="moz-txt-link-freetext" href="http://www.gnu.org/software/hello/manual/autoconf/Particular-Programs.html">http://www.gnu.org/software/hello/manual/autoconf/Particular-Programs.html</a>
-
-# Application specifying variables. You should never have to change these.
-AR			:= $(CROSS_COMPILE)ar
-CC			:= $(CROSS_COMPILE)cc
-LEX			:= flex
-RANLIB			:= $(CROSS_COMPILE)ranlib
-STRIP			:= $(CROSS_COMPILE)strip
-YACC			:= bison -y
-
-#JAR			:= jar
-#JAVAC			:= javac
-
-#AIO_LIBS		:= -laio
-#CAP_LIBS		:= -lcap
-#ACL_LIBS		:= -lacl
-#CRYPTO_LIBS		:= -lcrypto
-#LEXLIB			:= -lfl
-#NUMA_LIBS		:= -lnuma
-#SELINUX_LIBS		:= -lselinux
-#TIRPC_CPPFLAGS		:= -I/usr/include/tirpc
-#TIRPC_LIBS		:= -ltirpc
-
-prefix			:= /opt/ltp
-
-datarootdir		:= ${prefix}/share
-includedir		:= ${prefix}/include
-exec_prefix		:= ${prefix}
-bindir			:= ${exec_prefix}/bin
-libdir			:= ${exec_prefix}/lib
-mandir			:= ${datarootdir}/man
-
-CPPFLAGS		:=
-CFLAGS			:= -g -O2
-LDLIBS			:=
-LDFLAGS			:=
-
-DEBUG_CFLAGS		?= -g
-
-# Please see README.mk-devel about -fstrict-aliasing.
-OPT_CFLAGS		?= -O2 -fno-strict-aliasing -pipe
-
-WCFLAGS			?= -Wall
-
-LDFLAGS			+= $(WLDFLAGS)
-CFLAGS			+= $(DEBUG_CFLAGS) $(OPT_CFLAGS) $(WCFLAGS)
-
-LINUX_VERSION		:=
-LINUX_DIR		:=
-LINUX_VERSION_MAJOR	:=
-LINUX_VERSION_PATCH	:=
-WITH_MODULES		:= no
-
-export datarootdir includedir libdir mandir prefix
diff --git a/include/mk/features.mk.default b/include/mk/features.mk.default
deleted file mode 100644
index 3a6cc5176..000000000
--- a/include/mk/features.mk.default
+++ /dev/null
@@ -1,49 +0,0 @@
-#
-#    features.mk.default - feature tuning include Makefile.
-#
-#    Copyright (C) 2010, Linux Test Project.
-#
-#    This program is free software; you can redistribute it and/or modify
-#    it under the terms of the GNU General Public License as published by
-#    the Free Software Foundation; either version 2 of the License, or
-#    (at your option) any later version.
-#
-#    This program is distributed in the hope that it will be useful,
-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-#    GNU General Public License for more details.
-#
-#    You should have received a copy of the GNU General Public License along
-#    with this program; if not, write to the Free Software Foundation, Inc.,
-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Ngie Cooper, October 2010
-#
-
-# Tools enable knobs
-WITH_EXPECT			:= no
-
-WITH_PERL			:= no
-
-WITH_PYTHON			:= no
-
-# Features knobs
-
-# Test suite knobs
-
-# Enable testcases/kernel/power_management's compile and install?
-ifeq ($(UCLINUX),1)
-WITH_POWER_MANAGEMENT_TESTSUITE	:= no
-else
-WITH_POWER_MANAGEMENT_TESTSUITE	:= yes
-endif
-
-# Enable testcases/open_posix_testsuite's compile and install?
-WITH_OPEN_POSIX_TESTSUITE	:= no
-
-# Enable testcases/realtime's compile and install?
-ifeq ($(UCLINUX),1)
-WITH_REALTIME_TESTSUITE		:= no
-else
-WITH_REALTIME_TESTSUITE		:= no
-endif
</pre>
    </blockquote>
  </body>
</html>

--------------55C5BBF73C8AD3A1C437C488--

--===============1740827610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1740827610==--
