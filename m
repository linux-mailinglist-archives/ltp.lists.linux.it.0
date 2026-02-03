Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIa7Iu5ggWn6FwMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Feb 2026 03:43:58 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35428D3D57
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Feb 2026 03:43:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770086637; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=MbFR41/J17KdTKag7wlq8U92mkT6dTrFZTGGksYiqsI=;
 b=dD6PetrKkM0azyc9+/KzfhTfl5517RV157h0i/QP6ZBqcCe8zWICKyx3Mha2yJQSrbKsG
 GZLq/mgZAsCcNJMUBqUUToVBK7C34h6XQjjnxloEEzAYorOySJw6v5Bx5wHeXDlvkjj2QHx
 jBqEVW+O4LH2mHyi1VPJWosqcNubVvc=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6E653CCF3A
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Feb 2026 03:43:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5236D3CC5F6
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 03:43:32 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 99FFD1A0098C
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 03:43:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770086610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1QEGPElWViM5JPB3Ddts/YQPIcT32Fe8uKbynbPYB8=;
 b=NuvN6EW7i/+8+J12eTXoJZRVd2asSogqfGu13C2AQAsWqQM5pMTGIyaEm4vN93PoYAtVHr
 ncjBxyIM3fvQ9QS7iSC5Cu/ZEbcK6szN0TfkxB3vogew0TxGq/uOV8Lt1y18CQKbuoXbFj
 VG3qY2rcfFxC+Z/lk+bWjoxXO182mQc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-KjQWtCAFO_OAQqGAfcNuNQ-1; Mon,
 02 Feb 2026 21:43:29 -0500
X-MC-Unique: KjQWtCAFO_OAQqGAfcNuNQ-1
X-Mimecast-MFC-AGG-ID: KjQWtCAFO_OAQqGAfcNuNQ_1770086608
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8D51E195608F
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 02:43:28 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.116.22])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 552B91956053
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 02:43:26 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  3 Feb 2026 10:43:20 +0800
Message-ID: <20260203024320.227453-2-liwang@redhat.com>
In-Reply-To: <20260203024320.227453-1-liwang@redhat.com>
References: <20260203024320.227453-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ehV6Oebs9D0wk2m49rjB-utCrF1rPfBnQQ53BdeClfU_1770086608
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 2/2] newlib_tests: add tst_filesystems01 to
 .gitignore
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url]
X-Rspamd-Queue-Id: 35428D3D57
X-Rspamd-Action: no action

Signed-off-by: Li Wang <liwang@redhat.com>
---
 lib/newlib_tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index a4984d2ec..1586e0ad6 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -46,6 +46,7 @@ test_macros03
 test_macros04
 test_macros05
 test_macros06
+tst_filesystems01
 tst_fuzzy_sync01
 tst_fuzzy_sync02
 tst_fuzzy_sync03
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
