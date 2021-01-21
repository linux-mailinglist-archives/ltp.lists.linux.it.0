Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CACC62FECA7
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 15:09:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E7B53C63AA
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 15:09:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C6E6B3C2B50
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 15:09:31 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 64040600733
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 15:09:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611238170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=aMJcBkO3OvWbYsaDcAchZ2h3TpjkjChmp3hiwkMJVlc=;
 b=Bf9ZwrqFrhdRYp3Ov5MFWkU1h9WvmDWIubodkGFfqkEMcEEUipZsyYnJsKBQMKZyLcG61q
 8daGs7dCB+3PDr3MHPTDDkqhzjQZrdIiUnF4olZ7a+L65L7k5/bY0qi6FGgxIRlSaX/vkl
 DKTjYmEeUs0EcHw0Z082HsL+BvZPZzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227--YCjEZTYPYCZrZb2kQK6zA-1; Thu, 21 Jan 2021 09:09:28 -0500
X-MC-Unique: -YCjEZTYPYCZrZb2kQK6zA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47F8E802B46
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 14:09:27 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.36.110.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4E1619CB1;
 Thu, 21 Jan 2021 14:09:23 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 21 Jan 2021 15:09:18 +0100
Message-Id: <f52839ba25fb23b277197b5e16215ac450744cf9.1611238142.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH COMMITTED] openposix/mlock_8-1,
 munlock_10-1: document known aarch64 issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Values close to LONG_MAX are incorrectly handled by some aarch64
kernel versions, which return EINVAL instead of ENOMEM. Issue has
been fixed in v5.6:
  commit 597399d0cb91 ("arm64: tags: Preserve tags for addresses translated via TTBR1")
  commit d0022c0ef29b ("arm64: memory: Add missing brackets to untagged_addr() macro")

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../open_posix_testsuite/conformance/interfaces/mlock/8-1.c  | 5 +++++
 .../conformance/interfaces/munlock/10-1.c                    | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c b/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
index d9569008b82b..b2cd21c957bc 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
@@ -12,6 +12,11 @@
  * valid mapped pages in the address space of the process.
  *
  * Assume that the value LONG_MAX is an invalid pointer.
+ *
+ * aarch64 linux versions v5.3 up to v5.6-rc1 may incorrectly report
+ * EINVAL instead of ENOMEM, see:
+ *   597399d0cb91 ("arm64: tags: Preserve tags for addresses translated via TTBR1")
+ *   d0022c0ef29b ("arm64: memory: Add missing brackets to untagged_addr() macro")
  */
 
 #include <sys/mman.h>
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c b/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
index cf870289b512..93414df46a98 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
@@ -12,6 +12,11 @@
  * valid mapped pages in the address space of the process.
  *
  * Assume that the value LONG_MAX is an invalid pointer.
+ *
+ * aarch64 linux versions v5.3 up to v5.6-rc1 may incorrectly report
+ * EINVAL instead of ENOMEM, see:
+ *   597399d0cb91 ("arm64: tags: Preserve tags for addresses translated via TTBR1")
+ *   d0022c0ef29b ("arm64: memory: Add missing brackets to untagged_addr() macro")
  */
 
 #include <sys/mman.h>
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
