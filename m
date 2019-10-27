Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44645E6197
	for <lists+linux-ltp@lfdr.de>; Sun, 27 Oct 2019 09:22:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E318D3C229D
	for <lists+linux-ltp@lfdr.de>; Sun, 27 Oct 2019 09:22:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E33183C0794
 for <ltp@lists.linux.it>; Sun, 27 Oct 2019 09:22:44 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id BE021600827
 for <ltp@lists.linux.it>; Sun, 27 Oct 2019 09:22:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572164562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMXWrJxtY9MPYJQKbVwHCwTNQLXqofNk8zk1MDMdlMg=;
 b=afz+RthvxMkOAVYItcOfr4zh0jUEKRJN8+IiisrEjrQx7XCneFfAmyonnK+ho5A+V39oW2
 uBVusnXM8Q+BFi89MMTk5sOeaKR3QPVlvz4L0QWWYwuKKtsIwz/7RHS2b/O7H0hQ9ha48w
 qfXgTcXbX01iZpwdLDAUPXkdPxPM6pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-RotGLOmmMpaDB3jGxNVZyg-1; Sun, 27 Oct 2019 04:22:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 403BD800D49;
 Sun, 27 Oct 2019 08:22:38 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3AFA5D772;
 Sun, 27 Oct 2019 08:22:36 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it,
	naresh.kamboju@linaro.org
Date: Sun, 27 Oct 2019 09:22:29 +0100
Message-Id: <74d9fe32fda90a76c130491bdb4d0656aea6dcb1.1572164382.git.jstancek@redhat.com>
In-Reply-To: <CA+G9fYvdOcsqZ8M4VfOinnGGiacSL9rms5cnSkPK-cuZKNNP=w@mail.gmail.com>
References: <CA+G9fYvdOcsqZ8M4VfOinnGGiacSL9rms5cnSkPK-cuZKNNP=w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: RotGLOmmMpaDB3jGxNVZyg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH COMMITTED] mtest06/mmap1: add missing lapi/abisize.h
 include
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
Cc: lkft-triage@lists.linaro.org, ceh@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Naresh reported failures on 32-bit systems, with strace showing
test trying to mmap 2G area.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/mem/mtest06/mmap1.c | 1 +
 1 file changed, 1 insertion(+)

@Naresh: Can you give a try with this patch?

diff --git a/testcases/kernel/mem/mtest06/mmap1.c b/testcases/kernel/mem/mtest06/mmap1.c
index 8d84a0bb76f3..c5417444fe9e 100644
--- a/testcases/kernel/mem/mtest06/mmap1.c
+++ b/testcases/kernel/mem/mtest06/mmap1.c
@@ -28,6 +28,7 @@
 #include <setjmp.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include "lapi/abisize.h"
 #include "tst_test.h"
 #include "tst_safe_pthread.h"
 
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
