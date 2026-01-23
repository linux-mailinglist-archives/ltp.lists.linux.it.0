Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGhFFHxhc2kCvQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 12:54:36 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC2D756C3
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 12:54:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769169275; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : content-type : content-transfer-encoding : sender :
 from; bh=JQfgcp85FlDJ55MbEbKstrJzhMStMzrx5NtR7fu/Z3I=;
 b=rfw0Rqjal5aHwifAnKuRnaa/wKwlFymCLks60JxJSyFquIzziY58rqZNcWPfyfdWFwsLt
 gLpUFG2rL8NoM45iYQ4yJ4A3EM6UvdfiZl0wTK/4+ze2eUiJvh5iZE0oE+fjJh2E2AS2IrT
 n/O/zZPzW/ThLGWFgLp9tRoiJEDM8qI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0C8A3CB604
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 12:54:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F423C3CB5C9
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 12:54:33 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 18AB3140051A
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 12:54:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769169270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NKJQaRCvGpJAlB0d11H6UErBMq638Dl/k20F6tfN7Vg=;
 b=hmy7SbjNnoIxNrLQg++TrKIU5h9ObCRAGJ3FOFhG5aXFAF639Me40mX1VMpvd/fPH6/wTF
 TaVK8wCDc5c9gSgzCxma6IE8e18uVlF1CErzzpJHV1IDD82tb9cAbPwfgmyaE1efvkYRP6
 S2xnUWm8MArSpTkPgRfSpetmZo2rIBc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-357-G2R2QTtROty6bXyyMSbj7g-1; Fri,
 23 Jan 2026 06:54:27 -0500
X-MC-Unique: G2R2QTtROty6bXyyMSbj7g-1
X-Mimecast-MFC-AGG-ID: G2R2QTtROty6bXyyMSbj7g_1769169266
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 42DA11800473; Fri, 23 Jan 2026 11:54:26 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.116.11])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A168318004D8; Fri, 23 Jan 2026 11:54:24 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 23 Jan 2026 19:54:19 +0800
Message-ID: <20260123115419.154326-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ajOzCfebKLAwEkCDEDYbum3HmOI7a_CEzENI8VyDAcA_1769169266
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] userfaultfd05: require
 CONFIG_HAVE_ARCH_USERFAULTFD_WP
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
Cc: Ricardo Branco <rbranco@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	NEURAL_HAM(-0.00)[-0.971];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url]
X-Rspamd-Queue-Id: EAC2D756C3
X-Rspamd-Action: no action

Kernels built without arch UFFD-WP support (CONFIG_HAVE_ARCH_USERFAULTFD_WP)
can report "WP unsupported" in different ways (e.g. UFFDIO_API
returns -1/EINVAL on some newer kernels, while others succeed but do not
advertise UFFD_FEATURE_PAGEFAULT_FLAG_WP in the returned features mask).

Rather than relying on runtime probing that varies across kernels,
require CONFIG_HAVE_ARCH_USERFAULTFD_WP=y via .needs_kconfigs and use
SAFE_IOCTL() for UFFDIO_API again.

Follow-up: 485a4cd2ba3 ("userfaultfd05: allow TCONF when UFFD-WP is unsupported")
Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Ricardo Branco <rbranco@suse.com>
---
 testcases/kernel/syscalls/userfaultfd/userfaultfd05.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/userfaultfd/userfaultfd05.c b/testcases/kernel/syscalls/userfaultfd/userfaultfd05.c
index 6cae45f20..e25a227cf 100644
--- a/testcases/kernel/syscalls/userfaultfd/userfaultfd05.c
+++ b/testcases/kernel/syscalls/userfaultfd/userfaultfd05.c
@@ -92,12 +92,8 @@ static void run(void)
 
 	uffdio_api.api = UFFD_API;
 	uffdio_api.features = UFFD_FEATURE_PAGEFAULT_FLAG_WP;
-	if (ioctl(uffd, UFFDIO_API, &uffdio_api) < 0) {
-		if (!(uffdio_api.features & UFFD_FEATURE_PAGEFAULT_FLAG_WP))
-			tst_brk(TCONF, "UFFD write-protect unsupported");
 
-		tst_brk(TBROK | TERRNO, "ioctl() on userfaultfd failed");
-	}
+	SAFE_IOCTL(uffd, UFFDIO_API, &uffdio_api);
 
 	uffdio_register.range.start = (unsigned long) page;
 	uffdio_register.range.len = page_size;
@@ -128,4 +124,8 @@ static void run(void)
 static struct tst_test test = {
 	.test_all = run,
 	.min_kver = "5.7",
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_HAVE_ARCH_USERFAULTFD_WP=y",
+		NULL
+	}
 };
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
