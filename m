Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E9C10D0B1
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 04:40:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28A423C22D4
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 04:40:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 31E0E3C21DD
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 04:40:13 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C0EBE60232E
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 04:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574998808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/d6tuiBJ3b12PVCKr9K7EHkZtjL8t4Ip6HwrxaUPIpk=;
 b=i1+wHuNAAdjXEa8a6DLRJg4CIuSl4RnZnepcJYpJIQv+siYaz/oHYzhVRwI9rk13IusSrT
 HlkCraQWeVizdCHq9cjmEGNZbYJR2nxyJXUnYWMSOPoRGB6ZrDk575jnpJM3NI2MnXvI4H
 vz58OPX24b98NPYANV9Habg4iq8PBbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-8GnzunOeOPGP-Q3DWm9r-A-1; Thu, 28 Nov 2019 22:40:04 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E617E80183D;
 Fri, 29 Nov 2019 03:40:02 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01912600F8;
 Fri, 29 Nov 2019 03:40:01 +0000 (UTC)
Date: Fri, 29 Nov 2019 11:48:02 +0800
From: Zorro Lang <zlang@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191129034802.GE4601@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it,
 linux-fsdevel@vger.kernel.org
References: <20191128173532.6468-1-zlang@redhat.com>
 <20191128191442.GB5202@dell5510>
MIME-Version: 1.0
In-Reply-To: <20191128191442.GB5202@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 8GnzunOeOPGP-Q3DWm9r-A-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Cc: linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 28, 2019 at 08:14:42PM +0100, Petr Vorel wrote:
> Hi Zorro,
> 
> > Linux supports new mount syscalls from 5.2, so add new test cases
> > to cover these new API. This newmount01 case make sure new API -
> > fsopen(), fsconfig(), fsmount() and move_mount() can mount a
> > filesystem, then can be unmounted.
> Thanks for writing test for recently added kernel functionality.
> This is important.
> Test itself looks ok to me.
> There are few code style differences (note below), but that's not important.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> BTW I thought it'd be nice to use more filesystems via .all_filesystems = 1 [1]
> but at least it breaks nfs. And IMHO we don't have blacklist support for
> .all_filesystems.

I(or with my colleagues) would like to add more filesystem specified test later,
to make sure filesystem specified mount options still works well with new mount
syscalls.

> 
> >  configure.ac                                  |   4 +
> >  include/lapi/newmount.h                       | 106 +++++++++++++
> >  include/lapi/syscalls/aarch64.in              |   4 +
> >  include/lapi/syscalls/powerpc64.in            |   4 +
> >  include/lapi/syscalls/s390x.in                |   4 +
> >  include/lapi/syscalls/x86_64.in               |   4 +
> In final version we'd want to add syscall numbers for all archs.

Yeah, I tried to find a .in file for all archs, but didn't find, so had to
add these __NR_ definition separately.

> 
> ...
> > +++ b/include/lapi/newmount.h
> > @@ -0,0 +1,106 @@
> > +/*
> > + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it would be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, write the Free Software Foundation,
> > + * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> > + */
> Use SPDX license identifier instead of verbose GPL everywhere (including headers
> and makefiles; we don't want any HISTORY: text, but feel free to add Author:
> your name).

Wow, sorry I don't learn about the license things so much, just copy from other file:)
I'll search how to use the SPDX license.

> > +
> > +#ifndef __NEWMOUNT_H__
> > +#define __NEWMOUNT_H__
> Double underscore at the beginning and end (__FOO_H__) is IMHO reserved for library
> (use NEWMOUNT_H__).

Sure, I'll change it to a proper one.

> ...
> 
> > diff --git a/m4/ltp-fsconfig.m4 b/m4/ltp-fsconfig.m4
> > new file mode 100644
> > index 000000000..397027f1b
> > --- /dev/null
> > +++ b/m4/ltp-fsconfig.m4
> > @@ -0,0 +1,7 @@
> > +dnl SPDX-License-Identifier: GPL-2.0-or-later
> > +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> > +
> > +AC_DEFUN([LTP_CHECK_FSCONFIG],[
> > +AC_CHECK_FUNCS(fsconfig,,)
> > +AC_CHECK_HEADER(sys/mount.h,,,)
> > +])
> > diff --git a/m4/ltp-fsmount.m4 b/m4/ltp-fsmount.m4
> > new file mode 100644
> > index 000000000..ee32ef713
> > --- /dev/null
> > +++ b/m4/ltp-fsmount.m4
> > @@ -0,0 +1,7 @@
> > +dnl SPDX-License-Identifier: GPL-2.0-or-later
> > +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> > +
> > +AC_DEFUN([LTP_CHECK_FSMOUNT],[
> > +AC_CHECK_FUNCS(fsmount,,)
> > +AC_CHECK_HEADER(sys/mount.h,,,)
> > +])
> > diff --git a/m4/ltp-fsopen.m4 b/m4/ltp-fsopen.m4
> > new file mode 100644
> > index 000000000..6e23d437d
> > --- /dev/null
> > +++ b/m4/ltp-fsopen.m4
> > @@ -0,0 +1,7 @@
> > +dnl SPDX-License-Identifier: GPL-2.0-or-later
> > +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> > +
> > +AC_DEFUN([LTP_CHECK_FSOPEN],[
> > +AC_CHECK_FUNCS(fsopen,,)
> > +AC_CHECK_HEADER(sys/mount.h,,,)
> > +])
> > diff --git a/m4/ltp-move_mount.m4 b/m4/ltp-move_mount.m4
> > new file mode 100644
> > index 000000000..d6bfd82e9
> > --- /dev/null
> > +++ b/m4/ltp-move_mount.m4
> > @@ -0,0 +1,7 @@
> > +dnl SPDX-License-Identifier: GPL-2.0-or-later
> > +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> > +
> > +AC_DEFUN([LTP_CHECK_MOVE_MOUNT],[
> > +AC_CHECK_FUNCS(move_mount,,)
> > +AC_CHECK_HEADER(sys/mount.h,,,)
> > +])
> As all of these require <sys/mount.h>, I'd add them into single file
> m4/ltp-newmount.m4.

OK, I'll do that.

> BTW it might take a time before it get into <sys/mount.h>, they're now just <linux/mount.h> (even in musl, which is unlike glic fast with porting new things).

Yes, there're still in kernel-headers, glibc doesn't have patch for that. Maybe
they're waiting. I don't know if there'll be more newmount syscalls (e.g fsinfo
or something else), or fsdevel might would like to disconnect umount() in the
feature:)

> 
> ...
> > +++ b/testcases/kernel/syscalls/newmount/Makefile
> ...
> > +
> > +top_srcdir		?= ../../../..
> > +
> > +include $(top_srcdir)/include/mk/testcases.mk
> > +
> > +CFLAGS			+= -D_GNU_SOURCE
> Is _GNU_SOURCE needed?

Hmm... I'm not sure, just copy this Makefile from syscalls/mount/Makefile ;)
I think the new mount API might not be POSIX defined?

Thanks for your review so much, I'll send V2 patch soon.

Thanks,
Zorro

> > +
> > +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> 
> Kind regards,
> Petr
> 
> [1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2215-testing-with-a-block-device
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
