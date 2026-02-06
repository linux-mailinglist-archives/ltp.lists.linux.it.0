Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP73HnrlhWnCHwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 13:58:34 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7167FDC91
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 13:58:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770382713; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=NAgVc+B2akDeqcCTZk3iAgn823d63avqGS9021Ax9/8=;
 b=HcNMzRi5vQhhvoCQ+v/L+i9CqzB6LEuMyeNBhRg6wjAmnEkXGQ+uPsBtLRnge085UvDVg
 V2W8Kx352zn4hEOx1106WmLAkOl0hQIhNGVc+fdeNCozJ1ibB263i3zGUQuL5SDTYYFCxE5
 40WZtSH7dcQq4rc5VrfFqNBH6tt22so=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7ECC23CC929
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 13:58:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 179603C19BA
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 13:58:21 +0100 (CET)
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7E293200DAB
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 13:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
 Content-Type; bh=Rzhg6bY7iDeO2ZbrAHEDaVNfftCmvTihJHYDdHnyfx4=; b=Vx5Asz2/825q
 hvy6WJ6h6SKrM7Jk4BL2qDo5Hpbnd52N98a0LihJ/WxFhLJ4K6nXdyguISzqZyX/W4TP6wysm4clV
 XhfJjoEzPyEWnEn3SQq/QyP/ZxX1ORce5k5EkTOj/TrpfVaxZI5XllJBdYdw/Kx3DkeCb8r3BiYTY
 mdwrew4dL0P+irZOX5Ga07loCFhL0ctuOqdToEeanmwCw/OqUEJIrbs9L8BQXRuxvxhpFSH+n9qZK
 5GTg0Qbf93w176fnsm0d4hwm5QYa7LtmJa8oCsCNWEy4tthf4A0ojYmr6wcOiAQPgfKmXdBYDEa12
 GNzPUZ9eq38KQJd6dQ95Pw==;
Received: from [130.117.225.5] (helo=dev010.aci.vzint.dev)
 by relay.virtuozzo.com with esmtp (Exim 4.96)
 (envelope-from <vasileios.almpanis@virtuozzo.com>)
 id 1voLOo-000BYY-1q for ltp@lists.linux.it;
 Fri, 06 Feb 2026 13:58:17 +0100
To: ltp@lists.linux.it
Date: Fri,  6 Feb 2026 12:51:11 +0000
Message-ID: <20260206125818.319190-1-vasileios.almpanis@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/2] pty: use correct protocol in pty04 based on line
 discipline
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	DKIM_TRACE(0.00)[lists.linux.it:+,virtuozzo.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: E7167FDC91
X-Rspamd-Action: no action

Hi,

during testing of the LTP pty test pty04, we observed intermittent
failures caused by unexpected IPv6 packets being received.

The test currently filters packets using ETH_P_ALL. As a result,
packets with protocols other than the expected one (e.g. IPv6) may be
received, leading to data corruption reports such as:

TFAIL: Corrupt data (max 64 of 8191 bytes shown): data[0..64] =
TFAIL: 60 00 00 00 00 24 00 01 00 00 00 00 00 00 00 00
TFAIL: 00 00 00 00 00 00 00 00 ff 02 00 00 00 00 00 00
TFAIL: 00 00 00 00 00 00 00 16 3a 00 05 02 00 00 01 00
TFAIL: 8f 00 6e 8a 00 00 00 01 04 00 00 00 ff 02 00 00

This patch series addresses the issue by selecting the protocol based
on the configured line discipline.

Patch 1 adds a compatibility definition for ETH_P_CAN to the LAPI
headers. Patch 2 updates pty04 to choose the appropriate protocol,
avoiding reception of unrelated packets.

Signed-off-by: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>

Vasileios Almpanis (2):
  add ETH_P_CAN compat macro to LAPI headers
  pty04: use the correct protocol per line discipline to avoid extra
    packets

 include/lapi/if_ether.h      |  4 ++++
 testcases/kernel/pty/pty04.c | 15 ++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
