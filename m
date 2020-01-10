Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D232D137082
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:00:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65C183C25D3
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:00:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D6C8D3C252C
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:00:50 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 0E3016013A1
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578668447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pndwWi9IMzJ4ZfZRdDqBC1YXdfiVr2kRb71Hcv/LsL0=;
 b=EbWVoUKg0IL6SBqp40JJ3be3yNG6icufkcIw+r1FCIVa27rT3w7lxTBY0KUN46bV9g4lFr
 yM562ooEkuFXqS+BDmX5xJxv8RynstGy2pMg/LNpqRilF+IK88Uf6gaEmD6HaeQgnw5rJw
 JfZ9EVUr0Lon222rMGlEKgu8Q+zltf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-9P21xV9VPkC9GPbgtoumRQ-1; Fri, 10 Jan 2020 10:00:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8D991085989;
 Fri, 10 Jan 2020 15:00:41 +0000 (UTC)
Received: from madhat.boston.devel.redhat.com (ovpn-117-237.phx2.redhat.com
 [10.3.117.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5B805DA60;
 Fri, 10 Jan 2020 15:00:40 +0000 (UTC)
To: Petr Vorel <petr.vorel@gmail.com>, ltp@lists.linux.it
References: <20191230201122.9749-1-petr.vorel@gmail.com>
From: Steve Dickson <SteveD@RedHat.com>
Message-ID: <d61a18c0-42f1-4c19-d8d1-f1e3c4e542a1@RedHat.com>
Date: Fri, 10 Jan 2020 10:00:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191230201122.9749-1-petr.vorel@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 9P21xV9VPkC9GPbgtoumRQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: libtirpc-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Acked-by: Steve Dickson <steved@redhat.com>

steved.

On 12/30/19 3:11 PM, Petr Vorel wrote:
> authdes is by default compiled out in libtirpc 1.2.5, thus
> authdes_create() returns NULL (see libtirpc commit bf8f0b8 Add back the
> authdes interfaces) and IMHO there is no way to detect whether libtirpc
> was compiled without authdes support to skip the test.
> 
> Interface to authdes_seccreate() is missing when libtirpc is compiled
> without authdes, thus compilation fail:
> 
> /usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld: /tmp/ccFanCMm.o: in function `main':
> testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/tirpc_authdes_seccreate.c:55: undefined reference to `authdes_seccreate'
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> or is it safe to expect that authdes is compiled out when authdes_create() returning NULL?
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
>  delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/Makefile
>  delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/assertions.xml
>  delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/tirpc_authdes_create.c
>  delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/Makefile
>  delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/assertions.xml
>  delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/tirpc_authdes_seccreate.c
> 
> diff --git a/runtest/net.tirpc_tests b/runtest/net.tirpc_tests
> index ba967492f..48e9ba3f5 100644
> --- a/runtest/net.tirpc_tests
> +++ b/runtest/net.tirpc_tests
> @@ -4,8 +4,6 @@ tirpc_rpcb_getmaps rpc_test.sh -s tirpc_svc_3 -c tirpc_rpcb_getmaps
>  tirpc_authnone_create rpc_test.sh -c tirpc_authnone_create
>  tirpc_authsys_create rpc_test.sh -s tirpc_svc_1 -c tirpc_authsys_create
>  tirpc_authsys_create_default rpc_test.sh -c tirpc_authsys_create_default
> -tirpc_authdes_create rpc_test.sh -s tirpc_svc_1 -c tirpc_authdes_create
> -tirpc_authdes_seccreate rpc_test.sh -s tirpc_svc_1 -c tirpc_authdes_seccreate
>  
>  tirpc_clnt_dg_create rpc_test.sh -s tirpc_svc_5 -c tirpc_clnt_dg_create
>  tirpc_svc_dg_create rpc_test.sh -c tirpc_svc_dg_create
> diff --git a/testcases/network/rpc/rpc-tirpc/.gitignore b/testcases/network/rpc/rpc-tirpc/.gitignore
> index adcd81104..15b7c4d9c 100644
> --- a/testcases/network/rpc/rpc-tirpc/.gitignore
> +++ b/testcases/network/rpc/rpc-tirpc/.gitignore
> @@ -140,7 +140,6 @@
>  /tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_rmtcall/tirpc_rpcb_rmtcall_mt
>  /tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_rmtcall/tirpc_rpcb_rmtcall_performance
>  /tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_rmtcall/tirpc_rpcb_rmtcall
> -/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/tirpc_authdes_seccreate
>  /tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_set/tirpc_rpcb_set
>  /tests_pack/rpc_suite/tirpc/tirpc_err_svcerr_weakauth/tirpc_svcerr_weakauth
>  /tests_pack/rpc_suite/tirpc/tirpc_err_svcerr_systemerr/tirpc_svcerr_systemerr
> @@ -176,7 +175,6 @@
>  /tests_pack/rpc_suite/tirpc/tirpc_interlevel_clnt_control/tirpc_clnt_control
>  /tests_pack/rpc_suite/tirpc/tirpc_interlevel_clnt_control/tirpc_clnt_control_limits
>  /tests_pack/rpc_suite/tirpc/tirpc_interlevel_clnt_tp_create/tirpc_clnt_tp_create
> -/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/tirpc_authdes_create
>  /tests_pack/rpc_suite/tirpc/tirpc_interlevel_svc_tp_create/tirpc_svc_tp_create
>  /tests_pack/rpc_suite/tirpc/tirpc_toplevel_clnt_create_timed/tirpc_clnt_create_timed
>  /tests_pack/rpc_suite/tirpc/tirpc_toplevel_clnt_create_timed/tirpc_clnt_create_timed_limits
> diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/Makefile
> deleted file mode 100644
> index 23bf048f0..000000000
> --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/Makefile
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -#
> -#    Copyright (C) 2014, Oracle and/or its affiliates. All Rights Reserved.
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
> -
> -top_srcdir		?= ../../../../../../../..
> -
> -include	$(top_srcdir)/include/mk/env_pre.mk
> -include $(abs_srcdir)/../../../Makefile.inc
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/assertions.xml b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/assertions.xml
> deleted file mode 100644
> index 927fdbbfb..000000000
> --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/assertions.xml
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<assertions>
> -	<assertion id="1" tag="ef:XSH6TC2:3966:3967">
> -	Basic call of TIRPC authdes_create() function
> -	</assertion>
> -</assertions>
> diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/tirpc_authdes_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/tirpc_authdes_create.c
> deleted file mode 100644
> index bd52f5c0f..000000000
> --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/tirpc_authdes_create.c
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -/*
> -* Copyright (c) Bull S.A.  2007 All Rights Reserved.
> -*
> -* This program is free software; you can redistribute it and/or modify it
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
> -* You should have received a copy of the GNU General Public License along
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
> -	//Program parameters : argc[1] : HostName or Host IP
> -	//                                         argc[2] : Server Program Number
> -	//                                         other arguments depend on test case
> -
> -	int test_status = 1;	//Default test result set to FAILED
> -	AUTH *authDes = NULL;
> -	struct sockaddr server_addr;
> -
> -	//Initialization
> -
> -	authDes = authdes_create(argc[1], 60, &server_addr, NULL);
> -
> -	//If we are here, macro call was successful
> -	test_status = ((AUTH *) authDes != NULL) ? 0 : 1;
> -
> -	//This last printf gives the result status to the tests suite
> -	//normally should be 0: test has passed or 1: test has failed
> -	printf("%d\n", test_status);
> -
> -	return test_status;
> -}
> diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/Makefile
> deleted file mode 100644
> index 23bf048f0..000000000
> --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/Makefile
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -#
> -#    Copyright (C) 2014, Oracle and/or its affiliates. All Rights Reserved.
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
> -
> -top_srcdir		?= ../../../../../../../..
> -
> -include	$(top_srcdir)/include/mk/env_pre.mk
> -include $(abs_srcdir)/../../../Makefile.inc
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/assertions.xml b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/assertions.xml
> deleted file mode 100644
> index a19e4c1f2..000000000
> --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/assertions.xml
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<assertions>
> -	<assertion id="1" tag="ef:XSH6TC2:3966:3967">
> -	Basic call of TIRPC authdes_seccreate() function
> -	</assertion>
> -</assertions>
> diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/tirpc_authdes_seccreate.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/tirpc_authdes_seccreate.c
> deleted file mode 100644
> index 87b07ec54..000000000
> --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/tirpc_authdes_seccreate.c
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -/*
> -* Copyright (c) Bull S.A.  2007 All Rights Reserved.
> -*
> -* This program is free software; you can redistribute it and/or modify it
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
> -* You should have received a copy of the GNU General Public License along
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
> -	//Program parameters : argc[1] : HostName or Host IP
> -	//                                         argc[2] : Server Program Number
> -	//                                         other arguments depend on test case
> -
> -	//run_mode can switch into stand alone program or program launch by shell script
> -	//1 : stand alone, debug mode, more screen information
> -	//0 : launch by shell script as test case, only one printf -> result status
> -	int run_mode = 0;
> -	int test_status = 1;	//Default test result set to FAILED
> -	int progNum = atoi(argc[2]);
> -	AUTH *authDes = NULL;
> -	struct sockaddr server_addr;
> -
> -	//Initialization
> -
> -	authDes = authdes_seccreate(argc[1], 60, (char *)&server_addr, NULL);
> -
> -	//If we are here, macro call was successful
> -	test_status = ((AUTH *) authDes != NULL) ? 0 : 1;
> -
> -	//This last printf gives the result status to the tests suite
> -	//normally should be 0: test has passed or 1: test has failed
> -	printf("%d\n", test_status);
> -
> -	return test_status;
> -}
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
