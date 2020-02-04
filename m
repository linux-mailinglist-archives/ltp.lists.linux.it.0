Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 810DF151D27
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 16:25:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51EDB3C250F
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 16:25:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4385C3C2360
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 16:24:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DD9141401A76
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 16:24:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 88F19AE2D;
 Tue,  4 Feb 2020 15:24:40 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 Feb 2020 16:24:30 +0100
Message-Id: <20200204152430.10935-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204152430.10935-1-pvorel@suse.cz>
References: <20200204152430.10935-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 4/4] rpc-tirpc: Remove unused tests
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
Cc: Mike Frysinger <vapier@gentoo.org>, Steve Dickson <SteveD@RedHat.com>,
 libtirpc-devel@lists.sourceforge.net, Daniel Gryniewicz <dang@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Removed tests which were compiled but not run:

* tirpc_svc_6: multithreaded tests for all levels
* tirpc_svc_7: limits and dataint tests for all levels
* tirpc_svc_8: ping tests
* tirpc_svc_9: complex domain for all levels

Use of all but tirpc_svc_8 was removed in aa1e5d877 , tirpc_svc_8 was
never used since including in c0caf8f23. Removed, as it'd be probably
easier to write these tests from scratch than cleaning them.

Fixes: aa1e5d877 ("rpc-tirpc: removed legacy scripts and updated README")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/rpc/rpc-tirpc/.gitignore    |   4 -
 .../rpc-tirpc/tests_pack/tirpc_svc_6/Makefile |  23 --
 .../tests_pack/tirpc_svc_6/tirpc_svc_6.c      | 181 ---------------
 .../rpc-tirpc/tests_pack/tirpc_svc_7/Makefile |  23 --
 .../tests_pack/tirpc_svc_7/tirpc_svc_7.c      | 212 ------------------
 .../rpc-tirpc/tests_pack/tirpc_svc_8/Makefile |  23 --
 .../tests_pack/tirpc_svc_8/tirpc_svc_8.c      | 183 ---------------
 .../rpc-tirpc/tests_pack/tirpc_svc_9/Makefile |  23 --
 .../tests_pack/tirpc_svc_9/tirpc_svc_9.c      | 192 ----------------
 9 files changed, 864 deletions(-)
 delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/Makefile
 delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
 delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/Makefile
 delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
 delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/Makefile
 delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
 delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/Makefile
 delete mode 100644 testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c

diff --git a/testcases/network/rpc/rpc-tirpc/.gitignore b/testcases/network/rpc/rpc-tirpc/.gitignore
index 15b7c4d9c..6954e00d4 100644
--- a/testcases/network/rpc/rpc-tirpc/.gitignore
+++ b/testcases/network/rpc/rpc-tirpc/.gitignore
@@ -7,10 +7,6 @@
 /tests_pack/tirpc_svc_3/tirpc_svc_3
 /tests_pack/tirpc_svc_4/tirpc_svc_4
 /tests_pack/tirpc_svc_5/tirpc_svc_5
