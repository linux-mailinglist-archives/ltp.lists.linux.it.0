Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLmaJewynGkKAgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:58:52 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4041B175395
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:58:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771844331; h=to :
 message-id : references : in-reply-to : date : mime-version : subject
 : list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=8i+9spDgANL4SL5/yivz1g/1ueMTBzbdhbdKei3W6SQ=;
 b=PsHfEB0EPaYA5ISX25SI8qjTSWHBQYUCezfcj0S0Nh0hpN+lwg1Tuno3EOBA6s3tz/zBv
 zNAjKhrVv2ND2+1dbQxnfnKn+WYkSxS3D8WUMy1bz4EQHWreHFuJXrnKKvl0m8v0psqkou+
 DsN6aOri13G5R/C20DBJ5IMJVpZAHLU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B22D43D0EEC
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:58:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 37B1F3CBBE1
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 04:18:39 +0100 (CET)
Received: from lf-1-128.ptr.blmpb.com (lf-1-128.ptr.blmpb.com
 [103.149.242.128])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BCBB71A00142
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 04:18:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1771816712; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=3Jqv1J878PeKRegBxQN8B7FN0/VUtsafCVJl9menxgw=;
 b=Si8v/ORq+CvqEvJmAWvsLGiXhbGFwAWIKulj8KVXQjQkXkseFZA4xH164tA/tK7LDGp4sc
 qTprCyFd/5oGqW6MfDslpEVaIewpeyThL3VpjK6T56Bzvp5teTzXNag6YtJSu3vDSWIBEv
 JmtE5v0yviSg4UE3fFyD/EeEyEZ/IA0+coQP6PtZVhJjzHb25smL4RHDHFRjrW/gYXif9p
 saelFyjg6uTd9AXMFcJTfnq0SzmdUeQNyfhI7o3MCmOwyLPsndC5BtQVWXXB6k8P8ykMSg
 QuVY8xYGTUgKgnzCU75UJi0vCEZNNSe8H4pQD+20SrbPKnR3rsPGW3zZZ3dfvg==
X-Lms-Return-Path: <lba+2699bc706+2687d0+lists.linux.it+weiguixiong@bytedance.com>
To: <ltp@lists.linux.it>
Message-Id: <20260223031903.4037526-4-weiguixiong@bytedance.com>
References: <20260223031903.4037526-1-weiguixiong@bytedance.com>
In-Reply-To: <20260223031903.4037526-1-weiguixiong@bytedance.com>
X-Mailer: git-send-email 2.20.1
Date: Mon, 23 Feb 2026 11:19:02 +0800
Mime-Version: 1.0
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 23 Feb 2026 11:57:56 +0100
Subject: [LTP] [PATCH 3/4] syscalls/ipc: shmctl04: Use SAFE_FOPEN for /proc
 parsing
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
From: Guixiong Wei via ltp <ltp@lists.linux.it>
Reply-To: Guixiong Wei <weiguixiong@bytedance.com>
Cc: Guixiong Wei <weiguixiong@bytedance.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	R_DKIM_REJECT(0.00)[bytedance.com:s=2212171451];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[weiguixiong@bytedance.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,bytedance.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns,bytedance.com:mid,bytedance.com:email,bytedance.com:replyto]
X-Rspamd-Queue-Id: 4041B175395
X-Rspamd-Action: no action

Use SAFE_FOPEN/SAFE_FCLOSE when reading /proc/sysvipc/shm.

Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
index 967e5d4b2..97e84efb6 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -22,6 +22,7 @@
 #include <stdio.h>
 #include <pwd.h>
 #include "tst_test.h"
+#include "tst_safe_stdio.h"
 #include "tst_safe_sysv_ipc.h"
 #include "tse_newipc.h"
 #include "lapi/shm.h"
@@ -42,7 +43,7 @@ static struct tcases {
 static void parse_proc_sysvipc(struct shm_info *info)
 {
 	int page_size = getpagesize();
-	FILE *f = fopen("/proc/sysvipc/shm", "r");
+	FILE *f = SAFE_FOPEN("/proc/sysvipc/shm", "r");
 	int used_ids = 0;
 	int shmid_max = 0;
 	unsigned long shm_rss = 0;
@@ -105,7 +106,7 @@ static void parse_proc_sysvipc(struct shm_info *info)
 		tst_res(TPASS, "shm_tot = %li", shm_tot);
 	}
 
-	fclose(f);
+	SAFE_FCLOSE(f);
 }
 
 static void verify_shminfo(unsigned int n)
-- 
2.20.1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
