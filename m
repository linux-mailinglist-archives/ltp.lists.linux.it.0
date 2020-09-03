Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AAE25BB2B
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 08:40:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 501803C2D57
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 08:40:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4FC373C54F4
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 08:40:32 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E47F920099B
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 08:40:31 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id u13so1329764pgh.1
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 23:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufixc6Caqgo/K/SAKFmzu7GMY4qCpg1IDD3LMweIdmw=;
 b=Xwo89Pbtgxirv8Lu4HweI4HB2QmzPImryIgcCYmXUGdQdHSkPi4RAsbeQsQEfiGHIj
 FiKFZAMOYImCispVjvp2EDzB9KYGNvVC47Xz+K/S8T/D9AU/HR5tzPligh5FhfXcyMpZ
 UjI5g4tniEWy9td5xTR/bJAs5U6zEb28DCtp4jVm89Y3H6mf2jh5TTWeVjqAj3UtyCeb
 VsVpm/fKzTkwHQpF8mDNjgrjW7QGC5YDXMlCoouNR6GcRLdlN4Fw9S3V7OfG5ZTrdp/c
 ypyqfHkrN6MaUNg6H1mtAc1kaW0a6CAeL47lsfQ5WaD19yKanjHuAsYrHSsRovsjl7FB
 szug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ufixc6Caqgo/K/SAKFmzu7GMY4qCpg1IDD3LMweIdmw=;
 b=ULKKqYbT9fy+6DDhOuevVN5CiHjgmbLy/0J7XresPU2pLRx5PCHwrRzrXu874I7AlV
 Qjte6yZwjkgiNXnkZdDuEQUE5Cz2mnHiBVxLmn0MrcDDZki8p6QGtywvO08SkBwF99bT
 Kux4GUlmmKRQYh0x2uJruhNWrR/mq6h66sxh9EeolhLSMDpV5wrEl+G3dev4rW+d8atQ
 QCrVYcElS9V92Olk65YTAZvWQe2QkvzJFBQV4OrA3zv+4iTqeESpZN4hzkMudm54Bnmx
 76pVQUrsfT+Av7louFy2nvJI9kPw7yDiSQOzbvb67diUUQLZ9j1S3nK1UMdY0Vc99GuW
 YPrw==
X-Gm-Message-State: AOAM533KANE89I7c9CFwA0jIJD8phTPBhy0QxMMq6YV3vFWGw1iW9Qoa
 vrDDZzY3aQy8zTwd9VArzie4BJhwhpUDsg==
X-Google-Smtp-Source: ABdhPJwEkUDzF7ZdHc+NECFEsmU7S0iB2Pq0srzEDW16iJha7sflyHUlr9EDc1eNoM4KKTzRktlA2w==
X-Received: by 2002:a05:6a00:14ce:: with SMTP id
 w14mr2326803pfu.119.1599115230121; 
 Wed, 02 Sep 2020 23:40:30 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id e7sm1780152pfm.43.2020.09.02.23.40.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Sep 2020 23:40:29 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu,  3 Sep 2020 12:10:13 +0530
Message-Id: <aabe6b47c9387e5ef3fc5b2a559295b72adc3c67.1599115178.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <728ce5d6b7e0f3eba8015c078bfc23ec144ce1c2.1599115178.git.viresh.kumar@linaro.org>
References: <728ce5d6b7e0f3eba8015c078bfc23ec144ce1c2.1599115178.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] syscalls: select: Verify that data is available
 to read
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

select() returns a positive value on success if timeout hasn't happened,
else returns 0. Check that and send some data to the write file
descriptor for the same.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

---
Cyril,

Is this what you were looking for ? I am not sure why, but the last
test (with named pipe) times out all the time.
---
 testcases/kernel/syscalls/select/select01.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/select/select01.c b/testcases/kernel/syscalls/select/select01.c
index 4367e7f3af3f..b3dcf1fff6f3 100644
--- a/testcases/kernel/syscalls/select/select01.c
+++ b/testcases/kernel/syscalls/select/select01.c
@@ -25,24 +25,31 @@ static struct select_info {
 	int nfds;
 	fd_set *readfds;
 	fd_set *writefds;
+	int *writefd;
 } tests[] = {
-	{4, &readfds_reg, NULL},
-	{5, &readfds_pipe, &writefds_pipe},
-	{5, &readfds_npipe, &writefds_npipe},
+	{4, &readfds_reg, NULL, NULL},
+	{5, &readfds_pipe, &writefds_pipe, &fds_pipe[1]},
+	{5, &readfds_npipe, &writefds_npipe, &fd_npipe},
 };
 
 static void run(unsigned int n)
 {
 	struct select_info *tc = &tests[n];
 	struct timeval timeout;
+	char buf;
 
 	timeout.tv_sec = 0;
 	timeout.tv_usec = 100000;
 
+	if (tc->writefd)
+		SAFE_WRITE(0, *tc->writefd, &buf, sizeof(buf));
+
 	TEST(do_select(tc->nfds, tc->readfds, tc->writefds, 0, &timeout));
 
 	if (TST_RET == -1)
 		tst_res(TFAIL | TTERRNO, "select() failed");
+	else if (!TST_RET)
+		tst_res(TFAIL, "select() timed out");
 	else
 		tst_res(TPASS, "select() passed");
 }
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
