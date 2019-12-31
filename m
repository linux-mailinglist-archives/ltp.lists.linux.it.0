Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 241B912D750
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 10:20:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C97733C2298
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 10:20:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 251D93C1CB0
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 10:20:01 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id BAEBE60117A
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 10:19:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577783997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YmQe+7nyCRHbskqKQZGvP6fgz8Xi8yqVnRo+IGOuxTk=;
 b=A9CGxGPJs4mXmSTz3kRvkEfY22UPRojxDI7h85V86HEetdeZnfkpNt0jqR9DN+2jY4xrPt
 C+JEK+ew79kUFt1XTn2FD04rwCUzwN8YqlQgRddIJdL7C4Xzou0ooM0ui3uqw83xwNrhCF
 5RCEwUJ6Yn7SHA9D2UcwQgWAQNmqRu0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-2OsK9kFbMc-oyT0CkUZm1Q-1; Tue, 31 Dec 2019 04:19:54 -0500
Received: by mail-oi1-f197.google.com with SMTP id e22so11558631oig.1
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 01:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AqK3Uix3b+8gh3HEXppotb0575dAfVNT8EJ5Zzq3VFA=;
 b=lizv7RhTITZVPJTKxYJz7wYrwr9l4gG3yRIsv+9o6Lv8YwjgyhnfNgYjUiDokWt4Z5
 3oeoPzEpSnf6QDiIXxpgEtYXXiLsq2eznYmYDrdc5WdOka8+4WMG+UPfQ9FIejqDFQ0W
 nHgSSa3Zj5tlwNHuGKblt9sjpJHqCygVaKRVApH5jtXScCQw8AxC0J6X4FP5/BqQhtUN
 zPVn7gBZ0wX3W3wzQxQNuJOLQoP2QJLv8kpiDXLcSnCGW9T4ZM8oIHh2Q3LeVZLpQ86l
 1Z9mZrMALOJBUM0dOTKhzlNx1UmoZ7UdXyV/1S4TaTAfE0/o4jsV5387ZseJOV3ykQdE
 q7gQ==
X-Gm-Message-State: APjAAAVDVe+MQLQk4D4+V5wcC6+NCYgVpGych9+bmyd5/+tikD33T8ZB
 rp5SJHjz1pB+gInsI19+r2MOohTpO07V0WsKt5qyo64zi3trKotFCD0VDFlgAI6lPZqb7h5kth4
 zf0r5DsL4DS9JXoFNkB+ydMOCJWU=
X-Received: by 2002:a05:6830:1e99:: with SMTP id
 n25mr40443834otr.67.1577783993945; 
 Tue, 31 Dec 2019 01:19:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOkfh6c5w8LEe861Aw6teMaCp00aPC+sbKsaIj9M2Naox6U/TSknjOgzNVOJl31m4F3kgy+4QEF9R6PFtnB7w=
X-Received: by 2002:a05:6830:1e99:: with SMTP id
 n25mr40443817otr.67.1577783993712; 
 Tue, 31 Dec 2019 01:19:53 -0800 (PST)
MIME-Version: 1.0
References: <20191230201122.9749-1-petr.vorel@gmail.com>
In-Reply-To: <20191230201122.9749-1-petr.vorel@gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 31 Dec 2019 17:19:42 +0800
Message-ID: <CAEemH2dRfQTjm_QmntobgXkRqH1ZQZEDmpuLeK2ObeAdFFbRPw@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
X-MC-Unique: 2OsK9kFbMc-oyT0CkUZm1Q-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] rpc-tirpc: Remove authdes related tests
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
Cc: libtirpc-devel@lists.sourceforge.net, Steve Dickson <SteveD@redhat.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1135996175=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1135996175==
Content-Type: multipart/alternative; boundary="0000000000007a59b6059afc76a5"

--0000000000007a59b6059afc76a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2019 at 4:11 AM Petr Vorel <petr.vorel@gmail.com> wrote:

> authdes is by default compiled out in libtirpc 1.2.5, thus
> authdes_create() returns NULL (see libtirpc commit bf8f0b8 Add back the
> authdes interfaces) and IMHO there is no way to detect whether libtirpc
> was compiled without authdes support to skip the test.
>

Maybe uses m4 can detect if authdes_seccreate() support or not, similar to
ltp commit 5bec81cd8550.

