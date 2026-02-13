Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGxlLwL3jmnbGAEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Feb 2026 11:03:46 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53554134D4B
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Feb 2026 11:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770977025; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=SwFqma72qTmWmICaK2Xu5PryiXBD0Psf4F5zfBaRD6Q=;
 b=DE6veeH4K36e25qACR7WtdhIlJF9xiAWHa7PuldkSJ+aO7NtYrkku6N1SClFUxaHLF0qW
 gO4h5cXtvmxFUdnU3GChMi0zWmeK3dnBt9x83qShixeEgCEeyZbVn5gHCVUQ2zUzBxgDcQ6
 jAcokHxNr9bJd2reRzZJsK6RoOoz1y8=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 721493CF67C
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Feb 2026 11:03:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 057F43CF67C
 for <ltp@lists.linux.it>; Fri, 13 Feb 2026 11:03:33 +0100 (CET)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 845FD1000DD7
 for <ltp@lists.linux.it>; Fri, 13 Feb 2026 11:03:32 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-480706554beso7423495e9.1
 for <ltp@lists.linux.it>; Fri, 13 Feb 2026 02:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770977012; x=1771581812; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwBCeZhMP0D7KJJZUprJmvbz/5rrA2EDdTFYf/jbNMM=;
 b=a84gy/uy0FFx6fISa6gt9q6tEgi4EH9PjV+qGaS9+brzM2iHALiQzsmLarLf0X9a7E
 ZyXcqMGsDFuoYGMqPDJRMUkRdNf5ysLBBwpvDfIdKmDZULV5BNd3BBGe4rEOSZtVtoLh
 ZpjMjueApZeLDFgULYcO6DJhiljxNMy1iuF0WO5yyrDhGOfTvgBD++O1EJqQgs/uocst
 rH0VS3xU4HIRmE8cd5dGPG2voRP2Alzgg91zAAXQ3GkRFIzMRAASQKDzaCYR10xROlP+
 qjSwjUnMDdEAS9gPXwQs/rDYV9ODNkQhcQoe6lPVza5W6lKGUvax7wN6j9CTkaIWvAnH
 lr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770977012; x=1771581812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zwBCeZhMP0D7KJJZUprJmvbz/5rrA2EDdTFYf/jbNMM=;
 b=nAXi0mFdWmeaa1h+unQ9IL1/QE4XTSonjNvJKljoKgRI/NwlF4pKJS1b1LbuKWpe00
 QH1X4Ex5868T2YWH/QDv6FpjGc2O/DVxm+xcOdXOfCdiIYcUyk81YmFyAIvXIOP7qQos
 9Jl3bHd3ku3BMD20Sj/yMFpzvkE8MzRefL7TWAGbWqDvo2hJiodvkA0AiQ+vmoi1sxZV
 Qr1VOiJI+q+fUvYUNPXTj1lwjeNBzumJSswwDxo50YbTZ+Y9jcYeIQAm+s/V7Hh+2K65
 FVjrRo4QztMazTVN5pFyYcALeeAN6wc5I+TCFvZoN6H1tic8Q3+TNhyEYvVixDH1yUqO
 DCpQ==
X-Gm-Message-State: AOJu0Yzdj/gZYrgWIAQQNaFvb2QTeavdM+jY5IKPzyfpr+BMeJvFkg8l
 BqbSgcyBFuDcJCLahw8JqAuAMdBDYhgJbe/MUbIgNRRxaGlvvjaIVeLNE4rgrkf845/SGuokHLz
 LLnE=
X-Gm-Gg: AZuq6aKQz9XwbS9p/NVBaJhQQKpCFWq6Ym/DJcHggAk3btmwwG8brr1uzGsGscvq+My
 xfid/Bx3hsnMBUwd+UNQIMcoZNZ6421AdYLpYwclErvWL9doaGAqGvLAYFQYO+r7RxISHC5n63J
 CInV+P2MzpSJ3DLTR8DjbJCceaKyo9ZGPxB1zJTn4Chkxpc+LBmIZd1AQ/OXUvaKNalhDyrikoL
 /HPNPm6dhCWttmgL6hdt+FXmmdQHknUmYGg0UyShbXiP3xa6xJ4gbBkwFMDKwU8nAEc5O3fLCBJ
 DvLhUT6KZd/ANx/kTd2yVKS2pdF+8GsK7vOnNYl9LVwgmeoNSoSlRHiVxiSeYh42roUv2/jAmjB
 5QgLAd7p1bevVq4mQHXrZZC4L480jsBkdF8pAE+azZakB7501Y+VBtMrvrlCngTxsoDMl4sUcBe
 mQehQLkeRXqOZs44TLvAOLfA==
