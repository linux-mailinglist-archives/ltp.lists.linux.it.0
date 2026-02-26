Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCoYD+choGkDfwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 11:35:19 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3701A45C9
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 11:35:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772102118; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : content-type : content-transfer-encoding : sender :
 from; bh=SVw2xAoGeJAheVXJhz4DhaneG+3H8TqmO4qU8yaMWc0=;
 b=hDGu+FlInvCYqHmuXtnQTSHPd13S9JrcrsTr04RIO3/0KnHEL535lV1h+YoSKV7+GkAlp
 M9198hFTD/pebW7dop2Wvs4pZdLq9F72S+ykIE5I7VXFtEOaKufjS34wHCKkhM3phlyTrz2
 ejnbzCACuJTdfN17AKF0fqE7BfK6c74=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2162D3CB7A6
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 11:35:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4251A3C889D
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 11:35:15 +0100 (CET)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A0BD31A007E9
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 11:35:14 +0100 (CET)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C240D3FCAF
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1772102113;
 bh=tp80w+PM7zyjr7LI3RCVQTOd8gmJjk5e2aGnOSoT+3E=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=TJbixCO71RMTwhyFpfoZ5x2vmGnhJouADbtkjUB8adnSZxP6/Ry2Kl1W57WhiJwXf
 FRB8DExuRDQYEnft8+hTcBZAZKjX/l2O52ecjExS3zJYRRwm4iCmBLiWqK+j7vl4uo
 wowVaMm8VAVq0j334GvRFezxWZ4kv2Ztggkdigh8haJYg5/iOYVSDs05iokeaE1S5a
 8UJQBSu4RIh2lgMnkQ6t5MIm1avUeMD3rWH4baWsrimNsZ72Wt0Puqfol5HE3MkmWg
 k3DkiAtmieMGZ6d9NCGICvlHx95ILqvHCDqqJ+TKStkC8tyTT0QSQQV9KD0+aFIpg3
 HcJRS4pvV9iNJYAfL23wDBUFTebNefbDR9ICweVH0+DOklgTCWUHCIbL6CA/SQjd6h
 331ALuggMWKzRDCqObEycfTiSyPrwlvqPkZh7HkME2OI9vdTeXMcr+bcwX8pPB/f2p
 uBYTXfscsYaKJ+0+bJqBy9pXKbkL2hq+C8eGmmsK9rFPt9S8lyD9G1OH69BZf/OCAp
 nnBjM315RH+ZbUkNc1tKdfucuqAFCyJQy57WE+rfJ8wuGXnb96qvezhP+s2Jp/izyG
 ekefEgwdA5I1nG6EGTSMRxYO7jiSoXC9ebTKaV6o3WsmIQPIEpMs3YAPthKfeMr9Sc
 91sZN+Wn7dw+y8CsV+xatXlw=
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2add1118c19so4505685ad.2
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 02:35:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772102112; x=1772706912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tp80w+PM7zyjr7LI3RCVQTOd8gmJjk5e2aGnOSoT+3E=;
 b=m1BEmBcO+Yb35Elpu21mAbyhtAh2BlwgRLk2AL8n3bhk27yiwtMLTPSLhxg+Xi07AA
 taga0KCYS6uUyPBhRjqTI86hiGKMbFdD7j/+FjlQCkwZEWVwh4WFwG8b91T22r4KsfEk
 FZegi/6IYwbstV2LHcS7sTFvmVr2JpA192h/+gwL465tV+VWzKVyJTTNi5IroW0as+Lu
 Z4BlyUC86ZqK99JDz/eqiFSpu1gBE6XYZ6PHDqSx1BbNcZShkgouOB4wz4C6xG05kw8A
 3gNX7kmOGgRWNtbbp8gc+j6XWmVgTcT0bjMu0oPPdH2EXAsMPbKGtOxYaC4AE1CrN6i4
 TW4A==
X-Gm-Message-State: AOJu0YyjA56dK4+6jXenpHJsFs65IauyagLyN4cXOZar6M2cqK2j39S4
 bmSv/h5uL/jVhrse8Bw5psmXuCAkciJh2q870e6fVN7hXEqigpkP/q6RntuIntax+jIi1cwxKMp
 ukElFQC1pYVYfzj79DlkzlVeJML/HNhchwPU9rhIen/3+tj1sIneMakJ9jq7e9Lrx3+UK2bUaVt
 kiusRv0Q==
