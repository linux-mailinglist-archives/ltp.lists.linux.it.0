Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E75FC7B0
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 16:49:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 888D83CAEB4
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 16:49:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E14403C9590
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 16:48:39 +0200 (CEST)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1E377140055E
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 16:48:39 +0200 (CEST)
Received: by mail-pf1-x449.google.com with SMTP id
 cw4-20020a056a00450400b00561ec04e77aso9043103pfb.12
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 07:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=N/HwfwTwEUrepO7j/Cvqy6S8AQZFC1SZz9WvuQfJrL0=;
 b=HbMg8zpHhyKE6xjKY++psPVXHaXiodmhhy0z83i4/yMF2jxQK0iUEV0Cxj4o7YDUEg
 q6YUFyHn14wkKv2EHtoLxHtqUQ216Pa/PwgdNElZDFAxyXcotladuNC7NjDsGq3etcam
 Btm7OJAYe13BNYft/IAeKiEkqKU5t1UIwKwbKthJKFObaxML8CbERe+QvG/K4m5qRFqb
 9E9x7WtCY4FCcDuIKo5EutSwC5gI2tiKt8E6lEumdeuV+L4kmN3sS+Vy3C74aL9VIEDD
 HogpFOraHYKm531C5tdQxj4zMjhd9CzkwVZtyOBtlNW7mmHSMP1CgbdZ4MGXKD5iLwAN
 HBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/HwfwTwEUrepO7j/Cvqy6S8AQZFC1SZz9WvuQfJrL0=;
 b=cuG+5Ynk0HGqiXMcIRu1WGvgzEouzRQAi5U/oJuKihApnoLbzeP1Qyaa2mjlwJHlDo
 /DDqFSU0b8AObxoe2U33C1sS9bA6vjvfsTiRE8oBWJk9v4IA5dilDsHxSXr/imwnAmWn
 cPGGN1/cW9dPyaPxT7Sd9b9IiCvMseNO819Fcy8289dgLgU324POpTv3mpAXaFRSrixb
 jc2at8xAO6Tt7TAP4KtUU2lrMBLnGZnwh/rHDp5SX652fpFCPiagk7f0xkaBlh8SSVPb
 k+WSXNIGSxrdveHyNqP0tGp6tc3kC/KAOuK2WhqkNj922zZOOUNPnQSanoxGkJXeEj0c
 taaw==
X-Gm-Message-State: ACrzQf03tXl8efenKRWX1/0DX/Whow3oAiDAoexJySeGA0VeS1haehxh
 F26efXc2biClfIPqlLX63O3uhyaR3y7HBql/VjgvFSFXXGGs2Z0MklA4D8vpdmHVnEQ/CME5kq6
 yMHNmaOtMtE3v/OnpYV8f7abT71lUILo7NUcyuFHchQlfP7DWhodIcSFD
X-Google-Smtp-Source: AMsMyM7T3gYNQNHbWuHSPijY7I1YmrsGwv2iegtOmjLjHfzA1+bN7NmeZG7QECw5kwCf+qjN5VzggLQ4Hm4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:2181:b0:51b:560b:dd30 with SMTP id
 h1-20020a056a00218100b0051b560bdd30mr31374446pfi.44.1665586117489; Wed, 12
 Oct 2022 07:48:37 -0700 (PDT)
Date: Wed, 12 Oct 2022 14:48:21 +0000
In-Reply-To: <20221012144823.1595671-1-edliaw@google.com>
Mime-Version: 1.0
References: <20221012144823.1595671-1-edliaw@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221012144823.1595671-4-edliaw@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v5 3/5] mmapstress01: define fsize bounds by file
 offset bits
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 .../kernel/mem/mmapstress/mmapstress01.c      | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/mem/mmapstress/mmapstress01.c b/testcases/kernel/mem/mmapstress/mmapstress01.c
index dee73de5e..ea818ffcd 100644
--- a/testcases/kernel/mem/mmapstress/mmapstress01.c
+++ b/testcases/kernel/mem/mmapstress/mmapstress01.c
@@ -36,6 +36,13 @@
 #include <float.h>
 #include "tst_test.h"
 
+#if _FILE_OFFSET_BITS == 64
+# define FSIZE_MIN LONG_MIN
+# define FSIZE_MAX LONG_MAX
+#else
+# define FSIZE_MIN INT_MIN
+# define FSIZE_MAX INT_MAX
+#endif
 #define MAXLOOPS	500	/* max pages for map children to write */
 #define TEST_FILE	"mmapstress01.out"
 
@@ -83,18 +90,10 @@ static void setup(void)
 {
 	int pagesize = sysconf(_SC_PAGE_SIZE);
 
-#if _FILE_OFFSET_BITS == 64
-	if (tst_parse_filesize(opt_filesize, &filesize, 0, LONG_MAX))
-#else
-	if (tst_parse_filesize(opt_filesize, &filesize, 0, INT_MAX))
-#endif
+	if (tst_parse_filesize(opt_filesize, &filesize, 0, FSIZE_MAX))
 		tst_brk(TBROK, "invalid initial filesize '%s'", opt_filesize);
 
-#if _FILE_OFFSET_BITS == 64
-	if (tst_parse_filesize(opt_sparseoffset, &sparseoffset, LONG_MIN, LONG_MAX))
-#else
-	if (tst_parse_filesize(opt_sparseoffset, &sparseoffset, INT_MIN, INT_MAX))
-#endif
+	if (tst_parse_filesize(opt_sparseoffset, &sparseoffset, FSIZE_MIN, FSIZE_MAX))
 		tst_brk(TBROK, "invalid sparse offset '%s'", opt_sparseoffset);
 	if (sparseoffset % pagesize != 0)
 		tst_brk(TBROK, "sparseoffset must be pagesize multiple");
-- 
2.38.0.rc1.362.ged0d419d3c-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