But I also think to remove these tests is a better option.  ACK from my
side.


>
> Interface to authdes_seccreate() is missing when libtirpc is compiled
> without authdes, thus compilation fail:
>
> /usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld:
> /tmp/ccFanCMm.o: in function `main':
> testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_aut=
hdes_seccreate/tirpc_authdes_seccreate.c:55:
> undefined reference to `authdes_seccreate'
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>
Acked-by: Li Wang <liwang@redhat.com>


> ---
> Hi,
>
> or is it safe to expect that authdes is compiled out when authdes_create(=
)
> returning NULL?
> I also decided to remove tests because authdes is deprecated and uClibc
> and musl does not provide DES authentication.
>
> FYI I've sent patch to libtirpc to add authdes_seccreate() interface [1].
>
> [1] https://sourceforge.net/p/libtirpc/mailman/message/36889142/
>
>  runtest/net.tirpc_tests                       |  2 -
>  testcases/network/rpc/rpc-tirpc/.gitignore    |  2 -
>  .../tirpc/tirpc_auth_authdes_create/Makefile  | 23 -------
>  .../tirpc_auth_authdes_create/assertions.xml  |  5 --
>  .../tirpc_authdes_create.c                    | 60 -----------------
>  .../tirpc_auth_authdes_seccreate/Makefile     | 23 -------
>  .../assertions.xml                            |  5 --
>  .../tirpc_authdes_seccreate.c                 | 65 -------------------
>  8 files changed, 185 deletions(-)
>  delete mode 100644
> testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_aut=
hdes_create/Makefile
>  delete mode 100644
> testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_aut=
hdes_create/assertions.xml
>  delete mode 100644
> testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_aut=
hdes_create/tirpc_authdes_create.c
>  delete mode 100644
> testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_aut=
hdes_seccreate/Makefile
>  delete mode 100644
> testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_aut=
hdes_seccreate/assertions.xml
>  delete mode 100644
> testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_aut=
hdes_seccreate/tirpc_authdes_seccreate.c
>
> diff --git a/runtest/net.tirpc_tests b/runtest/net.tirpc_tests
> index ba967492f..48e9ba3f5 100644
> --- a/runtest/net.tirpc_tests
> +++ b/runtest/net.tirpc_tests
> @@ -4,8 +4,6 @@ tirpc_rpcb_getmaps rpc_test.sh -s tirpc_svc_3 -c
> tirpc_rpcb_getmaps
>  tirpc_authnone_create rpc_test.sh -c tirpc_authnone_create
>  tirpc_authsys_create rpc_test.sh -s tirpc_svc_1 -c tirpc_authsys_create
>  tirpc_authsys_create_default rpc_test.sh -c tirpc_authsys_create_default
> -tirpc_authdes_create rpc_test.sh -s tirpc_svc_1 -c tirpc_authdes_create
> -tirpc_authdes_seccreate rpc_test.sh -s tirpc_svc_1 -c
> tirpc_authdes_seccreate
>
>  tirpc_clnt_dg_create rpc_test.sh -s tirpc_svc_5 -c tirpc_clnt_dg_create
>  tirpc_svc_dg_create rpc_test.sh -c tirpc_svc_dg_create
> diff --git a/testcases/network/rpc/rpc-tirpc/.gitignore
> b/testcases/network/rpc/rpc-tirpc/.gitignore
> index adcd81104..15b7c4d9c 100644
> --- a/testcases/network/rpc/rpc-tirpc/.gitignore
> +++ b/testcases/network/rpc/rpc-tirpc/.gitignore
> @@ -140,7 +140,6 @@
>
>  /tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_rmtcall/tirpc_rpcb_rm=
tcall_mt
>
>  /tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_rmtcall/tirpc_rpcb_rm=
tcall_performance
>
>  /tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_rmtcall/tirpc_rpcb_rm=
tcall
>
> -/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/tirpc_authdes_s=
eccreate
>  /tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_set/tirpc_rpcb_set
>
>  /tests_pack/rpc_suite/tirpc/tirpc_err_svcerr_weakauth/tirpc_svcerr_weaka=
uth
>
>  /tests_pack/rpc_suite/tirpc/tirpc_err_svcerr_systemerr/tirpc_svcerr_syst=
emerr
> @@ -176,7 +175,6 @@
>
>  /tests_pack/rpc_suite/tirpc/tirpc_interlevel_clnt_control/tirpc_clnt_con=
trol
>
>  /tests_pack/rpc_suite/tirpc/tirpc_interlevel_clnt_control/tirpc_clnt_con=
trol_limits
>
>  /tests_pack/rpc_suite/tirpc/tirpc_interlevel_clnt_tp_create/tirpc_clnt_t=
p_create
> -/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/tirpc_authdes_crea=
te
>
>  /tests_pack/rpc_suite/tirpc/tirpc_interlevel_svc_tp_create/tirpc_svc_tp_=
create
>
>  /tests_pack/rpc_suite/tirpc/tirpc_toplevel_clnt_create_timed/tirpc_clnt_=
create_timed
>
>  /tests_pack/rpc_suite/tirpc/tirpc_toplevel_clnt_create_timed/tirpc_clnt_=
create_timed_limits
> diff --git
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_create/Makefile
> b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_create/Makefile
> deleted file mode 100644
> index 23bf048f0..000000000
> ---
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_create/Makefile
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -#
> -#    Copyright (C) 2014, Oracle and/or its affiliates. All Rights
> Reserved.
> -#
> -#    This program is free software; you can redistribute it and/or modif=
y
> -#    it under the terms of the GNU General Public License as published b=
y
> -#    the Free Software Foundation; either version 2 of the License, or
> -#    (at your option) any later version.
> -#
> -#    This program is distributed in the hope that it will be useful,
> -#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -#    GNU General Public License for more details.
> -#
> -#    You should have received a copy of the GNU General Public License
> along
> -#    with this program; if not, write to the Free Software Foundation,
> Inc.,
> -#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -#
> -
> -top_srcdir             ?=3D ../../../../../../../..
> -
> -include        $(top_srcdir)/include/mk/env_pre.mk
> -include $(abs_srcdir)/../../../Makefile.inc
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_create/assertions.xml
> b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_create/assertions.xml
> deleted file mode 100644
> index 927fdbbfb..000000000
> ---
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_create/assertions.xml
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<assertions>
> -       <assertion id=3D"1" tag=3D"ef:XSH6TC2:3966:3967">
> -       Basic call of TIRPC authdes_create() function
> -       </assertion>
> -</assertions>
> diff --git
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_create/tirpc_authdes_create.c
> b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_create/tirpc_authdes_create.c
> deleted file mode 100644
> index bd52f5c0f..000000000
> ---
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_create/tirpc_authdes_create.c
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -/*
> -* Copyright (c) Bull S.A.  2007 All Rights Reserved.
> -*
> -* This program is free software; you can redistribute it and/or modify i=
t
> -* under the terms of version 2 of the GNU General Public License as
> -* published by the Free Software Foundation.
> -*
> -* This program is distributed in the hope that it would be useful, but
> -* WITHOUT ANY WARRANTY; without even the implied warranty of
> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> -*
> -* Further, this software is distributed without any warranty that it is
> -* free of the rightful claim of any third person regarding infringement
> -* or the like.  Any license provided herein, whether implied or
> -* otherwise, applies only to this software file.  Patent licenses, if
> -* any, provided herein do not apply to combinations of this program with
> -* other software, or any other product whatsoever.
> -*
> -* You should have received a copy of the GNU General Public License alon=
g
> -* with this program; if not, write the Free Software Foundation, Inc.,
> -* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -*
> -* History:
> -* Created by: Cyril Lacabanne (Cyril.Lacabanne@bull.net)
> -*
> -*/
> -
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <time.h>
> -#include <netdb.h>
> -#include "lapi/rpc.h"
> -
> -//Standard define
> -#define PROCNUM 1
> -#define VERSNUM 1
> -
> -int main(int argn, char *argc[])
> -{
> -       //Program parameters : argc[1] : HostName or Host IP
> -       //                                         argc[2] : Server
> Program Number
> -       //                                         other arguments depend
> on test case
> -
> -       int test_status =3D 1;    //Default test result set to FAILED
> -       AUTH *authDes =3D NULL;
> -       struct sockaddr server_addr;
> -
> -       //Initialization
> -
> -       authDes =3D authdes_create(argc[1], 60, &server_addr, NULL);
> -
> -       //If we are here, macro call was successful
> -       test_status =3D ((AUTH *) authDes !=3D NULL) ? 0 : 1;
> -
> -       //This last printf gives the result status to the tests suite
> -       //normally should be 0: test has passed or 1: test has failed
> -       printf("%d\n", test_status);
> -
> -       return test_status;
> -}
> diff --git
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_seccreate/Makefile
> b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_seccreate/Makefile
> deleted file mode 100644
> index 23bf048f0..000000000
> ---
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_seccreate/Makefile
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -#
> -#    Copyright (C) 2014, Oracle and/or its affiliates. All Rights
> Reserved.
> -#
> -#    This program is free software; you can redistribute it and/or modif=
y
> -#    it under the terms of the GNU General Public License as published b=
y
> -#    the Free Software Foundation; either version 2 of the License, or
> -#    (at your option) any later version.
> -#
> -#    This program is distributed in the hope that it will be useful,
> -#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -#    GNU General Public License for more details.
> -#
> -#    You should have received a copy of the GNU General Public License
> along
> -#    with this program; if not, write to the Free Software Foundation,
> Inc.,
> -#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -#
> -
> -top_srcdir             ?=3D ../../../../../../../..
> -
> -include        $(top_srcdir)/include/mk/env_pre.mk
> -include $(abs_srcdir)/../../../Makefile.inc
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_seccreate/assertions.xml
> b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_seccreate/assertions.xml
> deleted file mode 100644
> index a19e4c1f2..000000000
> ---
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_seccreate/assertions.xml
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<assertions>
> -       <assertion id=3D"1" tag=3D"ef:XSH6TC2:3966:3967">
> -       Basic call of TIRPC authdes_seccreate() function
> -       </assertion>
> -</assertions>
> diff --git
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_seccreate/tirpc_authdes_seccreate.c
> b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_seccreate/tirpc_authdes_seccreate.c
> deleted file mode 100644
> index 87b07ec54..000000000
> ---
> a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_a=
uthdes_seccreate/tirpc_authdes_seccreate.c
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -/*
> -* Copyright (c) Bull S.A.  2007 All Rights Reserved.
> -*
> -* This program is free software; you can redistribute it and/or modify i=
t
> -* under the terms of version 2 of the GNU General Public License as
> -* published by the Free Software Foundation.
> -*
> -* This program is distributed in the hope that it would be useful, but
> -* WITHOUT ANY WARRANTY; without even the implied warranty of
> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> -*
> -* Further, this software is distributed without any warranty that it is
> -* free of the rightful claim of any third person regarding infringement
> -* or the like.  Any license provided herein, whether implied or
> -* otherwise, applies only to this software file.  Patent licenses, if
> -* any, provided herein do not apply to combinations of this program with
> -* other software, or any other product whatsoever.
> -*
> -* You should have received a copy of the GNU General Public License alon=
g
> -* with this program; if not, write the Free Software Foundation, Inc.,
> -* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -*
> -* History:
> -* Created by: Cyril Lacabanne (Cyril.Lacabanne@bull.net)
> -*
> -*/
> -
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <time.h>
> -#include <netdb.h>
> -#include "lapi/rpc.h"
> -
> -//Standard define
> -#define PROCNUM 1
> -#define VERSNUM 1
> -
> -int main(int argn, char *argc[])
> -{
> -       //Program parameters : argc[1] : HostName or Host IP
> -       //                                         argc[2] : Server
> Program Number
> -       //                                         other arguments depend
> on test case
> -
> -       //run_mode can switch into stand alone program or program launch
> by shell script
> -       //1 : stand alone, debug mode, more screen information
> -       //0 : launch by shell script as test case, only one printf ->
> result status
> -       int run_mode =3D 0;
> -       int test_status =3D 1;    //Default test result set to FAILED
> -       int progNum =3D atoi(argc[2]);
> -       AUTH *authDes =3D NULL;
> -       struct sockaddr server_addr;
> -
> -       //Initialization
> -
> -       authDes =3D authdes_seccreate(argc[1], 60, (char *)&server_addr,
> NULL);
> -
> -       //If we are here, macro call was successful
> -       test_status =3D ((AUTH *) authDes !=3D NULL) ? 0 : 1;
> -
> -       //This last printf gives the result status to the tests suite
> -       //normally should be 0: test has passed or 1: test has failed
> -       printf("%d\n", test_status);
> -
> -       return test_status;
> -}
> --
> 2.24.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--0000000000007a59b6059afc76a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Dec 31, 2019 at 4:11 AM Petr Vorel &lt;<a h=
ref=3D"mailto:petr.vorel@gmail.com" target=3D"_blank">petr.vorel@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">a=
uthdes is by default compiled out in libtirpc 1.2.5, thus<br>
authdes_create() returns NULL (see libtirpc commit bf8f0b8 Add back the<br>
authdes interfaces) and IMHO there is no way to detect whether libtirpc<br>
was compiled without authdes support to skip the test.<br></blockquote><div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Maybe uses m4 can detect if=
=C2=A0authdes_seccreate() support or not, similar to ltp commit 5bec81cd855=
0.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">But I also think to re=
move these tests is a better option.=C2=A0 ACK from my side.</div></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Interface to authdes_seccreate() is missing when libtirpc is compiled<br>
without authdes, thus compilation fail:<br>
<br>
/usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld: /t=
mp/ccFanCMm.o: in function `main&#39;:<br>
testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authd=
es_seccreate/tirpc_authdes_seccreate.c:55: undefined reference to `authdes_=
seccreate&#39;<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" targe=
t=3D"_blank">petr.vorel@gmail.com</a>&gt;<br></blockquote><div><span class=
=3D"gmail_default" style=3D"font-size:small">Acked-by: Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><s=
pan class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Hi,<br>
<br>
or is it safe to expect that authdes is compiled out when authdes_create() =
returning NULL?<br>
I also decided to remove tests because authdes is deprecated and uClibc<br>
and musl does not provide DES authentication.<br>
<br>
FYI I&#39;ve sent patch to libtirpc to add authdes_seccreate() interface [1=
].<br>
<br>
[1] <a href=3D"https://sourceforge.net/p/libtirpc/mailman/message/36889142/=
" rel=3D"noreferrer" target=3D"_blank">https://sourceforge.net/p/libtirpc/m=
ailman/message/36889142/</a><br>
<br>
=C2=A0runtest/net.tirpc_tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 -<br>
=C2=A0testcases/network/rpc/rpc-tirpc/.gitignore=C2=A0 =C2=A0 |=C2=A0 2 -<b=
r>
=C2=A0.../tirpc/tirpc_auth_authdes_create/Makefile=C2=A0 | 23 -------<br>
=C2=A0.../tirpc_auth_authdes_create/assertions.xml=C2=A0 |=C2=A0 5 --<br>
=C2=A0.../tirpc_authdes_create.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 60 -----------------<br>
=C2=A0.../tirpc_auth_authdes_seccreate/Makefile=C2=A0 =C2=A0 =C2=A0| 23 ---=
----<br>
=C2=A0.../assertions.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 --<br>
=C2=A0.../tirpc_authdes_seccreate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 65 -------------------<br>
=C2=A08 files changed, 185 deletions(-)<br>
=C2=A0delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_sui=
te/tirpc/tirpc_auth_authdes_create/Makefile<br>
=C2=A0delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_sui=
te/tirpc/tirpc_auth_authdes_create/assertions.xml<br>
=C2=A0delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_sui=
te/tirpc/tirpc_auth_authdes_create/tirpc_authdes_create.c<br>
=C2=A0delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_sui=
te/tirpc/tirpc_auth_authdes_seccreate/Makefile<br>
=C2=A0delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_sui=
te/tirpc/tirpc_auth_authdes_seccreate/assertions.xml<br>
=C2=A0delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_sui=
te/tirpc/tirpc_auth_authdes_seccreate/tirpc_authdes_seccreate.c<br>
<br>
diff --git a/runtest/net.tirpc_tests b/runtest/net.tirpc_tests<br>
index ba967492f..48e9ba3f5 100644<br>
--- a/runtest/net.tirpc_tests<br>
+++ b/runtest/net.tirpc_tests<br>
@@ -4,8 +4,6 @@ tirpc_rpcb_getmaps rpc_test.sh -s tirpc_svc_3 -c tirpc_rpcb=
_getmaps<br>
=C2=A0tirpc_authnone_create rpc_test.sh -c tirpc_authnone_create<br>
=C2=A0tirpc_authsys_create rpc_test.sh -s tirpc_svc_1 -c tirpc_authsys_crea=
te<br>
=C2=A0tirpc_authsys_create_default rpc_test.sh -c tirpc_authsys_create_defa=
ult<br>
-tirpc_authdes_create rpc_test.sh -s tirpc_svc_1 -c tirpc_authdes_create<br=
>
-tirpc_authdes_seccreate rpc_test.sh -s tirpc_svc_1 -c tirpc_authdes_seccre=
ate<br>
<br>
=C2=A0tirpc_clnt_dg_create rpc_test.sh -s tirpc_svc_5 -c tirpc_clnt_dg_crea=
te<br>
=C2=A0tirpc_svc_dg_create rpc_test.sh -c tirpc_svc_dg_create<br>
diff --git a/testcases/network/rpc/rpc-tirpc/.gitignore b/testcases/network=
/rpc/rpc-tirpc/.gitignore<br>
index adcd81104..15b7c4d9c 100644<br>
--- a/testcases/network/rpc/rpc-tirpc/.gitignore<br>
+++ b/testcases/network/rpc/rpc-tirpc/.gitignore<br>
@@ -140,7 +140,6 @@<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_rmtcall/tirpc_rpcb=
_rmtcall_mt<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_rmtcall/tirpc_rpcb=
_rmtcall_performance<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_rmtcall/tirpc_rpcb=
_rmtcall<br>
-/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/tirpc_authdes_sec=
create<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_set/tirpc_rpcb_set=
<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_err_svcerr_weakauth/tirpc_svcerr_we=
akauth<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_err_svcerr_systemerr/tirpc_svcerr_s=
ystemerr<br>
@@ -176,7 +175,6 @@<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_interlevel_clnt_control/tirpc_clnt_=
control<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_interlevel_clnt_control/tirpc_clnt_=
control_limits<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_interlevel_clnt_tp_create/tirpc_cln=
t_tp_create<br>
-/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/tirpc_authdes_create=
<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_interlevel_svc_tp_create/tirpc_svc_=
tp_create<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_toplevel_clnt_create_timed/tirpc_cl=
nt_create_timed<br>
=C2=A0/tests_pack/rpc_suite/tirpc/tirpc_toplevel_clnt_create_timed/tirpc_cl=
nt_create_timed_limits<br>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tir=
pc_auth_authdes_create/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pac=
k/rpc_suite/tirpc/tirpc_auth_authdes_create/Makefile<br>
deleted file mode 100644<br>
index 23bf048f0..000000000<br>
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth=
_authdes_create/Makefile<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-#<br>
-#=C2=A0 =C2=A0 Copyright (C) 2014, Oracle and/or its affiliates. All Right=
s Reserved.<br>
-#<br>
-#=C2=A0 =C2=A0 This program is free software; you can redistribute it and/=
or modify<br>
-#=C2=A0 =C2=A0 it under the terms of the GNU General Public License as pub=
lished by<br>
-#=C2=A0 =C2=A0 the Free Software Foundation; either version 2 of the Licen=
se, or<br>
-#=C2=A0 =C2=A0 (at your option) any later version.<br>
-#<br>
-#=C2=A0 =C2=A0 This program is distributed in the hope that it will be use=
ful,<br>
-#=C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty=
 of<br>
