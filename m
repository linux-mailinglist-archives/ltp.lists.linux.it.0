Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 842D5340692
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:12:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 407F83C609A
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:12:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 406793C8569
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:44 +0100 (CET)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DF95910011A3
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:43 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id x13so5484442wrs.9
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 06:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hZ5q+wB/tYPT9/rA2rLaJGKjZnxaqF5TB5kijLIsi2E=;
 b=VznjvVJ6rJxy/PCTkTwVZpncR0x3UUNp5U4tAw6cvtaKNNU9+WDv4S0X4gPJdENFRe
 sJlJ1bPzBmgv8AAnKgSSmA1d4k39+G9hQJWVMm0BwoBA2RDh331hDdaJ4syw2OQJ17OP
 plqw02kamgvnghNEiUydWuDyuDJQDm3IYmqiJEExFg+LL/OMx5M7okw3Z1YkhVfRa3Li
 78MBJg1rUKSbL6jft0oK4/XNXCSKIzpNx8XYyFoLkH01HtemSZ6tamS4Z6OOM3iCJbkX
 oMwU94Ezs/ZJHxrCFTxS5tvx1G5N77tWAizOedg4B4eSJuZlpcKLyP110wVWBFAd58of
 6aEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hZ5q+wB/tYPT9/rA2rLaJGKjZnxaqF5TB5kijLIsi2E=;
 b=rR40NAzLkeSBFevrUsTyXy5SyxpoFWDzTndPcmbutEqntMzM1l1toP5jRHigeLr9Vc
 7lD41GQlWYphOUKbGnLI58IAX7g2sEgEFKGlJBRVoW7nu1eVlyP8GBx/Rq+mWgpNsvr3
 l4PA4PyjLtP2Ef67HzvYujSJOgFtzytKnJ725IzvKp5uDkwbXLUL4Q6pfVjMPj+LGNkv
 gi7ZItCPNJI7U9A8fLgBftqvH/2N+t63IY8XcEcW/unqShd5MuFnSohtjfydC8Q2+pWO
 hJD7KKOrOz715qhWsfTZHbiCHqUrS/WzdYnvEBr+/vHA/vk6yo/zQpDn30uWsKPD+QEu
 ZC4w==
X-Gm-Message-State: AOAM532TWo30/baM1H/4EatUEY4e/oMXF2rAbiqy3+GTO1FfKrSvggP+
 gXqsdsDjwlmB9OeNilKpGB8=
X-Google-Smtp-Source: ABdhPJwUWU8V57F1pfTVcRzOBkkzZTyhEfWhf5fxNv5kCoXAAHiZJNeFbiD74pf4rTSNn232JAmzYw==
X-Received: by 2002:a05:6000:1803:: with SMTP id
 m3mr9898451wrh.50.1616073103288; 
 Thu, 18 Mar 2021 06:11:43 -0700 (PDT)
Received: from localhost.localdomain ([185.240.141.204])
 by smtp.gmail.com with ESMTPSA id x25sm2792630wmj.14.2021.03.18.06.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:11:42 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 18 Mar 2021 15:11:29 +0200
Message-Id: <20210318131134.3562203-4-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318131134.3562203-1-amir73il@gmail.com>
References: <20210318131134.3562203-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/8] syscalls/fanotify05: Verify getting a single
 overflow event
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Instead of generating just one extra event, generate many events after
filling events queue. The result should remain the same - just one
overflow event is expected.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify05.c     | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify05.c b/testcases/kernel/syscalls/fanotify/fanotify05.c
index 1ca427caa..60bcb4774 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify05.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify05.c
@@ -61,7 +61,7 @@ static void event_res(struct fanotify_event_metadata *event, int i)
 	}
 }
 
-static void generate_events(int num_files)
+static void generate_events(int open_flags, int num_files)
 {
 	long long elapsed_ms;
 	int i;
@@ -70,7 +70,7 @@ static void generate_events(int num_files)
 
 	for (i = 0; i < num_files; i++) {
 		sprintf(fname, PATH_PREFIX "%d", i);
-		fd = SAFE_OPEN(fname, O_RDWR | O_CREAT, 0644);
+		fd = SAFE_OPEN(fname, open_flags, 0644);
 		SAFE_CLOSE(fd);
 	}
 
@@ -78,18 +78,24 @@ static void generate_events(int num_files)
 
 	elapsed_ms = tst_timer_elapsed_ms();
 
-	tst_res(TINFO, "Created %d files in %llims", i, elapsed_ms);
+	tst_res(TINFO, "%s %d files in %llims",
+		(open_flags & O_CREAT) ? "Created" : "Opened", i, elapsed_ms);
 }
 
 void test01(void)
 {
-	int len, nevents = 0;
+	int len, nevents = 0, got_overflow = 0;
 	int num_files = MAX_EVENTS + 1;
 
 	/*
 	 * Generate events on unique files so they won't be merged
 	 */
-	generate_events(num_files);
+	generate_events(O_RDWR | O_CREAT, num_files);
+
+	/*
+	 * Generate more events on the same files that me be merged
+	 */
+	generate_events(O_RDONLY, num_files);
 
 	while (1) {
 		/*
@@ -101,7 +107,8 @@ void test01(void)
 				tst_brk(TBROK | TERRNO,
 					"read of notification event failed");
 			}
-			tst_res(TFAIL, "Overflow event not generated!\n");
+			if (!got_overflow)
+				tst_res(TFAIL, "Overflow event not generated!\n");
 			break;
 		}
 		if (event.fd != FAN_NOFD) {
@@ -129,10 +136,11 @@ void test01(void)
 			break;
 		}
 		if (event.mask == FAN_Q_OVERFLOW) {
-			if (event.fd != FAN_NOFD) {
+			if (got_overflow || event.fd != FAN_NOFD) {
 				tst_res(TFAIL,
-					"invalid overflow event: "
+					"%s overflow event: "
 					"mask=%llx pid=%u fd=%d",
+					got_overflow ? "unexpected" : "invalid",
 					(unsigned long long)event.mask,
 					(unsigned)event.pid,
 					event.fd);
@@ -141,7 +149,7 @@ void test01(void)
 			tst_res(TPASS,
 				"Got an overflow event: pid=%u fd=%d",
 				(unsigned)event.pid, event.fd);
-			break;
+			got_overflow = 1;
 		}
 	}
 	tst_res(TINFO, "Got %d events", nevents);
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