-/tests_pack/tirpc_svc_6/tirpc_svc_6
-/tests_pack/tirpc_svc_7/tirpc_svc_7
-/tests_pack/tirpc_svc_8/tirpc_svc_8
-/tests_pack/tirpc_svc_9/tirpc_svc_9
 /tests_pack/tirpc_svc_11/tirpc_svc_11
 /tests_pack/rpc_suite/rpc/rpc_stdcall_clnt_control/rpc_clnt_control
 /tests_pack/rpc_suite/rpc/rpc_stdcall_clnt_control/rpc_clnt_control_dataint
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/Makefile
deleted file mode 100644
index b5d08aa8b..000000000
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/Makefile
+++ /dev/null
@@ -1,23 +0,0 @@
-#
-#    Copyright (C) 2014, Oracle and/or its affiliates. All Rights Reserved.
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
-
-top_srcdir		?= ../../../../../..
-
-include	$(top_srcdir)/include/mk/env_pre.mk
-include $(abs_srcdir)/../Makefile.inc
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
deleted file mode 100644
index 1cc274431..000000000
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
+++ /dev/null
@@ -1,181 +0,0 @@
-/*
-* Copyright (c) Bull S.A.  2007 All Rights Reserved.
-*
-* This program is free software; you can redistribute it and/or modify it
-* under the terms of version 2 of the GNU General Public License as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it would be useful, but
-* WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-*
-* Further, this software is distributed without any warranty that it is
-* free of the rightful claim of any third person regarding infringement
-* or the like.  Any license provided herein, whether implied or
-* otherwise, applies only to this software file.  Patent licenses, if
-* any, provided herein do not apply to combinations of this program with
-* other software, or any other product whatsoever.
-*
-* You should have received a copy of the GNU General Public License along
-* with this program; if not, write the Free Software Foundation, Inc.,
-* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-*
-* History:
-* Created by: Cyril Lacabanne (Cyril.Lacabanne@bull.net)
-*
-*/
-
-#include <stdio.h>
-#include <string.h>
-#include <sys/socket.h>
-#include <errno.h>
-#include <pthread.h>
-#include <netinet/in.h>
-#include "rpc.h"
-
-//Standard define
-#define VERSNUM 1
-#define PROCSIMPLEPING	1
-#define PROGSYSERROR	10
-#define PROGAUTHERROR	100
-
-static void exm_proc();
-int progNum;
-int run_mode;
-
-void *server_thread_process(void *arg)
-{
-	//Server process in a thread
-	int err = 0;
-
-	if (run_mode == 1) {
-		printf("Server #%d launched\n", atoi(arg));
-		printf("Server Nb : %d\n", progNum + atoi(arg));
-	}
-
-	svc_unreg(progNum + (long)arg, VERSNUM);
-
-	err = svc_create(exm_proc, progNum + atoi(arg), VERSNUM, "VISIBLE");
-
-	if (err == 0) {
-		fprintf(stderr, "Cannot create service.\n");
-		exit(1);
-	}
-
-	svc_run();
-
-	fprintf(stderr, "svc_run() returned.  ERROR has occurred.\n");
-	svc_unreg(progNum, VERSNUM);
-
-	pthread_exit(0);
-}
-
-//****************************************//
-//***           Main Function          ***//
-//****************************************//
-int main(int argn, char *argc[])
-{
-	//Server parameter is : argc[1] : Server Program Number
-	//                                          argc[2] : Number of threads
-	//                                          others arguments depend on server program
-	run_mode = 0;
-	int threadNb = atoi(argc[2]);
-	long i;
-	//Thread declaration
-	pthread_t *pThreadArray;
-	void *ret;
-
-	progNum = atoi(argc[1]);
-
-	pThreadArray = malloc(threadNb * sizeof(pthread_t));
-	for (i = 0; i < threadNb; i++) {
-		if (run_mode == 1)
-			fprintf(stderr, "Try to create Thread Server %ld\n", i);
-		if (pthread_create
-		    (&pThreadArray[i], NULL, server_thread_process, (void*)i) < 0) {
-			fprintf(stderr, "pthread_create error for thread 1\n");
-			exit(1);
-		}
-	}
-
-	//Clean threads
-	for (i = 0; i < threadNb; i++) {
-		(void)pthread_join(pThreadArray[i], &ret);
-	}
-
-	return 1;
-}
-
-//****************************************//
-//***        Remotes Procedures        ***//
-//****************************************//
-char *simplePing(char *in)
-{
-	//printf("*** in Ping Func.\n");
-	//Simple function, returns what received
-	static int result = 0;
-	result = *in;
-	return (char *)&result;
-
-}
-
-//****************************************//
-//***       Dispatch Function          ***//
-//****************************************//
-static void exm_proc(struct svc_req *rqstp, SVCXPRT * transp)
-{
-	//printf("* in Dispatch Func.\n");
-	union {
-		int varIn;
-	} argument;
-
-	char *result;
-	xdrproc_t xdr_argument;
-	xdrproc_t xdr_result;
-	int *(*proc) (int *);
-
-	switch (rqstp->rq_proc) {
-	case PROCSIMPLEPING:
-		{
-			//printf("** in PROCPONG dispatch Func.\n");
-			xdr_argument = (xdrproc_t) xdr_int;
-			xdr_result = (xdrproc_t) xdr_int;
-			proc = (int *(*)(int *))simplePing;
-			break;
-		}
-	case PROGSYSERROR:
-		{
-			//Simulate an error
-			svcerr_systemerr(transp);
-			return;
-		}
-	case PROGAUTHERROR:
-		{
-			//Simulate an authentification error
-			svcerr_weakauth(transp);
-			return;
-		}
-	default:
-		{
-			//Proc is unavaible
-			svcerr_noproc(transp);
-			return;
-		}
-	}
-	memset((int *)&argument, (int)0, sizeof(argument));
-	if (svc_getargs(transp, xdr_argument, (int *)&argument) == FALSE) {
-		svcerr_decode(transp);
-		return;
-	}
-
-	result = (char *)(*proc) ((int *)&argument);
-
-	if ((result != NULL)
-	    && (svc_sendreply(transp, xdr_result, result) == FALSE)) {
-		svcerr_systemerr(transp);
-	}
-	if (svc_freeargs(transp, xdr_argument, (int *)&argument) == FALSE) {
-		(void)fprintf(stderr, "unable to free arguments\n");
-		exit(1);
-	}
-}
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/Makefile
deleted file mode 100644
index b5d08aa8b..000000000
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/Makefile
+++ /dev/null
@@ -1,23 +0,0 @@
-#
-#    Copyright (C) 2014, Oracle and/or its affiliates. All Rights Reserved.
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
-
-top_srcdir		?= ../../../../../..
-
-include	$(top_srcdir)/include/mk/env_pre.mk
-include $(abs_srcdir)/../Makefile.inc
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
deleted file mode 100644
index 962787e6a..000000000
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
+++ /dev/null
@@ -1,212 +0,0 @@
-/*
-* Copyright (c) Bull S.A.  2007 All Rights Reserved.
-*
-* This program is free software; you can redistribute it and/or modify it
-* under the terms of version 2 of the GNU General Public License as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it would be useful, but
-* WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-*
-* Further, this software is distributed without any warranty that it is
-* free of the rightful claim of any third person regarding infringement
-* or the like.  Any license provided herein, whether implied or
-* otherwise, applies only to this software file.  Patent licenses, if
-* any, provided herein do not apply to combinations of this program with
-* other software, or any other product whatsoever.
-*
-* You should have received a copy of the GNU General Public License along
-* with this program; if not, write the Free Software Foundation, Inc.,
-* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-*
-* History:
-* Created by: Cyril Lacabanne (Cyril.Lacabanne@bull.net)
-*
-*/
-
-#include <stdio.h>
-#include <string.h>
-#include <sys/socket.h>
-#include <errno.h>
-#include <netinet/in.h>
-#include "rpc.h"
-
-//Standard define
-#define VERSNUM 1
-//Define limits test proc
-#define PROCSIMPLEPING	1
-//Define DataInt procs
-#define INTPROCNUM 10
-#define DBLPROCNUM 20
-#define LNGPROCNUM 30
-#define STRPROCNUM 40
-
-static void exm_proc();
-
-union u_argument {
-	int varInt;
-	double dbl;
-	long lng;
-	char *str;
-} argument;
-
-//****************************************//
-//***           Main Function          ***//
-//****************************************//
-int main(int argn, char *argc[])
-{
-	int progNum = atoi(argc[1]);
-	SVCXPRT *transp = NULL;
-	struct netconfig *nconf;
-
-	//Initialization
-	svc_unreg(progNum, VERSNUM);
-
-	if ((nconf = getnetconfigent("udp")) == NULL) {
-		fprintf(stderr, "Cannot get netconfig entry for UDP\n");
-		exit(1);
-	}
-
-	transp = svc_tp_create(exm_proc, progNum, VERSNUM, nconf);
-
-	if (transp == NULL) {
-		fprintf(stderr, "Cannot create service.\n");
-		exit(1);
-	}
-
-	if (!svc_reg(transp, progNum, VERSNUM, exm_proc, nconf)) {
-		fprintf(stderr, "svc_reg failed!!\n");
-		exit(1);
-	}
-
-	svc_run();
-
-	fprintf(stderr, "svc_run() returned.  ERROR has occurred.\n");
-	svc_unreg(progNum, VERSNUM);
-
-	return 1;
-}
-
-//****************************************//
-//***        Remotes Procedures        ***//
-//****************************************//
-char *simplePing(union u_argument *in)
-{
-	//printf("*** in Ping Func.\n");
-	//Simple function, returns what received
-	static int result;
-	result = in->varInt;
-	return (char *)&result;
-}
-
-char *intTestProc(union u_argument *in)
-{
-	//printf("*** in intTestProc.\n");
-	//returns what received
-	static int result;
-	result = in->varInt;
-	//printf("%d\n", result);
-	return (char *)&result;
-}
-
-char *lngTestProc(union u_argument *in)
-{
-	//printf("*** in lngTestProc.\n");
-	//returns what received
-	static long result;
-	result = in->lng;
-	//printf("%ld\n", result);
-	return (char *)&result;
-}
-
-char *dblTestProc(union u_argument *in)
-{
-	//printf("*** in dblTestProc.\n");
-	//returns what received
-	static double result;
-	result = in->dbl;
-	//printf("%lf\n", result);
-	return (char *)&result;
-}
-
-char *strTestProc(union u_argument *in)
-{
-	//printf("*** in strTestProc.\n");
-	//returns what received
-	static char *result;
-	result = in->str;
-	//printf("%s\n", result);
-	return (char *)&result;
-}
-
-//****************************************//
-//***       Dispatch Function          ***//
-//****************************************//
-static void exm_proc(struct svc_req *rqstp, SVCXPRT * transp)
-{
-	char *result;
-	xdrproc_t xdr_argument;
-	xdrproc_t xdr_result;
-	char *(*proc) (union u_argument *);
-
-	switch (rqstp->rq_proc) {
-	case PROCSIMPLEPING:
-		{
-			xdr_argument = (xdrproc_t) xdr_int;
-			xdr_result = (xdrproc_t) xdr_int;
-			proc = (char *(*)(union u_argument *))simplePing;
-			break;
-		}
-	case INTPROCNUM:
-		{
-			xdr_argument = (xdrproc_t) xdr_int;
-			xdr_result = (xdrproc_t) xdr_int;
-			proc = (char *(*)(union u_argument *))intTestProc;
-			break;
-		}
-	case DBLPROCNUM:
-		{
-			xdr_argument = (xdrproc_t) xdr_double;
-			xdr_result = (xdrproc_t) xdr_double;
-			proc = (char *(*)(union u_argument *))dblTestProc;
-			break;
-		}
-	case LNGPROCNUM:
-		{
-			xdr_argument = (xdrproc_t) xdr_long;
-			xdr_result = (xdrproc_t) xdr_long;
-			proc = (char *(*)(union u_argument *))lngTestProc;
-			break;
-		}
-	case STRPROCNUM:
-		{
-			xdr_argument = (xdrproc_t) xdr_wrapstring;
-			xdr_result = (xdrproc_t) xdr_wrapstring;
-			proc = (char *(*)(union u_argument *))strTestProc;
-			break;
-		}
-	default:
-		{
-			//Proc is unavaible
-			svcerr_noproc(transp);
-			return;
-		}
-	}
-	memset((char *)&argument, (int)0, sizeof(argument));
-	if (svc_getargs(transp, xdr_argument, (char *)&argument) == FALSE) {
-		svcerr_decode(transp);
-		return;
-	}
-
-	result = (char *)(*proc) ((union u_argument *)&argument);
-
-	if ((result != NULL)
-	    && (svc_sendreply(transp, xdr_result, (char *)result) == FALSE)) {
-		svcerr_systemerr(transp);
-	}
-	if (svc_freeargs(transp, xdr_argument, (char *)&argument) == FALSE) {
-		(void)fprintf(stderr, "unable to free arguments\n");
-		exit(1);
-	}
-}
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/Makefile
deleted file mode 100644
index b5d08aa8b..000000000
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/Makefile
+++ /dev/null
@@ -1,23 +0,0 @@
-#
-#    Copyright (C) 2014, Oracle and/or its affiliates. All Rights Reserved.
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
-
-top_srcdir		?= ../../../../../..
-
-include	$(top_srcdir)/include/mk/env_pre.mk
-include $(abs_srcdir)/../Makefile.inc
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
deleted file mode 100644
index 3137c5014..000000000
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
+++ /dev/null
@@ -1,183 +0,0 @@
-/*
-* Copyright (c) Bull S.A.  2007 All Rights Reserved.
-*
-* This program is free software; you can redistribute it and/or modify it
-* under the terms of version 2 of the GNU General Public License as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it would be useful, but
-* WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-*
-* Further, this software is distributed without any warranty that it is
-* free of the rightful claim of any third person regarding infringement
-* or the like.  Any license provided herein, whether implied or
-* otherwise, applies only to this software file.  Patent licenses, if
-* any, provided herein do not apply to combinations of this program with
-* other software, or any other product whatsoever.
-*
-* You should have received a copy of the GNU General Public License along
-* with this program; if not, write the Free Software Foundation, Inc.,
-* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-*
-* History:
-* Created by: Cyril Lacabanne (Cyril.Lacabanne@bull.net)
-*
-*/
-
-#include <stdio.h>
-#include <string.h>
-#include <pthread.h>
-#include <sys/socket.h>
-#include <errno.h>
-#include <netinet/in.h>
-#include "rpc.h"
-
-//Standard define
-#define VERSNUM 1
-#define PINGPROC	1
-#define PROGSYSERROR	10
-#define PROGAUTHERROR	100
-
-static void exm_proc();
-int progNum;
-int run_mode;
-
-void *server_thread_process(void *arg)
-{
-	//Server process in a thread
-	int err = 0;
-	int i = (long)arg;
-
-	if (run_mode == 1) {
-		printf("Server #%d launched\n", i);
-		printf("Server Nb : %d\n", progNum + i);
-	}
-
-	svc_unreg(progNum + atoi(arg), VERSNUM);
-
-	err = svc_create(exm_proc, progNum + atoi(arg), VERSNUM, "VISIBLE");
-
-	if (err == 0) {
-		fprintf(stderr, "Cannot create service.\n");
-		exit(1);
-	}
-
-	svc_run();
-
-	fprintf(stderr, "svc_run() returned.  ERROR has occurred.\n");
-	svc_unreg(progNum, VERSNUM);
-
-	pthread_exit(0);
-}
-
-//****************************************//
-//***           Main Function          ***//
-//****************************************//
-int main(int argn, char *argc[])
-{
-	//Server parameter is : argc[1] : Server Program Number
-	//                                          argc[2] : Number of threads
-	//                                          others arguments depend on server program
-	run_mode = 0;
-	int threadNb = atoi(argc[2]);
-	long i;
-	//Thread declaration
-	pthread_t *pThreadArray;
-	void *ret;
-
-	progNum = atoi(argc[1]);
-
-	pThreadArray = malloc(threadNb * sizeof(pthread_t));
-	for (i = 0; i < threadNb; i++) {
-		if (run_mode == 1)
-			fprintf(stderr, "Try to create Thread Server %ld\n", i);
-		if (pthread_create
-		    (&pThreadArray[i], NULL, server_thread_process, (void*)i) < 0) {
-			fprintf(stderr, "pthread_create error for thread 1\n");
-			exit(1);
-		}
-	}
-
-	//Clean threads
-	for (i = 0; i < threadNb; i++) {
-		(void)pthread_join(pThreadArray[i], &ret);
-	}
-
-	return 1;
-}
-
-//****************************************//
-//***        Remotes Procedures        ***//
-//****************************************//
-char *pingProc(int *dt)
-{
-	//Makes a + b * c from structure dt and returns double
-	//printf("*** In calcProc ***\n");
-	static int result = 0;
-	result = *dt;
-	//printf("Received : %lf, %lf, %lf\n", dt->a, dt->b, dt->c);
-	return (char *)&result;
-}
-
-//****************************************//
-//***       Dispatch Function          ***//
-//****************************************//
-static void exm_proc(struct svc_req *rqstp, SVCXPRT * transp)
-{
-	//printf("* in Dispatch Func.\n");
-
-	char *result;
-	xdrproc_t xdr_argument;
-	xdrproc_t xdr_result;
-	int *(*proc) (int *);
-
-	union {
-		int varIn;
-	} argument;
-
-	switch (rqstp->rq_proc) {
-	case PINGPROC:
-		{
-			//printf("** in PROCPONG dispatch Func.\n");
-			xdr_argument = (xdrproc_t) xdr_int;
-			xdr_result = (xdrproc_t) xdr_int;
-			proc = (int *(*)(int *))pingProc;
-			break;
-		}
-	case PROGSYSERROR:
-		{
-			//Simulate an error
-			svcerr_systemerr(transp);
-			return;
-		}
-	case PROGAUTHERROR:
-		{
-			//Simulate an authentification error
-			svcerr_weakauth(transp);
-			return;
-		}
-	default:
-		{
-			//Proc is unavaible
-			svcerr_noproc(transp);
-			return;
-		}
-	}
-	memset((int *)&argument, (int)0, sizeof(argument));
-	if (svc_getargs(transp, xdr_argument, (char *)&argument) == FALSE) {
-		svcerr_decode(transp);
-		return;
-	}
-
-	result = (char *)(*proc) ((int *)&argument);
-
-	if ((result != NULL)
-	    && (svc_sendreply(transp, xdr_result, result) == FALSE)) {
-		svcerr_systemerr(transp);
-	}
-	if (svc_freeargs(transp, xdr_argument, (char *)&argument) == FALSE) {
-		(void)fprintf(stderr, "unable to free arguments\n");
-		exit(1);
-	}
-}
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/Makefile
deleted file mode 100644
index b5d08aa8b..000000000
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/Makefile
+++ /dev/null
@@ -1,23 +0,0 @@
-#
-#    Copyright (C) 2014, Oracle and/or its affiliates. All Rights Reserved.
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
-
-top_srcdir		?= ../../../../../..
-
-include	$(top_srcdir)/include/mk/env_pre.mk
-include $(abs_srcdir)/../Makefile.inc
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
deleted file mode 100644
index 75f1254a5..000000000
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
+++ /dev/null
@@ -1,192 +0,0 @@
-/*
-* Copyright (c) Bull S.A.  2007 All Rights Reserved.
-*
-* This program is free software; you can redistribute it and/or modify it
-* under the terms of version 2 of the GNU General Public License as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it would be useful, but
-* WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-*
-* Further, this software is distributed without any warranty that it is
-* free of the rightful claim of any third person regarding infringement
-* or the like.  Any license provided herein, whether implied or
-* otherwise, applies only to this software file.  Patent licenses, if
-* any, provided herein do not apply to combinations of this program with
-* other software, or any other product whatsoever.
-*
-* You should have received a copy of the GNU General Public License along
-* with this program; if not, write the Free Software Foundation, Inc.,
-* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-*
-* History:
-* Created by: Cyril Lacabanne (Cyril.Lacabanne@bull.net)
-*
-*/
-
-#include <stdio.h>
-#include <string.h>
-#include <pthread.h>
-#include <sys/socket.h>
-#include <errno.h>
-#include <netinet/in.h>
-#include "rpc.h"
-
-//Standard define
-#define VERSNUM 1
-#define PROGSYSERROR	10
-#define PROGAUTHERROR	100
-#define CALCTHREADPROC	1000
-
-static void exm_proc();
-int progNum;
-int run_mode;
-
-struct datas {
-	double a;
-	double b;
-	double c;
-} argument;
-
-//XDR Struct function
-bool_t xdr_datas(XDR * pt_xdr, struct datas *pt)
-{
-	return (xdr_double(pt_xdr, &(pt->a)) &&
-		xdr_double(pt_xdr, &(pt->b)) && xdr_double(pt_xdr, &(pt->c)));
-}
-
-void *server_thread_process(void *arg)
-{
-	//Server process in a thread
-	int err = 0;
-	int i = (long)arg;
-
-	if (run_mode == 1) {
-		printf("Server #%d launched\n", i);
-		printf("Server Nb : %d\n", progNum + i);
-	}
-
-	svc_unreg(progNum + atoi(arg), VERSNUM);
-
-	err = svc_create(exm_proc, progNum + atoi(arg), VERSNUM, "VISIBLE");
-
-	if (err == 0) {
-		fprintf(stderr, "Cannot create service.\n");
-		exit(1);
-	}
-
-	svc_run();
-
-	fprintf(stderr, "svc_run() returned.  ERROR has occurred.\n");
-	svc_unreg(progNum, VERSNUM);
-
-	pthread_exit(0);
-}
-
-//****************************************//
-//***           Main Function          ***//
-//****************************************//
-int main(int argn, char *argc[])
-{
-	//Server parameter is : argc[1] : Server Program Number
-	//                                          argc[2] : Number of threads
-	//                                          others arguments depend on server program
-	run_mode = 0;
-	int threadNb = atoi(argc[2]);
-	long i;
-	//Thread declaration
-	pthread_t *pThreadArray;
-	void *ret;
-
-	progNum = atoi(argc[1]);
-
-	pThreadArray = malloc(threadNb * sizeof(pthread_t));
-	for (i = 0; i < threadNb; i++) {
-		if (run_mode == 1)
-			fprintf(stderr, "Try to create Thread Server %ld\n", i);
-		if (pthread_create
-		    (&pThreadArray[i], NULL, server_thread_process, (void*)i) < 0) {
-			fprintf(stderr, "pthread_create error for thread 1\n");
-			exit(1);
-		}
-	}
-
-	//Clean threads
-	for (i = 0; i < threadNb; i++) {
-		(void)pthread_join(pThreadArray[i], &ret);
-	}
-
-	return 1;
-}
-
-//****************************************//
-//***        Remotes Procedures        ***//
-//****************************************//
-char *calcProc(struct datas *dt)
-{
-	//Makes a + b * c from structure dt and returns double
-	//printf("*** In calcProc ***\n");
-	static double result = 0;
-	result = dt->a + (dt->b * dt->c);
-	//printf("Received : %lf, %lf, %lf\n", dt->a, dt->b, dt->c);
-	return (char *)&result;
-}
-
-//****************************************//
-//***       Dispatch Function          ***//
-//****************************************//
-static void exm_proc(struct svc_req *rqstp, SVCXPRT * transp)
-{
-	//printf("* in Dispatch Func.\n");
-
-	char *result;
-	xdrproc_t xdr_argument;
-	xdrproc_t xdr_result;
-	int *(*proc) (struct datas *);
-
-	switch (rqstp->rq_proc) {
-	case CALCTHREADPROC:
-		{
-			//printf("** in PROCPONG dispatch Func.\n");
-			xdr_argument = (xdrproc_t) xdr_datas;
-			xdr_result = (xdrproc_t) xdr_double;
-			proc = (int *(*)(struct datas *))calcProc;
-			break;
-		}
-	case PROGSYSERROR:
-		{
-			//Simulate an error
-			svcerr_systemerr(transp);
-			return;
-		}
-	case PROGAUTHERROR:
-		{
-			//Simulate an authentification error
-			svcerr_weakauth(transp);
-			return;
-		}
-	default:
-		{
-			//Proc is unavaible
-			svcerr_noproc(transp);
-			return;
-		}
-	}
-	memset((int *)&argument, (int)0, sizeof(argument));
-	if (svc_getargs(transp, xdr_argument, (char *)&argument) == FALSE) {
-		svcerr_decode(transp);
-		return;
-	}
-
-	result = (char *)(*proc) ((struct datas *)&argument);
-
-	if ((result != NULL)
-	    && (svc_sendreply(transp, xdr_result, result) == FALSE)) {
-		svcerr_systemerr(transp);
-	}
-	if (svc_freeargs(transp, xdr_argument, (char *)&argument) == FALSE) {
-		(void)fprintf(stderr, "unable to free arguments\n");
-		exit(1);
-	}
-}
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