-#=C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See the<br>
-#=C2=A0 =C2=A0 GNU General Public License for more details.<br>
-#<br>
-#=C2=A0 =C2=A0 You should have received a copy of the GNU General Public L=
icense along<br>
-#=C2=A0 =C2=A0 with this program; if not, write to the Free Software Found=
ation, Inc.,<br>
-#=C2=A0 =C2=A0 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.=
<br>
-#<br>
-<br>
-top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D ../../../..=
/../../../..<br>
-<br>
-include=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(top_srcdir)/include/mk/<a href=3D"htt=
p://env_pre.mk" rel=3D"noreferrer" target=3D"_blank">env_pre.mk</a><br>
-include $(abs_srcdir)/../../../Makefile.inc<br>
-include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.mk"=
 rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tir=
pc_auth_authdes_create/assertions.xml b/testcases/network/rpc/rpc-tirpc/tes=
ts_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/assertions.xml<br>
deleted file mode 100644<br>
index 927fdbbfb..000000000<br>
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth=
_authdes_create/assertions.xml<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-&lt;assertions&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;assertion id=3D&quot;1&quot; tag=3D&quot;ef=
:XSH6TC2:3966:3967&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Basic call of TIRPC authdes_create() function<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/assertion&gt;<br>
-&lt;/assertions&gt;<br>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tir=
pc_auth_authdes_create/tirpc_authdes_create.c b/testcases/network/rpc/rpc-t=
irpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/tirpc_authdes_cre=
ate.c<br>
deleted file mode 100644<br>
index bd52f5c0f..000000000<br>
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth=
_authdes_create/tirpc_authdes_create.c<br>
+++ /dev/null<br>
@@ -1,60 +0,0 @@<br>
-/*<br>
-* Copyright (c) Bull S.A.=C2=A0 2007 All Rights Reserved.<br>
-*<br>
-* This program is free software; you can redistribute it and/or modify it<=
br>
-* under the terms of version 2 of the GNU General Public License as<br>
-* published by the Free Software Foundation.<br>
-*<br>
-* This program is distributed in the hope that it would be useful, but<br>
-* WITHOUT ANY WARRANTY; without even the implied warranty of<br>
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.<br>
-*<br>
-* Further, this software is distributed without any warranty that it is<br=
>
-* free of the rightful claim of any third person regarding infringement<br=
>
-* or the like.=C2=A0 Any license provided herein, whether implied or<br>
-* otherwise, applies only to this software file.=C2=A0 Patent licenses, if=
<br>
-* any, provided herein do not apply to combinations of this program with<b=
r>
-* other software, or any other product whatsoever.<br>
-*<br>
-* You should have received a copy of the GNU General Public License along<=
br>
-* with this program; if not, write the Free Software Foundation, Inc.,<br>
-* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.<br>
-*<br>
-* History:<br>
-* Created by: Cyril Lacabanne (<a href=3D"mailto:Cyril.Lacabanne@bull.net"=
 target=3D"_blank">Cyril.Lacabanne@bull.net</a>)<br>
-*<br>
-*/<br>
-<br>
-#include &lt;stdio.h&gt;<br>
-#include &lt;stdlib.h&gt;<br>
-#include &lt;time.h&gt;<br>
-#include &lt;netdb.h&gt;<br>
-#include &quot;lapi/rpc.h&quot;<br>
-<br>
-//Standard define<br>
-#define PROCNUM 1<br>
-#define VERSNUM 1<br>
-<br>
-int main(int argn, char *argc[])<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//Program parameters : argc[1] : HostName or Ho=
st IP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0argc[2] : Server Program Number<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0other arguments depend on test case<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int test_status =3D 1;=C2=A0 =C2=A0 //Default t=
est result set to FAILED<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AUTH *authDes =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr server_addr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//Initialization<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0authDes =3D authdes_create(argc[1], 60, &amp;se=
rver_addr, NULL);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//If we are here, macro call was successful<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_status =3D ((AUTH *) authDes !=3D NULL) ? =
0 : 1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//This last printf gives the result status to t=
he tests suite<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//normally should be 0: test has passed or 1: t=
est has failed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;%d\n&quot;, test_status);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return test_status;<br>
-}<br>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tir=
pc_auth_authdes_seccreate/Makefile b/testcases/network/rpc/rpc-tirpc/tests_=
pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/Makefile<br>
deleted file mode 100644<br>
index 23bf048f0..000000000<br>
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth=
_authdes_seccreate/Makefile<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-#<br>
-#=C2=A0 =C2=A0 Copyright (C) 2014, Oracle and/or its affiliates. All Right=
s Reserved.<br>
-#<br>
-#=C2=A0 =C2=A0 This program is free software; you can redistribute it and/=
or modify<br>
-#=C2=A0 =C2=A0 it under the terms of the GNU General Public License as pub=
lished by<br>
-#=C2=A0 =C2=A0 the Free Software Foundation; either version 2 of the Licen=
se, or<br>
-#=C2=A0 =C2=A0 (at your option) any later version.<br>
-#<br>
-#=C2=A0 =C2=A0 This program is distributed in the hope that it will be use=
ful,<br>
-#=C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty=
 of<br>
