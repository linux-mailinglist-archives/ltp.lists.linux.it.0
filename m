Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D90B9E051
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Sep 2025 10:19:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E3D03CD967
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Sep 2025 10:19:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7BB983CD967
 for <ltp@lists.linux.it>; Thu, 25 Sep 2025 10:19:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C38841400BEE
 for <ltp@lists.linux.it>; Thu, 25 Sep 2025 10:19:15 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 68D934DEFF;
 Thu, 25 Sep 2025 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758788352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsPX/SdNXkKNap1Wi+R8ONe4TPe/utBL8uVlnFfl0r0=;
 b=smtQvlCDQPKiwnUbL7EL86JzPe4w4SLpuNEwZ1RnRtti3clmvRUvRmmKhEBoCqdXheRegq
 cIhIODrZ389HY/WPMVm+bxMq3MZAh+wxWHae5P+HpRm9aDg4PQUv186iOJDte0qOptxAKA
 +v+XM/M13VD42OoNeQbHHWLVqT+Dpoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758788352;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsPX/SdNXkKNap1Wi+R8ONe4TPe/utBL8uVlnFfl0r0=;
 b=33vBKiw5z0QUqMh+MbyYybBGu40+1FnEgfxsiFxiwBctautpt6wOCaciF8PMuqPzIVyR15
 hZ4v5r4hiPZJcGDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=smtQvlCD;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=33vBKiw5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758788352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsPX/SdNXkKNap1Wi+R8ONe4TPe/utBL8uVlnFfl0r0=;
 b=smtQvlCDQPKiwnUbL7EL86JzPe4w4SLpuNEwZ1RnRtti3clmvRUvRmmKhEBoCqdXheRegq
 cIhIODrZ389HY/WPMVm+bxMq3MZAh+wxWHae5P+HpRm9aDg4PQUv186iOJDte0qOptxAKA
 +v+XM/M13VD42OoNeQbHHWLVqT+Dpoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758788352;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsPX/SdNXkKNap1Wi+R8ONe4TPe/utBL8uVlnFfl0r0=;
 b=33vBKiw5z0QUqMh+MbyYybBGu40+1FnEgfxsiFxiwBctautpt6wOCaciF8PMuqPzIVyR15
 hZ4v5r4hiPZJcGDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F687132C9;
 Thu, 25 Sep 2025 08:19:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qGNGFwD71GjGQQAAD6G6ig
 (envelope-from <akumar@suse.de>); Thu, 25 Sep 2025 08:19:12 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Thu, 25 Sep 2025 10:19:11 +0200
Message-ID: <20250925081912.14822-1-akumar@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAEemH2f8EjTe-uX1zm5h6L1kUFcxy72Br7bvBe5btr7i6PB1BQ@mail.gmail.com>
References: <CAEemH2f8EjTe-uX1zm5h6L1kUFcxy72Br7bvBe5btr7i6PB1BQ@mail.gmail.com>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:mid, suse.de:dkim, suse.de:email]
X-Spam-Level: 
X-Rspamd-Queue-Id: 68D934DEFF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5] Introduce ioctl_pidfd_get_info_supported() function
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

Check if ioctl(PIDFD_GET_INFO) is implemented or not
before proceeding in ioctl_pidfd05 test

Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Suggested-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/ioctl/ioctl_pidfd.h | 28 +++++++++++++++++++
 .../kernel/syscalls/ioctl/ioctl_pidfd05.c     |  9 +++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd.h b/testcases/kernel/syscalls/ioctl/ioctl_pidfd.h
index 811f969cd..2740284f7 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd.h
+++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd.h
@@ -9,6 +9,34 @@
 #include "tst_test.h"
 #include "lapi/pidfd.h"
 
+static inline int ioctl_pidfd_get_info_supported(void)
+{
+	pid_t pid;
+	int pidfd, ret;
+	int supported = 0;
+	struct pidfd_info info;
+
+	if (tst_kvercmp(6, 13, 0) >= 0)
+		return 1;
+
+	memset(&info, 0, sizeof(struct pidfd_info));
+
+	pid = SAFE_FORK();
+	if (!pid)
+		exit(100);
+
+	pidfd = SAFE_PIDFD_OPEN(pid, 0);
+
+	ret = ioctl(pidfd, PIDFD_GET_INFO, &info);
+	SAFE_WAITPID(pid, NULL, 0);
+
+	if (ret != -1)
+		supported = 1;
+
+	SAFE_CLOSE(pidfd);
+	return supported;
+}
+
 static inline int ioctl_pidfd_info_exit_supported(void)
 {
 	int ret;
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
index c379717b3..d20c6f074 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
@@ -14,7 +14,7 @@
 #include "tst_test.h"
 #include "lapi/pidfd.h"
 #include "lapi/sched.h"
-#include "lapi/ioctl.h"
+#include "ioctl_pidfd.h"
 
 struct pidfd_info_invalid {
 	uint32_t dummy;
@@ -48,8 +48,15 @@ static void run(void)
 	SAFE_CLOSE(pidfd);
 }
 
+static void setup(void)
+{
+	if (!ioctl_pidfd_get_info_supported())
+		tst_brk(TCONF, "ioctl(PIDFD_GET_INFO) is not implemented");
+}
+
 static struct tst_test test = {
 	.test_all = run,
+	.setup = setup,
 	.forks_child = 1,
 	.bufs = (struct tst_buffers []) {
 		{&args, .size = sizeof(*args)},
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
