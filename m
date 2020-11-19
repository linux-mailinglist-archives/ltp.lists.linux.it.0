Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0702B8F67
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 10:52:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BE473C305A
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 10:52:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C4D173C2EB8
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 10:52:41 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2DCD5600A85
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 10:52:40 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id D39A1A08AE;
 Thu, 19 Nov 2020 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605779559; bh=WAQo5tlAdHQtCDEgnlp5yJKGjYNXYeXHdOv3hqKwkjk=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=XPRMofH1YT6oK60eviU2nyp5nYmErRM+D2tUnI8BywfByU//DWPXX0f2OoVi8zYKX
 o8Q0Alpj9JpK0K+VXZ1SeeOPEeDD05XjQ3OF0eSGrvQ9LtzHYnXCt7BOkQIEPx67L4
 Ua6gqdKUgHGJ0cGpn0zCpDUzmFQge8m1lHUCMM7Y=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Thu, 19 Nov 2020 10:52:27 +0100
Message-Id: <20201119095227.921830-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] realtime/m4: Re-add define for robust mutexattr APIs
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
Cc: Mathias Fiedler <mathias.fiedler@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Mathias Fiedler <mathias.fiedler@aox-tech.de>

This define is required by sbrk_mutex.c and testpi-6.c.
This define was dropped in
commit 3f6e7fe1e7d6afffb1db593e0dc14ca88a01cf66:
realtime: Fix pthread_mutexattr_{g,s}etrobust_np detection

Signed-off-by: Mathias Fiedler <mathias.fiedler@aox-tech.de>
Fixes: 3f6e7fe1e
---
 testcases/realtime/m4/check.m4 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/realtime/m4/check.m4 b/testcases/realtime/m4/check.m4
index 5aa53bd42..e4d4fac75 100644
--- a/testcases/realtime/m4/check.m4
+++ b/testcases/realtime/m4/check.m4
@@ -17,6 +17,7 @@ AC_DEFUN([REALTIME_CHECK_ROBUST_APIS],[
 	AC_CHECK_DECLS([pthread_mutexattr_getrobust, pthread_mutexattr_setrobust],[],[has_robust="no"],[[#include <pthread.h>]])
 	AC_MSG_CHECKING([for pthread_mutexattr_*robust* APIs])
 if test "x$has_robust" != "xno"; then
+	AC_DEFINE(HAS_PTHREAD_MUTEXTATTR_ROBUST_APIS,1,[Define to 1 if you have pthread_mutexattr_*robust* APIs])
 	AC_MSG_RESULT(yes)
 else
 	AC_MSG_RESULT(no)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
