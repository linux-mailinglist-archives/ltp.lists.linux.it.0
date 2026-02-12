Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHkhOULUjWlA7wAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 14:23:14 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E3B12DC68
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 14:23:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C22E3CF2B1
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 14:23:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7307E3CF2CF
 for <ltp@lists.linux.it>; Thu, 12 Feb 2026 14:22:49 +0100 (CET)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1AFBB600847
 for <ltp@lists.linux.it>; Thu, 12 Feb 2026 14:22:49 +0100 (CET)
Received: by mail-pj1-x1042.google.com with SMTP id
 98e67ed59e1d1-3567e2b4159so1063838a91.0
 for <ltp@lists.linux.it>; Thu, 12 Feb 2026 05:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770902567; x=1771507367; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y4Hnj8f19B6DXvKLJtRwUIqJ6oYbFODFfJclEZVc8+E=;
 b=jmlulfG/nCKAxSiOMQwFYSQP/NlWIOU9Bq/CHmBvTRw23F6WD0gbThsrHYrEBbggp1
 njp9loM0lNGqsLOeLUMqWayeiudA3W9FAUe+HKwyThJAaHXEUShQ/9UzIKRfEgmZFCKn
 32jUaBtEG2DZCTQlCgB4CxCbVB1AAoZvcP+Q8gcQtJe49Y7uIjx0/4L3CBQv/oKLuYER
 UduP7lTNiUpytKd7NN/bfOPdo2LiCQU+8P5ev12w/pDyXW0pKo4CvuWGKUsID3lpepCJ
 n9/KT2PL5x/8YUg2DUVD9hGY7cFNE9cmzk7gVQ7qpaSOwhRmY+gX973w/WaH8RnYOC9d
 KffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770902567; x=1771507367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y4Hnj8f19B6DXvKLJtRwUIqJ6oYbFODFfJclEZVc8+E=;
 b=eR8Buh9h/Z4oZ4/+j1ELJp0EiKAS5It4F85mKUjxn4syLJIpp7Me4a3vZzqisynSJt
 +BcJM0Q8vQGdbNU1LhjqUG74vQyK6PIFZNAP/btfDU/MZ/98zjZ4qjxtJpo4KaLvgOLg
 bQo5EsJyJVj2nYkaSCN4Czw3kBXGqz6xsDk3J17KFC4HY1yCUnrJrT/dkRVRJ9fTzzL4
 6dtoAZiwoIeGAS+Ef9au9Ah8E+9FPwATfM+aO3Gl9drrLIxsiOiAxA1Uys55ok6EpxuD
 elGVGLxrYxkatYeWo1NOQu6F0TveQKfQEYXhWe1q9tUFQSJ1d/x+x9unR5iBC/3v9E0h
 4rLQ==
X-Gm-Message-State: AOJu0Yz2BSX6sqkDF/nhh7SmdZVIX7csShRkSX+hSCOSHVzJxsmoMvuh
 5cvWQIOG6Krr8EmHHc204bcr19+SgdgiJJi8Gr9/dhtY3jc9abkeeoHapo8nggMu1Q==
X-Gm-Gg: AZuq6aIsAAwaRuelFDVIovE1OpDin8c9Cg+ldKdotXr+KNLQdsCBHm8TnV8DclCt6+Z
 MhcIyvqtyLO6wbsXCI3MIvQQcZXBb3kLd7lyHDj7RoVBbDigoUH9GjIi1RyU9wTH48vivhjfIWe
 K77hdZfnl+UMwrSAf1L6KFy3tplKim5j+MXXcpODj26GpZTrXIbOW4g2gT6wSCSussisZEo6fXN
 7JPqZqRP2tAk3Xo5+FeELY5EGPTTbSJyWa7MRPl0RwfUkWxZifwjcZwMDQHb0xv/bW2GsYYJztP
 x3weUdqE9/z/HlhNf8otvDyAVO7eGCDEem8lKTIcOv9o91z20ZQqauoKPI+vbXiipcLkt/lRr5y
 Kt0ZLwSybiOC7/hufOf+CliPqBbkNKqV5aoyc61PFMQXyQ2PNWqBmnfIzuOayT5+BEkS4Ek/GoT
 rZZ5zZI/A3DoovnGZmL+yME5571+ZK5p5KzCcJBHYpHg==
X-Received: by 2002:a17:90b:264a:b0:330:7ff5:2c58 with SMTP id
 98e67ed59e1d1-35693c922a6mr2022014a91.7.1770902567176; 
 Thu, 12 Feb 2026 05:22:47 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3567e7d9537sm5403920a91.4.2026.02.12.05.22.46
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 05:22:46 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 12 Feb 2026 22:22:14 +0900
Message-ID: <20260212132221.4231-2-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212132221.4231-1-always.starving0@gmail.com>
References: <20260212132221.4231-1-always.starving0@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] open: replace getdtablesize with getrlimit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url]
X-Rspamd-Queue-Id: 86E3B12DC68
X-Rspamd-Action: no action

The test currently uses getdtablesize() to determine the maximum
number of file descriptors for the process. This interface is
considered legacy and is not specified by POSIX.

Use getrlimit() instead, which provides a well-defined
and portable way to obtain the per-process file descriptor limit.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 testcases/kernel/syscalls/open/open04.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/open/open04.c b/testcases/kernel/syscalls/open/open04.c
index ed5dd27bb..3d8ea2ae8 100644
--- a/testcases/kernel/syscalls/open/open04.c
+++ b/testcases/kernel/syscalls/open/open04.c
@@ -11,6 +11,7 @@

 #include <stdio.h>
 #include <stdlib.h>
+#include <sys/resource.h>
 #include "tst_test.h"

 #define FNAME "open04"
@@ -23,7 +24,10 @@ static void setup(void)
 {
 	int fd;

-	fds_limit = getdtablesize();
+	struct rlimit rlim;
+
+	SAFE_GETRLIMIT(RLIMIT_NOFILE, &rlim);
+	fds_limit = rlim.rlim_cur;
 	first = SAFE_OPEN(FNAME, O_RDWR | O_CREAT, 0777);

 	fds = SAFE_MALLOC(sizeof(int) * (fds_limit - first));
--
2.43.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
