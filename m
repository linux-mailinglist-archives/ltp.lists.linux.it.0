Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E39E42F478C
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 10:31:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F5303C6AA6
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 10:31:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 736A03C2669
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 10:31:05 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id CDF556000E6
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 10:31:00 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; d="scan'208";a="103439754"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 17:30:58 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 5F8A34CE602D;
 Wed, 13 Jan 2021 17:30:54 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 17:30:53 +0800
Message-ID: <5FFEBDCC.6020102@cn.fujitsu.com>
Date: Wed, 13 Jan 2021 17:30:52 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20210111123626.28932-1-pvorel@suse.cz>
In-Reply-To: <20210111123626.28932-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 5F8A34CE602D.A8380
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] autoconf: Use pkg-config for keyutils
 detection
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2021/1/11 20:36, Petr Vorel wrote:
> Using pkg-config is less error prone during cross compilation.
Hi Petr,

Is there any detailed example about the above point?

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> if you agree with this, I'll replace (probably after release) ACL_LIBS,
> CAP_LIBS, CRYPTO_LIBS, SELINUX_LIBS (to follow libmnl and libtirpc).
It is OK for me.

Best Regards,
Xiao Yang
> libaio and libnuma does not support pkg-config.
>
> Tested: https://travis-ci.org/github/pevik/ltp/builds/753925166
>
> Kind regards,
> Petr
>
>  configure.ac                                   |  2 +-
>  include/mk/config.mk.in                        |  6 +++---
>  m4/ltp-keyutils.m4                             | 10 ----------
>  m4/ltp-libkeyutils.m4                          |  8 ++++++++
>  testcases/cve/Makefile                         |  2 +-
>  testcases/kernel/syscalls/add_key/Makefile     |  2 +-
>  testcases/kernel/syscalls/keyctl/Makefile      |  2 +-
>  testcases/kernel/syscalls/request_key/Makefile |  2 +-
>  8 files changed, 16 insertions(+), 18 deletions(-)
>  delete mode 100644 m4/ltp-keyutils.m4
>  create mode 100644 m4/ltp-libkeyutils.m4
>
> diff --git a/configure.ac b/configure.ac
> index 06be1c094..8d667eb1e 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -328,7 +328,7 @@ LTP_CHECK_CLONE_SUPPORTS_7_ARGS
>  LTP_CHECK_CRYPTO
>  LTP_CHECK_FORTIFY_SOURCE
>  LTP_CHECK_KERNEL_DEVEL
> -LTP_CHECK_KEYUTILS_SUPPORT
> +LTP_CHECK_LIBKEYUTILS
>  LTP_CHECK_LIBMNL
>  LTP_CHECK_LINUX_PTRACE
>  LTP_CHECK_LINUXRANDOM
> diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
> index 218447ef3..382b7fda2 100644
> --- a/include/mk/config.mk.in
> +++ b/include/mk/config.mk.in
> @@ -52,12 +52,12 @@ LEXLIB			:= @LEXLIB@
>  NUMA_LIBS		:= @NUMA_LIBS@
>  SELINUX_LIBS		:= @SELINUX_LIBS@
>  HAVE_RPC		:= @HAVE_RPC@
> -LIBTIRPC_CFLAGS		:= @LIBTIRPC_CFLAGS@
> -LIBTIRPC_LIBS		:= @LIBTIRPC_LIBS@
> -KEYUTILS_LIBS		:= @KEYUTILS_LIBS@
>  HAVE_FTS_H		:= @HAVE_FTS_H@
> +LIBKEYUTILS_LIBS	:= @LIBKEYUTILS_LIBS@
>  LIBMNL_LIBS		:= @LIBMNL_LIBS@
>  LIBMNL_CFLAGS		:= @LIBMNL_CFLAGS@
> +LIBTIRPC_CFLAGS		:= @LIBTIRPC_CFLAGS@
> +LIBTIRPC_LIBS		:= @LIBTIRPC_LIBS@
>  
>  prefix			:= @prefix@
>  
> diff --git a/m4/ltp-keyutils.m4 b/m4/ltp-keyutils.m4
> deleted file mode 100644
> index 451c549f3..000000000
> --- a/m4/ltp-keyutils.m4
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -dnl SPDX-License-Identifier: GPL-2.0-or-later
> -dnl Copyright (c) 2016 Fujitsu Ltd.
> -dnl Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
> -dnl Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
> -
> -AC_DEFUN([LTP_CHECK_KEYUTILS_SUPPORT], [
> -	AC_CHECK_LIB([keyutils], [add_key],
> -	[AC_DEFINE(HAVE_LIBKEYUTILS, 1, [Define to 1 if you have libkeyutils installed.])
> -	      AC_SUBST(KEYUTILS_LIBS, "-lkeyutils")])
> -])
> diff --git a/m4/ltp-libkeyutils.m4 b/m4/ltp-libkeyutils.m4
> new file mode 100644
> index 000000000..f5d128969
> --- /dev/null
> +++ b/m4/ltp-libkeyutils.m4
> @@ -0,0 +1,8 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
> +
> +AC_DEFUN([LTP_CHECK_LIBKEYUTILS], [
> +    PKG_CHECK_MODULES([LIBKEYUTILS], [libkeyutils], [
> +        AC_DEFINE([HAVE_LIBKEYUTILS], [1], [Define to 1 if you have libkeyutils library and headers])
> +	], [have_libkeyutils=no])
> +])
> diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
> index da44fff60..90921dd85 100644
> --- a/testcases/cve/Makefile
> +++ b/testcases/cve/Makefile
> @@ -21,7 +21,7 @@ CFLAGS			+= -D_GNU_SOURCE
>  
>  stack_clash:	CFLAGS += -fno-optimize-sibling-calls
>  
> -cve-2016-7042:	LDLIBS += $(KEYUTILS_LIBS)
> +cve-2016-7042:	LDLIBS += $(LIBKEYUTILS_LIBS)
>  
>  cve-2016-7117:	CFLAGS += -pthread
>  cve-2016-7117:	LDLIBS += -lrt
> diff --git a/testcases/kernel/syscalls/add_key/Makefile b/testcases/kernel/syscalls/add_key/Makefile
> index 0f51e0bc2..6c2102247 100644
> --- a/testcases/kernel/syscalls/add_key/Makefile
> +++ b/testcases/kernel/syscalls/add_key/Makefile
> @@ -5,6 +5,6 @@ top_srcdir		?= ../../../..
>  
>  include $(top_srcdir)/include/mk/testcases.mk
>  
> -LDLIBS  += $(KEYUTILS_LIBS)
> +LDLIBS  += $(LIBKEYUTILS_LIBS)
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/keyctl/Makefile b/testcases/kernel/syscalls/keyctl/Makefile
> index 180ece25a..343c5e359 100644
> --- a/testcases/kernel/syscalls/keyctl/Makefile
> +++ b/testcases/kernel/syscalls/keyctl/Makefile
> @@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
>  
>  include $(top_srcdir)/include/mk/testcases.mk
>  
> -LDLIBS	+= $(KEYUTILS_LIBS)
> +LDLIBS	+= $(LIBKEYUTILS_LIBS)
>  keyctl02: LDLIBS	+= -lpthread
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/request_key/Makefile b/testcases/kernel/syscalls/request_key/Makefile
> index 58a99875e..e69774b96 100644
> --- a/testcases/kernel/syscalls/request_key/Makefile
> +++ b/testcases/kernel/syscalls/request_key/Makefile
> @@ -6,6 +6,6 @@ top_srcdir		?= ../../../..
>  
>  include $(top_srcdir)/include/mk/testcases.mk
>  
> -LDLIBS		+= $(KEYUTILS_LIBS)
> +LDLIBS		+= $(LIBKEYUTILS_LIBS)
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
