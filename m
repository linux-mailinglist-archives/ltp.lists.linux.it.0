Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDJCJJzlhWnCHwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 13:59:08 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889AFDCBC
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 13:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770382747; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=u5sj9Z4xq/sG/TSljI5imgxXjvxr8s/lyygybce+ck4=;
 b=ZtGaL2/r+GdGjNtlGINVBCNKRawB02q7EwPDd39OgLIjHKvD6mg8VBrer6ZJ3MbZsz6Vf
 N0a1G9tclCRL7WLu30TU8XGQoYd904lDZ/yPFo2w4Rvevpb4qwcWQFwFfUrkJvff9AGNAkm
 yMZJZPIUEN44qdtT9xhTDLKHdrntdZk=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4D5C3CC829
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 13:59:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 41A4F3CC8E7
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 13:58:25 +0100 (CET)
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BD01A1A010E1
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 13:58:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
 Content-Type; bh=IMZraQJRqofW+ZTgOzoFYVuSsc+VgyGz6tO12L6Llmc=; b=qlCfbQb3uNOG
 ncw295W6ZKdkNVcnQKGkHBPyjKTvH0TAdo+OVpkb74oKNpkDI++/UOPyb3+dIBOTRpnnd1ET0B8so
 F15+rVlo+R5u0NN8X3draFwm6UZ1fGRZYVN2A6z9zRP5QfO2xqYt8TjnHQ4Lq8jNA/2oGWI3O/YFU
 zCpp55ta3m/aob0/N0z6tdJZrSQD4GofvtUSJ9S3KpDD+XybrD6+AAY2mDnzijvzViVIaIKsy1rji
 wJ51GOzF/YZaO0tOyj3jWyR/Yk+nUv8kaDzhshUiRrxLLSgpg+bWIoh6MMwWCyrJy+kK03SCd0hK7
 d4unip5/UkKyDmPFP3fDqA==;
Received: from [130.117.225.5] (helo=dev010.aci.vzint.dev)
 by relay.virtuozzo.com with esmtp (Exim 4.96)
 (envelope-from <vasileios.almpanis@virtuozzo.com>)
 id 1voLOr-000BYY-1D for ltp@lists.linux.it;
 Fri, 06 Feb 2026 13:58:19 +0100
To: ltp@lists.linux.it
Date: Fri,  6 Feb 2026 12:51:12 +0000
Message-ID: <20260206125818.319190-2-vasileios.almpanis@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206125818.319190-1-vasileios.almpanis@virtuozzo.com>
References: <20260206125818.319190-1-vasileios.almpanis@virtuozzo.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] add ETH_P_CAN compat macro to LAPI headers
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,virtuozzo.com:replyto,virtuozzo.com:email,virtuozzo.com:mid,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 5889AFDCBC
X-Rspamd-Action: no action

Signed-off-by: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
---
 include/lapi/if_ether.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/lapi/if_ether.h b/include/lapi/if_ether.h
index 536d1863a..423341c57 100644
--- a/include/lapi/if_ether.h
+++ b/include/lapi/if_ether.h
@@ -16,4 +16,8 @@
 # define ETH_P_ALL 0x0003
 #endif
 
+#ifndef ETH_P_CAN
+# define ETH_P_CAN 0x000C
+#endif
+
 #endif /* LAPI_IF_ETHER_H__ */
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
