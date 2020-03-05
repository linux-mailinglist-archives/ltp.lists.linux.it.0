Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F5017A6AD
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:49:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B25943C6538
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:49:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7CA5F3C650A
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:48:38 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 44328600BC8
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:48:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE4E7B129
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 13:48:37 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Mar 2020 14:48:29 +0100
Message-Id: <20200305134834.16736-4-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200305134834.16736-1-chrubis@suse.cz>
References: <20200305134834.16736-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/8] include/tst_timer: Fix normalization
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

The timespec_add and timespec_sub functions were producing incorrect
results when passed negative input. We have to normalize the result in
both cases for nseconds < 0 && nseconds > 1s.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_timer.h | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index de60bc62a..b091137dc 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -134,6 +134,21 @@ static inline int tst_timespec_lt(struct timespec t1, struct timespec t2)
 	return t1.tv_sec < t2.tv_sec;
 }
 
+static inline struct timespec tst_timespec_normalize(struct timespec t)
+{
+	if (t.tv_nsec >= 1000000000) {
+		t.tv_sec++;
+		t.tv_nsec -= 1000000000;
+	}
+
+	if (t.tv_nsec < 0) {
+		t.tv_sec--;
+		t.tv_nsec += 1000000000;
+	}
+
+	return t;
+}
+
 /*
  * Adds us microseconds to t.
  */
@@ -143,12 +158,8 @@ static inline struct timespec tst_timespec_add_us(struct timespec t,
 	t.tv_sec += us / 1000000;
 	t.tv_nsec += (us % 1000000) * 1000;
 
-	if (t.tv_nsec >= 1000000000) {
-		t.tv_sec++;
-		t.tv_nsec -= 1000000000;
-	}
 
-	return t;
+	return tst_timespec_normalize(t);
 }
 
 /*
@@ -162,12 +173,7 @@ static inline struct timespec tst_timespec_add(struct timespec t1,
 	res.tv_sec = t1.tv_sec + t2.tv_sec;
 	res.tv_nsec = t1.tv_nsec + t2.tv_nsec;
 
-	if (res.tv_nsec >= 1000000000) {
-		res.tv_sec++;
-		res.tv_nsec -= 1000000000;
-	}
-
-	return res;
+	return tst_timespec_normalize(res);
 }
 
 /*
@@ -179,12 +185,7 @@ static inline struct timespec tst_timespec_sub_us(struct timespec t,
 	t.tv_sec -= us / 1000000;
 	t.tv_nsec -= (us % 1000000) * 1000;
 
-	if (t.tv_nsec < 0) {
-		t.tv_sec--;
-		t.tv_nsec += 1000000000;
-	}
-
-	return t;
+	return tst_timespec_normalize(t);
 }
 
 /*
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
