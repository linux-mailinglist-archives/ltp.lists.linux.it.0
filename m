Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 721853C8A78
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 20:08:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3337C3C873F
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 20:08:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 52B0D3C60E0
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 20:08:43 +0200 (CEST)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DFDD4100112F
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 20:08:42 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id m2so4364908wrq.2
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=neKBHTn+Zk1H5Q2oUufs792mPohUTzOKS0/t+vvGPac=;
 b=p4rCBPuQVzDlbvQ2kCdHqsKp1QwpEDxtBygtq/+7UXSByo6cvEayzAvgqN9EtJD/h+
 rUeC2TjDAhwQFq983p4DyEmMmVkBLy18dufQdAryzb1PeNtq/CdzZEr+BD94AaTLtDr8
 VIyF83m1be6XKMhyCZgWjkhToVyvJwPxOA5TY3DJgXYXhMB674aYZGMHepxSMG0vEBuw
 7zlkxJe0oA7XU0jBWN1HlwE7b3TLomBK4p3Y60jTFuCTfgmH7Jr6sVfDf9BMg5KD/4Vg
 /y70HRyZPv6YsOqxhlnEICktqybUXkI6OEbK83moVqNHRFyKwwfw27zfdMeWaet7DD2C
 PDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=neKBHTn+Zk1H5Q2oUufs792mPohUTzOKS0/t+vvGPac=;
 b=GBDvb62n541QwQFSmyUES9JGbIV5Nxr+a1J7JevPbaVgT3fdL1gMDUu7wc5fSIq+M/
 mgvkt123WFgw5WHyCMRij3eMaKBKumk4JXJDei0tMp9ZN9rc+x4D2/9V28N35oZnmCj1
 FV1G6usAo8V74sTB2XaUH0FGpDTn+x7xON8GLpZ+pVO9ZsnyeG0uyxoCJ7CgJyTlX9yr
 i9P+9TiMxDsR7b+hyC4igcVfagUvspKgcHOb14xHhsD63IxWmNJXVGuLq2RJxVZl/LYf
 bnJTFWf7BERnDotuJl6wfLaSN8vntiNaJ5/+QIuJ0rPkP0sPWXF+BCs6CrgfLTEyMjqW
 Lmfw==
X-Gm-Message-State: AOAM530eLNIbBs0aRc1C5LKKB5u4bUkkEV+1zw/DsjCPZSIaHq11qd0E
 oKAz6+FRnrS8VXPFz5wu5A0=
X-Google-Smtp-Source: ABdhPJxv/h7judAKGlcIt7SnlcF9SwCQbX3hd6e1YTYsYwfi5ciVTCN/2GHaFsWG70nabhrkEO7PeQ==
X-Received: by 2002:a05:6000:1243:: with SMTP id
 j3mr15538098wrx.244.1626286122539; 
 Wed, 14 Jul 2021 11:08:42 -0700 (PDT)
Received: from localhost.localdomain ([147.234.94.60])
 by smtp.gmail.com with ESMTPSA id f7sm3417110wru.11.2021.07.14.11.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:08:42 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed, 14 Jul 2021 21:08:40 +0300
Message-Id: <20210714180840.160798-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fanotify: Fix running tests in a loop
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Both fanotify19 and fanotify18 leaked fds when run in a loop.
fanotify19 was not checking child process exit status correctly
which resulted in random failures.

Reported-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 testcases/kernel/syscalls/fanotify/fanotify18.c | 5 ++++-
 testcases/kernel/syscalls/fanotify/fanotify19.c | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify18.c b/testcases/kernel/syscalls/fanotify/fanotify18.c
index 8a7eebba3..54a4b8ba0 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify18.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify18.c
@@ -136,7 +136,7 @@ static void test_fanotify(unsigned int n)
 			(tc->mark_flags & DISALLOWED_MARK_FLAGS ||
 			 tc->mark_mask & FAN_ALL_PERM_EVENTS)) {
 			tst_res(TPASS, "Received result EPERM, as expected");
-			return;
+			goto out;
 		}
 
 		tst_brk(TBROK | TERRNO,
@@ -151,6 +151,9 @@ static void test_fanotify(unsigned int n)
 	tst_res(TPASS,
 		"fanotify_init() and fanotify_mark() returned successfully, "
 		"as expected");
+
+out:
+	SAFE_CLOSE(fd_notify);
 }
 
 static void setup(void)
diff --git a/testcases/kernel/syscalls/fanotify/fanotify19.c b/testcases/kernel/syscalls/fanotify/fanotify19.c
index 60714408d..fac257bb4 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify19.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify19.c
@@ -132,7 +132,7 @@ static void do_fork(void)
 
 	SAFE_WAITPID(child, &status, 0);
 
-	if (WIFEXITED(child) && WEXITSTATUS(child) != 0)
+	if (WIFEXITED(status) && WEXITSTATUS(status) != 0)
 		tst_brk(TBROK, "Child process terminated incorrectly. Aborting");
 }
 
@@ -255,6 +255,8 @@ static void test_fanotify(unsigned int n)
 			event = FAN_EVENT_NEXT(event, len);
 		}
 	}
+
+	SAFE_CLOSE(fd_notify);
 }
 
 static void setup(void)
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
