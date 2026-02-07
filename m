Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENTeLXhTh2mYWgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Sat, 07 Feb 2026 16:00:08 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FD010648E
	for <lists+linux-ltp@lfdr.de>; Sat, 07 Feb 2026 16:00:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770476407; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : content-type : content-transfer-encoding : sender :
 from; bh=OIFYhdipHNN1fKW1Mcc4ZCsdrzFxWmifmJdDsNxrbd8=;
 b=aNgeCz5QtXnnlpJDfTT2/NoeNardUeVim65BK/sIP7skmNeatbnLs85+bHvjFrM2N0Cu+
 t/8D46ecrNJepVPCKgFo33XW+jgtbQcNm+bftlcF86KKPZATuZVFAFgWa0DgonaPMj8lwYk
 OZ60huO5mIspFi/bFUNp7HWSdxZcRL4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7200F3CEDAB
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Feb 2026 16:00:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 839AD3C537C
 for <ltp@lists.linux.it>; Sat,  7 Feb 2026 15:59:53 +0100 (CET)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D60501A006BA
 for <ltp@lists.linux.it>; Sat,  7 Feb 2026 15:59:52 +0100 (CET)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B86853F78C
 for <ltp@lists.linux.it>; Sat,  7 Feb 2026 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770476391;
 bh=S3TntVH20B5fQxuozGZZ/paf3OLh1S/0dRdEQQb73sk=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=Yvc9/Dv5Tsq07m+QQPxf9HyPseBGG4dGLi9qG5GKNYlzAjD4xRW8fWP8BBfz7OVmK
 0UeEyxTMjNGzR5t7+xbPQTQX0Zz5sRlu0BZo8fM6JKxfwvgK/IDc6Ydy8dlmog9d+T
 gMmj0QVyqByANkzgiEWwM2N5YnrHMUhCS3PGrdxwrQQ+YE5GrrIKOkTLoZ1pLUkVoC
 G27BPOH0X78vrwltfhnAnd2DNmWetD/QcyCZHvmkP9B/55mPEYQQ0dzqbZ5uZQSnqI
 R5MC4GpZnJZtZH5k1iDtoZtuwqb+u1mTFeG01E37vLqZsEb3/4Uvr7tq7QRhmG6i+I
 2wuaDQJGouiM6ZXvz9t5b/dvo4o+SlKTUi1zJTp+k/3g/0DRl+VdjT2WupPBlfEc+U
 0ojampGhXbQsgG3gRwyaduhHDgEO5Suh/DIcEUAOp9JkZO4t6r3sP/NYBgdUpNobln
 D7f/bX8afs5VUpWDuzFkbVt4C2490xpmFvWQAx/SOSHtXzyulabvK71QdlMVBeBvw5
 QhTQEqsrRazDbCpdSegTxgR/Kd+02E7CvcdEjo7dD/DV/gD4Eg07ZH/UyGNRognoWx
 m6mMgdyorxTAteckUiFjx9r7r14BTdB65UpOZtFLAdcIxXlFybZHWrDPW5AIduiaWc
 Kn+jkeWlk6ppH81iR/cvea7A=
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2a8c54bbe46so68924475ad.2
 for <ltp@lists.linux.it>; Sat, 07 Feb 2026 06:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770476390; x=1771081190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S3TntVH20B5fQxuozGZZ/paf3OLh1S/0dRdEQQb73sk=;
 b=oNf4lSU/vEuZ0RkwCa+NHq0IUhuOiJmJHOE9xkIYX85Dqregt1IfqqbuZLZBginoiP
 +ieBkT8473rgOdtSWy0lbJsiFXaMbUsMrS/XCqQCXDVzQXuRScv2Mj36qlOM8Ke08j1d
 GvvrI7vH7A8xwAz/nG1QKSeL3O25DV5T7xpwjwpMYBATBPIYmzExde4T4FbR+/XX0goX
 WHrF6NgHXr0jWcVp5lENj7k3/UtYSaYTy1523J4V60jVHu3NB21poCB7XYc0LCYlmSUW
 bEDt7D8bHyRJKO7bGU1GAclXPcyO3n1OeaUdYtCt9UT0J8evkf/1WU2XOnpu+vdFKtoH
 tJjQ==
X-Gm-Message-State: AOJu0YwZKAjaeATzD/fBKsbqyw3sJQ01A+ealKiRcK6V/Lyn7nBBzaMO
 sRKMM9fDAVnuX7Xkp9ugyUv4eQYvItjLov4eh3+6aAaRCmP8xlqY0vGnNqF53YoAkp7o2VLPjT7
 6gehfjCAKaCTxIARq10iwEW2znyH+mZn9sIz0vGscHynxDyKaaEFMvyFuPC9ow4Weci0nVR6zp4
 1ezNU=
