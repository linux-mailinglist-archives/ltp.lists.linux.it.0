Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C45603E21EE
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 04:57:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEBE73C7F60
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 04:57:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5B4C13C562F
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 04:57:06 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3E380100023D
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 04:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628218624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LUzVTuWRCXZuGWqvXBO4NYDpf/0RPnTOnX+Vdx7khcA=;
 b=C8b1cs76I8Cf4ful5RwdMIl7gbp/czHkRsIMLKxuDxiOWCZYpqnN0LDnxrYZ55aXclX9st
 qbd3J2ZiWwWnEdc58ZgMT7m2ej7or20T+m+legYyMaf029ggRscQYwfgi09B1KR0YEMZ6N
 NYU86znTG+KAqclkx31v6ZOuGziUMpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-xU995uyPOUqE0kQoEes7JQ-1; Thu, 05 Aug 2021 22:57:02 -0400
X-MC-Unique: xU995uyPOUqE0kQoEes7JQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F57D801AC0
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 02:57:01 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3A041059152
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 02:57:00 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 10:56:59 +0800
Message-Id: <20210806025659.1962902-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] setsockopt08: includes netinet/in.h
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

We have to put netinet/in.h on the top to get rid of conflict
of glibc and kernel headers for old unbuntu.

  -----------
  /usr/include/linux/in.h:28:3: error: redeclaration of enumerator 'IPPROTO_IP'
        IPPROTO_IP = 0,  /* Dummy protocol for TCP  */
   ^
  /usr/include/netinet/in.h:42:5: note: previous definition of 'IPPROTO_IP' was here
       IPPROTO_IP = 0,    /* Dummy protocol for TCP.  */
  ...
  -----------

See: https://www.mail-archive.com/netdev@vger.kernel.org/msg132711.html

Fixes: ebf3a4fbd39a (Add setsockopt08, CVE-2021-22555)
Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/setsockopt/setsockopt08.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
index f758dcbdc..f7052f27b 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt08.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
@@ -79,6 +79,8 @@
  *  - sizeof(struct xt_entry_target) = 32
  */
 
+#include <netinet/in.h>
+
 #include "tst_test.h"
 #include "tst_safe_net.h"
 #include "lapi/ip_tables.h"
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
