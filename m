Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC4A2992F0
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:50:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 617383C313A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:50:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 82C7A3C23B9
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BEB851000A50
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2BA99ADE2
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:48:06 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 17:47:54 +0100
Message-Id: <20201026164756.30556-18-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026164756.30556-1-mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 17/19] Unify error handling in include/tst_safe_prw.h
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

- Pedantically check syscall return values

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/tst_safe_prw.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/tst_safe_prw.h b/include/tst_safe_prw.h
index 01a684da3..2e506cb41 100644
--- a/include/tst_safe_prw.h
+++ b/include/tst_safe_prw.h
@@ -15,8 +15,12 @@ static inline ssize_t safe_pread(const char *file, const int lineno,
 
 	if (rval == -1 || (len_strict && (size_t)rval != nbyte)) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
-			 "pread(%d,%p,%zu,%lld) failed",
-			 fildes, buf, nbyte, (long long)offset);
+			"pread(%d,%p,%zu,%lld) failed",
+			fildes, buf, nbyte, (long long)offset);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid pread(%d,%p,%zu,%lld) return value %zd",
+			fildes, buf, nbyte, (long long)offset, rval);
 	}
 
 	return rval;
@@ -34,8 +38,12 @@ static inline ssize_t safe_pwrite(const char *file, const int lineno,
 	rval = pwrite(fildes, buf, nbyte, offset);
 	if (rval == -1 || (len_strict && (size_t)rval != nbyte)) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
-			 "pwrite(%d,%p,%zu,%lld) failed",
-			 fildes, buf, nbyte, (long long)offset);
+			"pwrite(%d,%p,%zu,%lld) failed",
+			fildes, buf, nbyte, (long long)offset);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid pwrite(%d,%p,%zu,%lld) return value %zd",
+			fildes, buf, nbyte, (long long)offset, rval);
 	}
 
 	return rval;
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