-#=C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See the<br>
-#=C2=A0 =C2=A0 GNU General Public License for more details.<br>
-#<br>
-#=C2=A0 =C2=A0 You should have received a copy of the GNU General Public L=
icense along<br>
-#=C2=A0 =C2=A0 with this program; if not, write to the Free Software Found=
ation, Inc.,<br>
-#=C2=A0 =C2=A0 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.=
<br>
-#<br>
-<br>
-top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D ../../../..=
/../../../..<br>
-<br>
-include=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(top_srcdir)/include/mk/<a href=3D"htt=
p://env_pre.mk" rel=3D"noreferrer" target=3D"_blank">env_pre.mk</a><br>
-include $(abs_srcdir)/../../../Makefile.inc<br>
-include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.mk"=
 rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tir=
pc_auth_authdes_seccreate/assertions.xml b/testcases/network/rpc/rpc-tirpc/=
tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/assertions.xml<br>
deleted file mode 100644<br>
index a19e4c1f2..000000000<br>
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth=
_authdes_seccreate/assertions.xml<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-&lt;assertions&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;assertion id=3D&quot;1&quot; tag=3D&quot;ef=
:XSH6TC2:3966:3967&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Basic call of TIRPC authdes_seccreate() functio=
n<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/assertion&gt;<br>
-&lt;/assertions&gt;<br>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tir=
pc_auth_authdes_seccreate/tirpc_authdes_seccreate.c b/testcases/network/rpc=
/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/tirpc_au=
thdes_seccreate.c<br>
deleted file mode 100644<br>
index 87b07ec54..000000000<br>
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth=
_authdes_seccreate/tirpc_authdes_seccreate.c<br>
+++ /dev/null<br>
@@ -1,65 +0,0 @@<br>
-/*<br>
-* Copyright (c) Bull S.A.=C2=A0 2007 All Rights Reserved.<br>
-*<br>
-* This program is free software; you can redistribute it and/or modify it<=
br>
-* under the terms of version 2 of the GNU General Public License as<br>
-* published by the Free Software Foundation.<br>
-*<br>
-* This program is distributed in the hope that it would be useful, but<br>
-* WITHOUT ANY WARRANTY; without even the implied warranty of<br>
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.<br>
-*<br>
-* Further, this software is distributed without any warranty that it is<br=
>
-* free of the rightful claim of any third person regarding infringement<br=
>
-* or the like.=C2=A0 Any license provided herein, whether implied or<br>
-* otherwise, applies only to this software file.=C2=A0 Patent licenses, if=
<br>
-* any, provided herein do not apply to combinations of this program with<b=
r>
-* other software, or any other product whatsoever.<br>
-*<br>
-* You should have received a copy of the GNU General Public License along<=
br>
-* with this program; if not, write the Free Software Foundation, Inc.,<br>
-* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.<br>
-*<br>
-* History:<br>
-* Created by: Cyril Lacabanne (<a href=3D"mailto:Cyril.Lacabanne@bull.net"=
 target=3D"_blank">Cyril.Lacabanne@bull.net</a>)<br>
-*<br>
-*/<br>
-<br>
-#include &lt;stdio.h&gt;<br>
-#include &lt;stdlib.h&gt;<br>
-#include &lt;time.h&gt;<br>
-#include &lt;netdb.h&gt;<br>
-#include &quot;lapi/rpc.h&quot;<br>
-<br>
-//Standard define<br>
-#define PROCNUM 1<br>
-#define VERSNUM 1<br>
-<br>
-int main(int argn, char *argc[])<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//Program parameters : argc[1] : HostName or Ho=
st IP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0argc[2] : Server Program Number<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0other arguments depend on test case<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//run_mode can switch into stand alone program =
or program launch by shell script<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//1 : stand alone, debug mode, more screen info=
rmation<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//0 : launch by shell script as test case, only=
 one printf -&gt; result status<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int run_mode =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int test_status =3D 1;=C2=A0 =C2=A0 //Default t=
est result set to FAILED<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int progNum =3D atoi(argc[2]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AUTH *authDes =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr server_addr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//Initialization<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0authDes =3D authdes_seccreate(argc[1], 60, (cha=
r *)&amp;server_addr, NULL);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//If we are here, macro call was successful<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_status =3D ((AUTH *) authDes !=3D NULL) ? =
0 : 1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//This last printf gives the result status to t=
he tests suite<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//normally should be 0: test has passed or 1: t=
est has failed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;%d\n&quot;, test_status);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return test_status;<br>
-}<br>
-- <br>
2.24.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000007a59b6059afc76a5--


--===============1135996175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1135996175==--

