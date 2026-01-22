Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHRHAYEHcmmOagAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 12:18:25 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE865DEC
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 12:18:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769080704; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=cVGBo+X3lWZWYn2RVHcn1p6ScnJgXEnTL8C90V3N2tU=;
 b=dXjVji9+ON/WVGAw038cJ0iLqHSnxYuHDfuB4uqYWuBnhy5ZuLAhqf4Y9nZ85YsPGJVVl
 Hm/JUwpWUpOUfDCaC3AC+OUTDSZET/1yESLhn+7I0Qexv1+YDbuVM3J7IcTKSmZOKNweukS
 /TKyC1+HLrNsQ32+eUGyO8k3YvdSN2s=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B41D3C4C70
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 12:18:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8F17D3C1B59
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 12:18:21 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 08FBE1400BE3
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 12:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769080699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=krWnXV/pr51jYQOAf/uLc4RJqOv1WAthFg3Xx6gUyWQ=;
 b=KwRgof2yZbM/8KmxJguHkRrMHc/rtGtuhBIq3lUVe6MCNadfZpVdNqG8bTtXfV9zuZu2ka
 vSUfBh1xISF96m/CbprmRo1yq0dKM3+EgY/NgmFsLb2Gy8mXJQvPUULvloxJBju1KSihSE
 MkAv94YDzyM2g1HQsmQjKYmCH7WvRY0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549-WB3XhnF7OaCsmP-oP01gxw-1; Thu,
 22 Jan 2026 06:18:17 -0500
X-MC-Unique: WB3XhnF7OaCsmP-oP01gxw-1
X-Mimecast-MFC-AGG-ID: WB3XhnF7OaCsmP-oP01gxw_1769080697
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DF32D193E8F1; Thu, 22 Jan 2026 11:18:16 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.116.167])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 59EF21800999; Thu, 22 Jan 2026 11:18:14 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 22 Jan 2026 19:18:10 +0800
Message-ID: <20260122111810.91411-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wvLq_31AgSzkbvntCX5kCfAqXs6-4FLtnPU7zAlSUVw_1769080697
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] vma05: fix the needs_cmds format
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Rspamd-Queue-Id: 94EE865DEC
X-Rspamd-Action: no action

Fixes: 39a28444272 ("lib: Add support option for .needs_cmds")
Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Wei Gao <wegao@suse.com>
---
 testcases/kernel/mem/vma/vma05.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/mem/vma/vma05.sh b/testcases/kernel/mem/vma/vma05.sh
index 34a82162c..b9654e80c 100755
--- a/testcases/kernel/mem/vma/vma05.sh
+++ b/testcases/kernel/mem/vma/vma05.sh
@@ -26,7 +26,14 @@
 # {
 #  "needs_root": true,
 #  "needs_tmpdir": true,
-#  "needs_cmds": ["gdb", "uname"],
+#  "needs_cmds": [
+#     {
+#       "cmd": "gdb"
+#     },
+#     {
+#       "cmd": "uname"
+#     }
+#   ],
 #  "save_restore": [
 #   ["/proc/sys/kernel/core_pattern", "core", "TBROK"],
 #   ["/proc/sys/kernel/core_uses_pid", "0", "TBROK"]
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
