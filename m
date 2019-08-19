Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F93892530
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 15:36:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E86B23C1CE5
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 15:36:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B55513C1C6D
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 15:36:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F4077200B2B
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 15:36:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 34894AF47
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 13:36:25 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Mon, 19 Aug 2019 15:36:18 +0200
Message-Id: <20190819133618.7538-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_res: Print errno number in addition to error name
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Occasionally new error numbers are added to the kernel (maybe by
accident). Currently if we do not know the name of them then we just print
???.

This commit simply always prints the error number to aid with debugging.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

It appears we are atleast missing ENOTSUPP (524) which is probably returned by
create_timer for some alarm clocks on none x86 arches. This isn't entirely
clear, but what is clear is that it would help to know what the error number
is without using strace.

 lib/tst_test.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 245e287fa..46481ca3f 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -177,7 +177,7 @@ static void print_result(const char *file, const int lineno, int ttype,
 {
 	char buf[1024];
 	char *str = buf;
-	int ret, size = sizeof(buf), ssize;
+	int ret, size = sizeof(buf), ssize, int_errno;
 	const char *str_errno = NULL;
 	const char *res;
 
@@ -205,15 +205,19 @@ static void print_result(const char *file, const int lineno, int ttype,
 		abort();
 	}
 
-	if (ttype & TERRNO)
+	if (ttype & TERRNO) {
 		str_errno = tst_strerrno(errno);
+		int_errno = errno;
+	}
 
-	if (ttype & TTERRNO)
+	if (ttype & TTERRNO) {
 		str_errno = tst_strerrno(TST_ERR);
+		int_errno = TST_ERR;
+	}
 
 	if (ttype & TRERRNO) {
-		ret = TST_RET < 0 ? -(int)TST_RET : (int)TST_RET;
-		str_errno = tst_strerrno(ret);
+		int_errno = TST_RET < 0 ? -(int)TST_RET : (int)TST_RET;
+		str_errno = tst_strerrno(int_errno);
 	}
 
 	ret = snprintf(str, size, "%s:%i: ", file, lineno);
@@ -237,7 +241,7 @@ static void print_result(const char *file, const int lineno, int ttype,
 				"Next message is too long and truncated:");
 	} else if (str_errno) {
 		ssize = size - 2;
-		ret = snprintf(str, size, ": %s", str_errno);
+		ret = snprintf(str, size, ": %s (%d)", str_errno, int_errno);
 		str += MIN(ret, ssize);
 		size -= MIN(ret, ssize);
 		if (ret >= ssize)
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
