Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGU4JRgznGkKAgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:59:36 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 412771753D1
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:59:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771844376; h=date :
 message-id : in-reply-to : references : to : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=040yvxdya2/AOF5ezyqFiuzd3/eQw8M1hPKYZwG64Eg=;
 b=bUi4h8eQM+yRvs0UFk12liDEKImkgWALlk/XqSTQvxGZAveLk2xFWulqBrrzyF+3zzQkl
 16g8e6nh3vgopyaC/ZeTfqM0FgDSEWEjEtSdtjxjOk0z780s1C4B39ArRDHacqsSK4ycDOX
 wE8fpr/7dWHT3LqXyb+K6wPR3Hfa1PQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC8003D0EF9
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:59:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E7C23D066D
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 04:18:45 +0100 (CET)
Received: from lf-1-128.ptr.blmpb.com (lf-1-128.ptr.blmpb.com
 [103.149.242.128])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 76B4C2000D2
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 04:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1771816717; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=t0pdGuUkXJpizz+Yw8QvTNxJ19e8DkTjaYaZByI20FU=;
 b=oh8P27+aV/d3KZgRzVpZAIgOFhxRcqoLB40Y8lZgLrpUoLBddAJ60/0O1W2F5Ug3v6XS5D
 +66RJsQK1+o6Gbbv30m8rWWdjZTJydJ3ERE9hymBqgyjwb49s7gqDBlShuindN3PBXdHxk
 4L3nc15SBzrMYlEbc6bu932HIgczLma5BFiQDNBuaD5WZB5aqCJZQcoSBpsq21wVMzFUyr
 2BTpMftp7748oPWKN9IHDYOFABqPEQ2hlDkK8Tb/xI5htszX+oTlp+NZrZolPexcbFujL/
 2Rhhgdgh/FUyVEhED2j9dgdSsQ/+2hmOqnUCaKdbH+sSAxrcnnlY2hGt3TWOZg==
Date: Mon, 23 Feb 2026 11:19:03 +0800
Message-Id: <20260223031903.4037526-5-weiguixiong@bytedance.com>
In-Reply-To: <20260223031903.4037526-1-weiguixiong@bytedance.com>
X-Lms-Return-Path: <lba+2699bc70b+7b3caa+lists.linux.it+weiguixiong@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
References: <20260223031903.4037526-1-weiguixiong@bytedance.com>
To: <ltp@lists.linux.it>
Mime-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 23 Feb 2026 11:57:56 +0100
Subject: [LTP] [PATCH 4/4] syscalls/ipc: shmctl04: Fix shm_info print formats
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
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[weiguixiong@bytedance.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,bytedance.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns,bytedance.com:mid,bytedance.com:email,bytedance.com:replyto]
X-Rspamd-Queue-Id: 412771753D1
X-Rspamd-Action: no action

Use %lu when printing unsigned long counters parsed from /proc and
cast shm_info fields to match the format specifiers.

Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
index 97e84efb6..f436e763d 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -86,24 +86,24 @@ static void parse_proc_sysvipc(struct shm_info *info)
 	}
 
 	if (info->shm_rss != shm_rss) {
-		tst_res(TFAIL, "shm_rss = %li, expected %li",
+		tst_res(TFAIL, "shm_rss = %lu, expected %lu",
 			info->shm_rss, shm_rss);
 	} else {
-		tst_res(TPASS, "shm_rss = %li", shm_rss);
+		tst_res(TPASS, "shm_rss = %lu", shm_rss);
 	}
 
 	if (info->shm_swp != shm_swp) {
-		tst_res(TFAIL, "shm_swp = %li, expected %li",
+		tst_res(TFAIL, "shm_swp = %lu, expected %lu",
 			info->shm_swp, shm_swp);
 	} else {
-		tst_res(TPASS, "shm_swp = %li", shm_swp);
+		tst_res(TPASS, "shm_swp = %lu", shm_swp);
 	}
 
 	if (info->shm_tot != shm_tot) {
-		tst_res(TFAIL, "shm_tot = %li, expected %li",
+		tst_res(TFAIL, "shm_tot = %lu, expected %lu",
 			info->shm_tot, shm_tot);
 	} else {
-		tst_res(TPASS, "shm_tot = %li", shm_tot);
+		tst_res(TPASS, "shm_tot = %lu", shm_tot);
 	}
 
 	SAFE_FCLOSE(f);
-- 
2.20.1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