X-Received: by 2002:a05:600c:3f0b:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-48373a74705mr22065995e9.31.1770977011707; 
 Fri, 13 Feb 2026 02:03:31 -0800 (PST)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-483740be167sm21651465e9.15.2026.02.13.02.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 02:03:31 -0800 (PST)
To: ltp@lists.linux.it
Date: Fri, 13 Feb 2026 10:03:03 +0000
Message-ID: <20260213100329.12063-1-wegao@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213023801.11713-1-wegao@suse.com>
References: <20260213023801.11713-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3] ioctl_pidfd02.c: fix clone3 EFAULT in 32-bit
 compat mode due to sign extension
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	TO_EQ_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[wegao@suse.com]
X-Rspamd-Queue-Id: 53554134D4B
X-Rspamd-Action: no action

Correct the 32-bit pointer u64 conversion for args->pidfd. Direct
casting from a 32-bit pointer to a 64-bit integer was causing incorrect
sign-extension. Using (uint64_t)(uintptr_t) ensures a valid zero-padded
64-bit address.

Signed-off-by: Wei Gao <wegao@suse.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_common.h                            | 5 +++++
 testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c | 2 +-
 testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c | 2 +-
 testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c | 2 +-
 testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c | 2 +-
 testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c | 2 +-
 6 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/tst_common.h b/include/tst_common.h
index 473228149..6b726bd58 100644
--- a/include/tst_common.h
+++ b/include/tst_common.h
@@ -86,4 +86,9 @@
 #define TST_TO_STR_(s) #s
 #define TST_TO_STR(s) TST_TO_STR_(s)
 
+/*
+ * TST_PTR_TO_UINT - Casts a pointer to a 64-bit unsigned integer.
+ */
+#define TST_PTR_TO_UINT(x) ((uintptr_t)(x))
+
 #endif /* TST_COMMON_H__ */
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c
index c6f8a02fe..01f9df2b1 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c
@@ -27,7 +27,7 @@ static void run(unsigned int isolate)
 
 	if (isolate) {
 		args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
-		args->pidfd = (uint64_t)&pidfd;
+		args->pidfd = TST_PTR_TO_UINT(&pidfd);
 		args->exit_signal = SIGCHLD;
 
 		pid_child = SAFE_CLONE(args);
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c
index 2c785004c..1ae467ad0 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c
@@ -24,7 +24,7 @@ static void run(void)
 	memset(args, 0, sizeof(struct tst_clone_args));
 
 	args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
-	args->pidfd = (uint64_t)&pidfd;
+	args->pidfd = TST_PTR_TO_UINT(&pidfd);
 	args->exit_signal = SIGCHLD;
 
 	pid_child = SAFE_CLONE(args);
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c
index ff4316068..3d5566ea8 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c
@@ -26,7 +26,7 @@ static void run(void)
 	info->mask = PIDFD_INFO_EXIT;
 
 	args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
-	args->pidfd = (uint64_t)&pidfd;
+	args->pidfd = TST_PTR_TO_UINT(&pidfd);
 	args->exit_signal = SIGCHLD;
 
 	pid_child = SAFE_CLONE(args);
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
index 278e64cef..aa69d20fa 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
@@ -36,7 +36,7 @@ static void run(void)
 	info_invalid->dummy = 1;
 
 	args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
-	args->pidfd = (uint64_t)&pidfd;
+	args->pidfd = TST_PTR_TO_UINT(&pidfd);
 	args->exit_signal = SIGCHLD;
 
 	pid_child = SAFE_CLONE(args);
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c
index 95c09dbda..32ca0422b 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c
@@ -26,7 +26,7 @@ static void run(void)
 	info->mask = PIDFD_INFO_EXIT;
 
 	args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
-	args->pidfd = (uint64_t)&pidfd;
+	args->pidfd = TST_PTR_TO_UINT(&pidfd);
 	args->exit_signal = SIGCHLD;
 
 	pid_child = SAFE_CLONE(args);
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