X-Gm-Gg: ATEYQzxhhet6/aaVb36bz+kHe2zaX7+Oye4NI5bO1NucZLmLyg2LTVBC3Lrc4IYTx/r
 acEukwJ0+6mCiXAaZPpRdvo1E5uBxk+IvVd8Hjem+2SnmnkinAhesDYOV6VW5ZTrTBKdwx0VP5i
 ouZOIjKOIKBL3djipaaA0HlxTjzZd9zJH0tPVlUcM57pnlqYJxRI0KX4FaW7cQbacmZj/HOyKVV
 8izflVeT0UvlhYy2UAvJSQi7Jd8IUVxcc2h/0Jekg3QA48xXCzyRzrgdTJVpWrT5NvXehoKzB91
 hhX1YGUsDnlK1L+a/qg36vL0zWFPSIIR/53XN+895MiYeZJrUXqsX2YyihXRhvamUsSzYYgrVn2
 7Tf0DMnl/rw7nmggishuue50lOk+cTL08C6EAt0a7IU4=
X-Received: by 2002:a17:903:3d0b:b0:2a7:afca:fd1b with SMTP id
 d9443c01a7336-2ad74455a49mr145693465ad.13.1772102112217; 
 Thu, 26 Feb 2026 02:35:12 -0800 (PST)
X-Received: by 2002:a17:903:3d0b:b0:2a7:afca:fd1b with SMTP id
 d9443c01a7336-2ad74455a49mr145693315ad.13.1772102111893; 
 Thu, 26 Feb 2026 02:35:11 -0800 (PST)
Received: from localhost.localdomain ([123.208.221.96])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5b22fesm28837655ad.2.2026.02.26.02.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 02:35:11 -0800 (PST)
To: ltp@lists.linux.it
Date: Thu, 26 Feb 2026 21:35:02 +1100
Message-ID: <20260226103502.70043-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] clone10.c: avoid using the libc thread memory model
 in touch_tls_in_child()
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
From: Changwei Zou via ltp <ltp@lists.linux.it>
Reply-To: Changwei Zou <changwei.zou@canonical.com>
Cc: changwei.zou@canonical.com
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
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[canonical.com:s=20251003];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,canonical.com:-];
	HAS_REPLYTO(0.00)[changwei.zou@canonical.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid,canonical.com:email,canonical.com:replyto,linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: CF3701A45C9
X-Rspamd-Action: no action

The thread touch_tls_in_child(), which is created using clone(),
is not fully initialized as a standard libc-managed thread.
Consequently, it is not in a proper state to invoke many libc functions safely.

Signed-off-by: Changwei Zou <changwei.zou@canonical.com>
---
 testcases/kernel/syscalls/clone/clone10.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/clone/clone10.c b/testcases/kernel/syscalls/clone/clone10.c
index 9ffb49c37..96de811ad 100644
--- a/testcases/kernel/syscalls/clone/clone10.c
+++ b/testcases/kernel/syscalls/clone/clone10.c
@@ -20,6 +20,7 @@
 #include "tst_test.h"
 #include "clone_platform.h"
 #include "lapi/syscalls.h"
+#include "tst_atomic.h"
 #include "lapi/tls.h"
 
 #define TLS_EXP 100
@@ -34,21 +35,15 @@ struct user_desc *tls_desc;
 static __thread int tls_var;
 
 static char *child_stack;
-static volatile int child_done;
+static tst_atomic_t child_done;
 
 static int flags = CLONE_THREAD |  CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SETTLS;
 
 static int touch_tls_in_child(void *arg LTP_ATTRIBUTE_UNUSED)
 {
-#if defined(__x86_64__)
-	if (syscall(SYS_arch_prctl, ARCH_SET_FS, tls_ptr) == -1)
-		exit(EXIT_FAILURE);
-#endif
 	tls_var = TLS_EXP + 1;
-	tst_res(TINFO, "Child (PID: %d, TID: %d): TLS value set to: %d", getpid(), (pid_t)syscall(SYS_gettid), tls_var);
+	tst_atomic_store(1, &child_done);
 
-	TST_CHECKPOINT_WAKE(0);
-	free_tls();
 	tst_syscall(__NR_exit, 0);
 	return 0;
 }
@@ -56,13 +51,16 @@ static int touch_tls_in_child(void *arg LTP_ATTRIBUTE_UNUSED)
 static void verify_tls(void)
 {
 	tls_var = TLS_EXP;
+	tst_atomic_store(0, &child_done);
 
 	TEST(ltp_clone7(flags, touch_tls_in_child, NULL, CHILD_STACK_SIZE, child_stack, NULL, tls_ptr, NULL));
 
 	if (TST_RET == -1)
 		tst_brk(TBROK | TTERRNO, "clone() failed");
 
-	TST_CHECKPOINT_WAIT(0);
+	while (tst_atomic_load(&child_done) == 0) {
+		usleep(10);
+	}
 
 	if (tls_var == TLS_EXP) {
 		tst_res(TPASS,
@@ -84,6 +82,7 @@ static void setup(void)
 static void cleanup(void)
 {
 	free(child_stack);
+	free_tls();
 }
 
 static struct tst_test test = {
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
