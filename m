Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0154A189FB8
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 16:34:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7DCA3C5536
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 16:34:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 056FC3C5523
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 16:34:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 88092200B3F
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 16:34:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B70AAE57
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 15:34:17 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Mar 2020 16:37:56 +0100
Message-Id: <20200318153801.3529-5-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318153801.3529-1-chrubis@suse.cz>
References: <20200318153801.3529-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/9] include/tst_timer: Fix normalization
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
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
