Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B06842F7F51
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 16:18:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 393C03C6A29
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 16:18:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A34D43C3119
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 16:18:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 33C342000A7
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 16:18:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D631AB7F;
 Fri, 15 Jan 2021 15:18:36 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 15 Jan 2021 16:19:36 +0100
Message-Id: <20210115151936.18809-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] include/tst_timer.h: Fix overflows
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

This fixes overflows in tst_timeval_to_us() and tst_timeval_to_ns() on
32bit hardware. We have to cast the tv_sec (ulong) to (long long)
explicitly otherwise the tv_sec will overflow the multiplication.

This fixes clock_gettime04 where the overflow corrupted the result from
gettimeofday() when it was converted from timeval to timespec.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 include/tst_timer.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 657c0824f..4a79ae208 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -26,7 +26,7 @@
  */
 static inline long long tst_timeval_to_us(struct timeval t)
 {
-	return t.tv_sec * 1000000 + t.tv_usec;
+	return ((long long)t.tv_sec) * 1000000 + t.tv_usec;
 }
 
 /*
@@ -34,7 +34,7 @@ static inline long long tst_timeval_to_us(struct timeval t)
  */
 static inline long long tst_timeval_to_ms(struct timeval t)
 {
-	return t.tv_sec * 1000 + (t.tv_usec + 500) / 1000;
+	return ((long long)t.tv_sec) * 1000 + (t.tv_usec + 500) / 1000;
 }
 
 /*
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
