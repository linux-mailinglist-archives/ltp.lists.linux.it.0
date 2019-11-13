Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A727FAEAD
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 11:42:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39CD03C2380
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 11:42:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2E9BE3C2291
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 11:42:15 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3D7AE1417251
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 11:42:09 +0100 (CET)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 9380F9F680;
 Wed, 13 Nov 2019 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1573641728; bh=p0bYlFifKEeIW6R6DKK+lv/UiFoXb/f0bbTG51DGgl0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=gqv+Av9/GU4gdI211XTNnywL9Mv/lVVpNBWEFcEsipbheUEfIO2ysfwR+6RWJiv95
 Xwk6A1GS/VbifKcQBeFUHGm+ZdrEvFyz7CzeyGFfamgFwLj/q3b3yLO4y2Yi1fVEow
 lbq3kNIv3GGoaNAqvWYYPyb4AL9OO3fuUUCerU1U=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Wed, 13 Nov 2019 11:41:49 +0100
Message-Id: <20191113104149.42407-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] configure.ac: Fix --with* options
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

The usage of AC_ARG_WITH was wrong. This resulted in unexpected configuration.
E.g --without-bash set with_bash=yes and --with-nume set with_numa=no.
This is fixed by using "$withval" in the action-if-given. Also all AC_ARG_WITH
are unified now (all use alos action-if-not-given)

The "default=" help text did not make sense for same options.
e.g. for --with expect was "default=yes", but it defaults to no.
The "default=" strings are dropped, because defaultness is indicated by
either "--with-<option>" or "--without-<option>" as done by other projects,
that use autoconf.

Defining AC_ARG_WITH within an if to express dependencies does not work.
./configure --with-realtime-testsuite set with_realtime_testsuite=yes,
even if with_bash=no or with_python=no. The check is removed completely.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 configure.ac | 46 ++++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/configure.ac b/configure.ac
index 62c5a0bb4..4b7c6d57c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -108,8 +108,9 @@ AC_CHECK_FUNCS([ \
 # Expect
 AC_ARG_WITH([bash],
   [AC_HELP_STRING([--with-bash],
-    [have the Bourne Again SHell interpreter (default=no)])],
-  [with_bash=yes],
+    [have the Bourne Again Shell interpreter])],
+  [with_bash=$withval],
+  [with_bash=no]
 )
 if test "x$with_bash" = xyes; then
     AC_SUBST([WITH_BASH],["yes"])
@@ -119,8 +120,8 @@ fi
 
 AC_ARG_WITH([expect],
   [AC_HELP_STRING([--with-expect],
-    [have the Tcl/expect library (default=yes)])],
-  [with_expect=yes],
+    [have the Tcl/expect library])],
+  [with_expect=$withval],
   [with_expect=no]
 )
 if test "x$with_expect" = xyes; then
@@ -132,16 +133,16 @@ fi
 # Numa
 AC_ARG_WITH([numa],
   AC_HELP_STRING([--without-numa],
-    [without numa support (default=no)]),
-  [with_numa=no],
+    [without numa support]),
+  [with_numa=$withval],
   [with_numa=yes]
 )
 
 # Perl
 AC_ARG_WITH([perl],
   [AC_HELP_STRING([--with-perl],
-    [have a perl interpreter (default=yes)])],
-  [with_perl=yes],
+    [have a perl interpreter])],
+  [with_perl=$withval],
   [with_perl=no]
 )
 if test "x$with_perl" = xyes; then
@@ -153,8 +154,8 @@ fi
 # Python
 AC_ARG_WITH([python],
   [AC_HELP_STRING([--with-python],
-    [have a python interpreter (default=yes)])],
-  [with_python=yes],
+    [have a python interpreter])],
+  [with_python=$withval],
   [with_python=no]
 )
 if test "x$with_python" = xyes; then
@@ -166,8 +167,8 @@ fi
 # TI RPC
 AC_ARG_WITH([tirpc],
   AC_HELP_STRING([--without-tirpc],
-    [without libtirpc support (default=no)]),
-  [with_tirpc=no],
+    [without libtirpc support]),
+  [with_tirpc=$withval],
   [with_tirpc=yes]
 )
 # END tools knobs
@@ -176,8 +177,9 @@ AC_ARG_WITH([tirpc],
 
 AC_ARG_WITH([open-posix-testsuite],
   [AC_HELP_STRING([--with-open-posix-testsuite],
-    [compile and install the open posix testsuite (default=no)])],
-  [with_open_posix_testsuite=$withval]
+    [compile and install the open posix testsuite])],
+  [with_open_posix_testsuite=$withval],
+  [with_open_posix_testsuite=no]
 )
 if test "x$with_open_posix_testsuite" = xyes; then
     AC_SUBST([WITH_OPEN_POSIX_TESTSUITE],["yes"])
@@ -185,14 +187,14 @@ else
     AC_SUBST([WITH_OPEN_POSIX_TESTSUITE],["no"])
 fi
 
-# testcases/realtime requires bash and python.
-if test "x$with_bash" = xyes && test "x$with_python" = xyes; then
-    AC_ARG_WITH([realtime-testsuite],
-      [AC_HELP_STRING([--with-realtime-testsuite],
-        [compile and install the realtime testsuite (default=no)])],
-      [with_realtime_testsuite=yes]
-    )
-fi
+# TODO: testcases/realtime requires bash and python.
+AC_ARG_WITH([realtime-testsuite],
+  [AC_HELP_STRING([--with-realtime-testsuite],
+    [compile and install the realtime testsuite])],
+  [with_realtime_testsuite=$withval],
+  [with_realtime_testsuite=no]
+)
+
 if test "x$with_realtime_testsuite" = xyes; then
     AC_SUBST([WITH_REALTIME_TESTSUITE],["yes"])
     # Run configure on testcases/realtime as well.
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
