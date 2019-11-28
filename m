Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CC010CEBF
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 20:14:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE7F33C2219
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 20:14:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 30C523C1815
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 20:14:48 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C4E6C1400B90
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 20:14:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EE608AF24;
 Thu, 28 Nov 2019 19:14:43 +0000 (UTC)
Date: Thu, 28 Nov 2019 20:14:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Zorro Lang <zlang@redhat.com>
Message-ID: <20191128191442.GB5202@dell5510>
References: <20191128173532.6468-1-zlang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128173532.6468-1-zlang@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/newmount: new test case for new mount API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zorro,

> Linux supports new mount syscalls from 5.2, so add new test cases
> to cover these new API. This newmount01 case make sure new API -
> fsopen(), fsconfig(), fsmount() and move_mount() can mount a
> filesystem, then can be unmounted.
Thanks for writing test for recently added kernel functionality.
This is important.
Test itself looks ok to me.
There are few code style differences (note below), but that's not important.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

BTW I thought it'd be nice to use more filesystems via .all_filesystems = 1 [1]
but at least it breaks nfs. And IMHO we don't have blacklist support for
.all_filesystems.

>  configure.ac                                  |   4 +
>  include/lapi/newmount.h                       | 106 +++++++++++++
>  include/lapi/syscalls/aarch64.in              |   4 +
>  include/lapi/syscalls/powerpc64.in            |   4 +
>  include/lapi/syscalls/s390x.in                |   4 +
>  include/lapi/syscalls/x86_64.in               |   4 +
In final version we'd want to add syscall numbers for all archs.

...
> +++ b/include/lapi/newmount.h
> @@ -0,0 +1,106 @@
> +/*
> + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it would be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write the Free Software Foundation,
> + * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> + */
Use SPDX license identifier instead of verbose GPL everywhere (including headers
and makefiles; we don't want any HISTORY: text, but feel free to add Author:
your name).
> +
> +#ifndef __NEWMOUNT_H__
> +#define __NEWMOUNT_H__
Double underscore at the beginning and end (__FOO_H__) is IMHO reserved for library
(use NEWMOUNT_H__).
...

> diff --git a/m4/ltp-fsconfig.m4 b/m4/ltp-fsconfig.m4
> new file mode 100644
> index 000000000..397027f1b
> --- /dev/null
> +++ b/m4/ltp-fsconfig.m4
> @@ -0,0 +1,7 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> +
> +AC_DEFUN([LTP_CHECK_FSCONFIG],[
> +AC_CHECK_FUNCS(fsconfig,,)
> +AC_CHECK_HEADER(sys/mount.h,,,)
> +])
> diff --git a/m4/ltp-fsmount.m4 b/m4/ltp-fsmount.m4
> new file mode 100644
> index 000000000..ee32ef713
> --- /dev/null
> +++ b/m4/ltp-fsmount.m4
> @@ -0,0 +1,7 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> +
> +AC_DEFUN([LTP_CHECK_FSMOUNT],[
> +AC_CHECK_FUNCS(fsmount,,)
> +AC_CHECK_HEADER(sys/mount.h,,,)
> +])
> diff --git a/m4/ltp-fsopen.m4 b/m4/ltp-fsopen.m4
> new file mode 100644
> index 000000000..6e23d437d
> --- /dev/null
> +++ b/m4/ltp-fsopen.m4
> @@ -0,0 +1,7 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> +
> +AC_DEFUN([LTP_CHECK_FSOPEN],[
> +AC_CHECK_FUNCS(fsopen,,)
> +AC_CHECK_HEADER(sys/mount.h,,,)
> +])
> diff --git a/m4/ltp-move_mount.m4 b/m4/ltp-move_mount.m4
> new file mode 100644
> index 000000000..d6bfd82e9
> --- /dev/null
> +++ b/m4/ltp-move_mount.m4
> @@ -0,0 +1,7 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> +
> +AC_DEFUN([LTP_CHECK_MOVE_MOUNT],[
> +AC_CHECK_FUNCS(move_mount,,)
> +AC_CHECK_HEADER(sys/mount.h,,,)
> +])
As all of these require <sys/mount.h>, I'd add them into single file
m4/ltp-newmount.m4.
BTW it might take a time before it get into <sys/mount.h>, they're now just <linux/mount.h> (even in musl, which is unlike glic fast with porting new things).

...
> +++ b/testcases/kernel/syscalls/newmount/Makefile
...
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +CFLAGS			+= -D_GNU_SOURCE
Is _GNU_SOURCE needed?
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2215-testing-with-a-block-device

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
