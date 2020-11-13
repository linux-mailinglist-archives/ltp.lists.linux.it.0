Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B55712B1F34
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 16:51:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 777A13C5FDA
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 16:51:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 46FF63C2EBE
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 16:51:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EC470601405
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 16:51:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87F02ADD6;
 Fri, 13 Nov 2020 15:51:34 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 16:51:22 +0100
Message-Id: <20201113155123.5959-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113155123.5959-1-pvorel@suse.cz>
References: <20201113155123.5959-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/5] fanotify: Check FAN_REPORT_{FID, NAME} support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

in safe_fanotify_init()

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v2.

 testcases/kernel/syscalls/fanotify/fanotify.h | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 8452f983a..277760c09 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -48,11 +48,24 @@ int safe_fanotify_init(const char *file, const int lineno,
 
 	if (rval == -1) {
 		if (errno == ENOSYS) {
-			tst_brk(TCONF,
-				"fanotify is not configured in this kernel.");
+			tst_brk(TCONF, "%s:%d: fanotify is not configured in this kernel",
+				file, lineno);
 		}
-		tst_brk(TBROK | TERRNO,
-			"%s:%d: fanotify_init() failed", file, lineno);
+
+		if (errno == EINVAL) {
+			if (flags & FAN_REPORT_FID) {
+				tst_brk(TCONF, "%s:%d: FAN_REPORT_FID not supported by kernel?",
+					file, lineno);
+			}
+
+			if (flags & FAN_REPORT_NAME) {
+				tst_brk(TCONF, "%s:%d: FAN_REPORT_NAME not supported by kernel?",
+					file, lineno);
+			}
+		}
+
+		tst_brk(TBROK | TERRNO, "%s:%d: fanotify_init() failed",
+			file, lineno);
 	}
 #else
 	tst_brk(TCONF, "Header <sys/fanotify.h> is not present");
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
