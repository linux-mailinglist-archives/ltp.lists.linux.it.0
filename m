Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMNDJbVqo2mACgUAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Feb 2026 23:22:45 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F10BC1C9784
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Feb 2026 23:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772317364; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=yHlCuGkvSBDOfGTMQdoOMzdsPJT0LVgXhzagtWUZJfo=;
 b=XabcsaWsK1OkPAGO2afaX1fFWdZgNMj+YRvIjZnAL+zpvg8/4DahYWcu9nnFHQk+HK6N2
 +VKaqejUqOUrXfbroKf4TvGAPYIoEuQkAE4YRbJTRcv5Xrw/KwY90CcqXn0pwVxoU5Flvh4
 LSRErHZKWErztmkvxR3hhA1CT10+cyE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96AE23CDAA9
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Feb 2026 23:22:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D1CC43CDAA9
 for <ltp@lists.linux.it>; Sat, 28 Feb 2026 23:22:31 +0100 (CET)
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3EF59600141
 for <ltp@lists.linux.it>; Sat, 28 Feb 2026 23:22:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
 Content-Type; bh=xqlySQTW4nRrIJ3hZfbLAbCZZ6mMLdHzBvjYQBC4rgw=; b=cCf8QJhKxsXc
 uvqrIL2q6VZ1En4Yv8bamD8oGWDz05JNSN0kscrTxK2T/oyTv7VUKlSuOd+U7+qm4xx4Lqv3DmDVy
 fs8gSBzCnRMT88UfS7n0GwqDVBA/myFK6OUdFEacj3ei0wG8D4BQDXWEKmTcWCTNll7kNZXp3C+O5
 XSd42eLTW4VT2oGNLrfDJhtCOkrTADgA/68fuHf76neZ6ru5K5TcWNTnzOT3/IbOIVhwRISPNuqqE
 lVMx+n2L8N+sgxMNuS71qbuFKWfwhVjU5o8E/Nkb/1Xomx1QdPhV0JlvesFh2HJSunCKJ+3R+97Z2
 Ts93sIhFgqq72HUGWv2Rmg==;
Received: from [130.117.225.5] (helo=dev010.aci.vzint.dev)
 by relay.virtuozzo.com with esmtp (Exim 4.96)
 (envelope-from <vasileios.almpanis@virtuozzo.com>)
 id 1vwSgI-00GKKs-2r; Sat, 28 Feb 2026 23:22:23 +0100
To: ltp@lists.linux.it
Date: Sat, 28 Feb 2026 22:22:08 +0000
Message-ID: <20260228222227.779444-1-vasileios.almpanis@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 1/1] pty04: use the correct protocol per line
 discipline to avoid extra packets
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
From: Vasileios Almpanis via ltp <ltp@lists.linux.it>
Reply-To: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	R_DKIM_REJECT(0.00)[virtuozzo.com:s=relay];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[vasileios.almpanis@virtuozzo.com];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	DKIM_TRACE(0.00)[lists.linux.it:+,virtuozzo.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[virtuozzo.com:mid,virtuozzo.com:email,virtuozzo.com:replyto,linux.it:url]
X-Rspamd-Queue-Id: F10BC1C9784
X-Rspamd-Action: no action

Use specific protocol filter (ETH_P_IP for N_SLIP, ETH_P_CAN for N_SLCAN)
instead of ETH_P_ALL to avoid catching unrelated packets like IPv6
multicast (MLD) which cause false test failures.

Signed-off-by: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
---
v3:
- Removes switch statement
- Adds protocol to the ldisc_info structure

 testcases/kernel/pty/pty04.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index 204703253..720431685 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -84,11 +84,12 @@ struct ldisc_info {
 	int n;
 	char *name;
 	int mtu;
+	int protocol;
 };
 
 static struct ldisc_info ldiscs[] = {
-	{N_SLIP, "N_SLIP", 8192},
-	{N_SLCAN, "N_SLCAN", CAN_MTU},
+	{N_SLIP, "N_SLIP", 8192, ETH_P_IP},
+	{N_SLCAN, "N_SLCAN", CAN_MTU, ETH_P_CAN},
 };
 
 static int ptmx = -1, pts = -1, sk = -1, mtu, no_check;
@@ -282,7 +283,7 @@ static void open_netdev(const struct ldisc_info *ldisc)
 	SAFE_IOCTL(sk, SIOCGIFINDEX, &ifreq);
 
 	lla.sll_family = PF_PACKET;
-	lla.sll_protocol = htons(ETH_P_ALL);
+	lla.sll_protocol = htons(ldisc->protocol);
 	lla.sll_ifindex = ifreq.ifr_ifindex;
 	SAFE_BIND(sk, (struct sockaddr *)&lla, sizeof(struct sockaddr_ll));
 
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
