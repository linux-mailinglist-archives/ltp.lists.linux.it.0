Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J7dEvkynGkKAgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:59:05 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E041753A4
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:59:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771844344; h=message-id :
 mime-version : references : in-reply-to : date : to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=rthsznYsvLhyGreapEiS/n49Oci4uCZcLou+E0dBxh8=;
 b=DFP4QfhiyjwsVQmqmrVe00Pj2dVzxZH9sp5byZcKSIcLLmm4mB+ASpPr4JCSFZy9MGsxl
 raF0OcPv4bWI4g2wG3NaJtICf4nBIrUXdVNiUEXPwDvJLjdNEDOyOUhyXOV8mscE7h/+iUt
 Z/UpKthPnn+kWvQhQWqyQpA7mahQObY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87DCC3CCB8E
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:59:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2E7B83CBBE1
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 04:18:41 +0100 (CET)
Received: from lf-1-129.ptr.blmpb.com (lf-1-129.ptr.blmpb.com
 [103.149.242.129])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 60EAF2000D2
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 04:18:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1771816707; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=rRbhea4LMmEAHRhOUn5PiESHZVazMDVQ3GSgP27y2is=;
 b=eT+ORxOFi/I0H+MjCIp2bNg8x2XqZ3QYt1ngPfQlCis7DD2nQUui0CKhw4Jhn9wkNUHuX6
 M1Dl5Msjc7faxo7AAigLBdKRAPuueSfBLU1T7B0B9NtM4LjlSLjk8N53tccEkk3GP+gDnc
 ZmF8Hu1OpacbTN3YP9GZQmMrbTNgS2vzruVaPMGFISo4Ezfa/sWlEqh2cs2M6X/WFaIpDX
 2ynfLlXpHptzvhsSnmgVnVf/w75ydl+a1/ZLDEd6Kl9HJuqqIV90+YjWamwTLc3zYxp0mp
 PGbRIgXzHCA62s74E+RtgS8DfMiCTZyggSUCzjj3bgVR2p702TY1znQq493UMg==
Message-Id: <20260223031903.4037526-3-weiguixiong@bytedance.com>
Mime-Version: 1.0
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
References: <20260223031903.4037526-1-weiguixiong@bytedance.com>
In-Reply-To: <20260223031903.4037526-1-weiguixiong@bytedance.com>
Date: Mon, 23 Feb 2026 11:19:01 +0800
X-Lms-Return-Path: <lba+2699bc701+7d2b0a+lists.linux.it+weiguixiong@bytedance.com>
To: <ltp@lists.linux.it>
X-Mailer: git-send-email 2.20.1
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 23 Feb 2026 11:57:56 +0100
Subject: [LTP] [PATCH 2/4] syscalls/ipc: shmctl04: Require full fscanf match
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
X-Rspamd-Queue-Id: F2E041753A4
X-Rspamd-Action: no action

Stop parsing /proc/sysvipc/shm when fscanf() does not match all
expected fields, to avoid using stale values from previous iterations.

Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
index 908cd2926..967e5d4b2 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -68,7 +68,7 @@ static void parse_proc_sysvipc(struct shm_info *info)
 	 * size.
 	 */
 	while (fscanf(f, "%*i %i %*i %lu %*i %*i %*i %*i %*i %*i %*i %*i %*i %*i %i %i",
-			&shmid, &size, &rss, &swap) > 0) {
+			&shmid, &size, &rss, &swap) == 4) {
 		used_ids++;
 		shm_rss += rss/page_size;
 		shm_swp += swap/page_size;
-- 
2.20.1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