X-Gm-Gg: AZuq6aIgtx1+bopDmEAqPn4LZhNhdgtfVAZcRg2M6gxX1pyXd8qUyokeCw7IyC4m6Ge
 dh9GQDl0WQPAQlgWZ78rMox6BwmjvcoSWAtGBcNEZU+NqxGqQeoUgetlunzgH66aw+r1qKhiTQ8
 fgoJzPd3SRsQVYTWJmuNoQf9gbtcy24dztMFQjIoVGDAjTv+YgDHSkW7pu8Ux8LzuLkfTjV3tuI
 2uc8RcdG4u0ohynctxdTx0DM3vxF5CeICdqZbE6b87OqlhMKUwndqrjC50mUJEI60xEgEgOBO5p
 OzE44rdRtcBbQNt93djAxK1mOU3Y47yNqPtO14mAx4l+33e5irjYGfF1gBug1t5tr6CqWZOyGpB
 ZSk39uDiOEoeJWgn52Xe1Z/dJHnCmhUE=
X-Received: by 2002:a17:902:d58d:b0:2aa:d287:693d with SMTP id
 d9443c01a7336-2aad2876a7emr10521715ad.20.1770476390183; 
 Sat, 07 Feb 2026 06:59:50 -0800 (PST)
X-Received: by 2002:a17:902:d58d:b0:2aa:d287:693d with SMTP id
 d9443c01a7336-2aad2876a7emr10521615ad.20.1770476389740; 
 Sat, 07 Feb 2026 06:59:49 -0800 (PST)
Received: from localhost.localdomain ([123.208.221.96])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a9521ec5e8sm57655975ad.76.2026.02.07.06.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 06:59:49 -0800 (PST)
To: ltp@lists.linux.it
Date: Sun,  8 Feb 2026 01:59:42 +1100
Message-ID: <20260207145942.299366-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] lapi/tls: reserve pre-TCB space to avoid undefined
 behavior in clone10.c
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
	R_SPF_ALLOW(-0.20)[+a];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 36FD010648E
X-Rspamd-Action: no action

Allocate extra space before the TLS area to hold a struct pthread, ensuring
THREAD_SELF->cancelhandling is initialized to 0. This prevents undefined
behavior in __pthread_disable_asynccancel(), which is called at thread
cancellation points such as write().

Without this, touch_tls_in_child() could get stuck in tst_res().

(gdb) bt
  0  futex_wait () at ../sysdeps/nptl/futex-internal.h:141
  1  futex_wait_simple () at ../sysdeps/nptl/futex-internal.h:172
  2  __libc_disable_asynccancel () at ../nptl/cancellation.c:100
  3  __GI___libc_write () at ../sysdeps/unix/sysv/linux/write.c:26
  4  __GI___libc_write () at ../sysdeps/unix/sysv/linux/write.c:24
  5  print_result ()  at tst_test.c:387
  6  tst_vres_ () at tst_test.c:401
  7  tst_res_ () at tst_test.c:512
  8  touch_tls_in_child (arg=<optimized out>) at clone10.c:48
  9  thread_start () at ../sysdeps/unix/sysv/linux/aarch64/clone.S:78

Signed-off-by: Changwei Zou <changwei.zou@canonical.com>
---
 include/lapi/tls.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/lapi/tls.h b/include/lapi/tls.h
index 468fe3086..7f2fa18a1 100644
--- a/include/lapi/tls.h
+++ b/include/lapi/tls.h
@@ -22,6 +22,15 @@
 #define TLS_SIZE 4096
 #define TLS_ALIGN 16
 
+/*
+ * Space allocated large enough to hold a struct pthread.
+ *
+ * Zero-initialized to ensure THREAD_SELF->cancelhandling starts at 0,
+ * avoiding undefined behavior (e.g., in clone10.c) in __pthread_disable_asynccancel(),
+ * which is called at thread cancellation points such as write().
+ */
+#define TLS_PRE_TCB_SIZE (TLS_ALIGN * 256)
+
 #if defined(__x86_64__)
 typedef struct {
 	void *tcb;
@@ -36,10 +45,11 @@ extern void *tls_ptr;
 
 static inline void *allocate_tls_area(void)
 {
-	void *tls_area = aligned_alloc(TLS_ALIGN, TLS_SIZE);
+	char *tls_area = aligned_alloc(TLS_ALIGN, TLS_PRE_TCB_SIZE + TLS_SIZE);
 	if (!tls_area)
 		tst_brk(TBROK | TERRNO, "aligned_alloc failed");
-	memset(tls_area, 0, TLS_SIZE);
+	memset(tls_area, 0, TLS_PRE_TCB_SIZE + TLS_SIZE);
+	tls_area += TLS_PRE_TCB_SIZE;
 
 #if defined(__x86_64__)
 	tcb_t *tcb = (tcb_t *)tls_area;
@@ -59,7 +69,7 @@ static inline void free_tls(void)
 {
 	usleep(10000);
 	if (tls_ptr) {
-		free(tls_ptr);
+		free(((char *)tls_ptr) - TLS_PRE_TCB_SIZE);
 		tls_ptr = NULL;
 	}
 }
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
