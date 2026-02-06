Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGNlMJDlhWnCHwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 13:58:56 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C5FDCAD
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 13:58:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770382735; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=N44q8YaRFCWuiBVdNmtpm2e1dXd2oVY1gOWdwLGl0dg=;
 b=ONr/soexACmz79DZlns8FxgMIDjmJ2vN1F5oFzix6CQJFXBxUVAG82Wg0JR7Vg8YBp4iN
 eXuQr2R1Xv/eK3YoldpuKMmUyA8GxxreP7MUTP9bTBdEohxSMW8TJ4fKMG8uLCoK9QzBL+y
 Q7XAoEB/UvZEAQ9MxUInUq+siSdsGwU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA6423CC85A
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 13:58:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F6823CC88D
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 13:58:24 +0100 (CET)
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1ACB3600F27
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 13:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
 Content-Type; bh=hi4VIPvvqDiQ3P+wTBTTXSgJATctWBEzgc2d4wSTx+o=; b=fKfCk7dWy1cs
 VqXYdXZwPGFLn4VIQepiYTBeuwRmqP8jtqZZIaS0Tr045KvmnZp5K792XQREd5v+NuXG9ZUsgweeo
 8/LhkN9cPtK+hjdAtYAfYbdrfj/1h7cIWyK8g1WkipoCcAKJB5ioweDbMJdEHqkc/VKMselfrkTmx
 9nzae/+XhkfznnQR+aZLNcSiatEez6D/ZrbWYJ1BpnuAu2x8tdNb6/oRd8cTA0LD7auqcy7hgndZW
 nNsQr572Ji3mGQ/vwGsZFPYGyZC+lhHJN4D8k/MaRIwX8inThwf1wmlqw0ZuVSlhbtYlJQsIqxnWI
 qZV1IgcWwTXUvyQMrCyWuQ==;
Received: from [130.117.225.5] (helo=dev010.aci.vzint.dev)
 by relay.virtuozzo.com with esmtp (Exim 4.96)
 (envelope-from <vasileios.almpanis@virtuozzo.com>)
 id 1voLOr-000BYY-1Q for ltp@lists.linux.it;
 Fri, 06 Feb 2026 13:58:19 +0100
To: ltp@lists.linux.it
Date: Fri,  6 Feb 2026 12:51:13 +0000
Message-ID: <20260206125818.319190-3-vasileios.almpanis@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206125818.319190-1-vasileios.almpanis@virtuozzo.com>
References: <20260206125818.319190-1-vasileios.almpanis@virtuozzo.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] pty04: use the correct protocol per line
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[virtuozzo.com:s=relay];
	DKIM_TRACE(0.00)[lists.linux.it:+,virtuozzo.com:-];
	HAS_REPLYTO(0.00)[vasileios.almpanis@virtuozzo.com];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim,virtuozzo.com:replyto,virtuozzo.com:email,virtuozzo.com:mid]
X-Rspamd-Queue-Id: 676C5FDCAD
X-Rspamd-Action: no action

Use specific protocol filter (ETH_P_IP for N_SLIP, ETH_P_CAN for N_SLCAN)
instead of ETH_P_ALL to avoid catching unrelated packets like IPv6
multicast (MLD) which cause false test failures.

Signed-off-by: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
---
 testcases/kernel/pty/pty04.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index 204703253..770c053c4 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -258,6 +258,19 @@ static void open_netdev(const struct ldisc_info *ldisc)
 {
 	struct ifreq ifreq = { 0 };
 	struct sockaddr_ll lla = { 0 };
+	int protocol;
+
+	switch (ldisc->n) {
+		case N_SLIP:
+			protocol = ETH_P_IP;
+			break;
+		case N_SLCAN:
+			protocol = ETH_P_CAN;
+			break;
+		default:
+			protocol = ETH_P_ALL;
+			break;
+	}
 
 	SAFE_IOCTL(pts, SIOCGIFNAME, ifreq.ifr_name);
 	tst_res(TINFO, "Netdev is %s", ifreq.ifr_name);
@@ -282,7 +295,7 @@ static void open_netdev(const struct ldisc_info *ldisc)
 	SAFE_IOCTL(sk, SIOCGIFINDEX, &ifreq);
 
 	lla.sll_family = PF_PACKET;
-	lla.sll_protocol = htons(ETH_P_ALL);
+	lla.sll_protocol = htons(protocol);
 	lla.sll_ifindex = ifreq.ifr_ifindex;
 	SAFE_BIND(sk, (struct sockaddr *)&lla, sizeof(struct sockaddr_ll));
 
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
