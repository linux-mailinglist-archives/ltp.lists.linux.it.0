Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HnJHM0ynGkKAgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:58:21 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C01D175357
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771844300; h=references :
 date : in-reply-to : to : message-id : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=ZfDpvBBTyoJPBivkktgqyLiLu7kNl8425IH1TE14ymk=;
 b=NAbaqShbeA52sv4ir4VaPRM0S0BHrvDfVWrGL3zDa5s68IN5rYsuX2Auuqu9NjoJyMPes
 2IbGmFl4HZh/Ai4gjs5BCmrweHX/Q8fQBQPIDfJXN5CsX7WvVnmXet/n5z8CHcNRfEo/nEp
 sjbDzX6B5I/3NAh2K00BZ97smlr2Nus=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90DCB3D0EFF
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:58:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 934FB3CBBE1
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 04:18:31 +0100 (CET)
Received: from lf-1-131.ptr.blmpb.com (lf-1-131.ptr.blmpb.com
 [103.149.242.131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 94EED1000480
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 04:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1771816702; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=c6f7APRbJk4XiU9/hOnM1PApJeCDjD64Pf/Gkb7q03A=;
 b=NmxTV/fbl6rrIAG1hBLoSnAW5qEW91R+wjsQlYtxcC2+QGg39J2aoAST/gFFZ6X65jUcdJ
 V0SbeJQ+mGOHx+s4wsiATjk8PBC1PhWPgwRWMMjwskYLMa9QH7/841/6TGE17MF7xjw0ls
 RgS72Jks0xCdKPdr+CiQ5hXO/AaIlgeZeCDVZe/Oi04HogEbrEoC9WtvqPtkILINKQMk4D
 XNuh9+lY6N2EXnV34bVeG2qysJushj/QB2jXsO91nX4ANZjKz5pqxt7zWYv6X3ZTqJ/Sud
 ZXupCih7lTUhopzCvv0zt9viykuR0Z+B4AaR01m6wD8S+QkPOcp4CtjrRXFq/g==
References: <20260223031903.4037526-1-weiguixiong@bytedance.com>
X-Lms-Return-Path: <lba+2699bc6fc+3f8540+lists.linux.it+weiguixiong@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
Date: Mon, 23 Feb 2026 11:19:00 +0800
In-Reply-To: <20260223031903.4037526-1-weiguixiong@bytedance.com>
To: <ltp@lists.linux.it>
Message-Id: <20260223031903.4037526-2-weiguixiong@bytedance.com>
Mime-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 23 Feb 2026 11:57:56 +0100
Subject: [LTP] [PATCH 1/4] syscalls/ipc: shmctl04: Parse /proc/sysvipc/shm
 size as unsigned long
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns,bytedance.com:mid,bytedance.com:email,bytedance.com:replyto,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 1C01D175357
X-Rspamd-Action: no action

The size column in /proc/sysvipc/shm may exceed int range on
some systems. Parse it as unsigned long.

Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
index 3ba05f9b5..908cd2926 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -57,7 +57,8 @@ static void parse_proc_sysvipc(struct shm_info *info)
 			break;
 	}
 
-	int shmid, size, rss, swap;
+	int shmid, rss, swap;
+	unsigned long size;
 
 	/*
 	 * Sum rss, swap and size for all elements listed, which should equal
@@ -66,7 +67,7 @@ static void parse_proc_sysvipc(struct shm_info *info)
 	 * Note that the size has to be rounded up to nearest multiple of page
 	 * size.
 	 */
-	while (fscanf(f, "%*i %i %*i %i %*i %*i %*i %*i %*i %*i %*i %*i %*i %*i %i %i",
+	while (fscanf(f, "%*i %i %*i %lu %*i %*i %*i %*i %*i %*i %*i %*i %*i %*i %i %i",
 			&shmid, &size, &rss, &swap) > 0) {
 		used_ids++;
 		shm_rss += rss/page_size;
-- 
2.20.1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
