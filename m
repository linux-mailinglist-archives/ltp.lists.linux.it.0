Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF804E1042
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 04:56:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D9ED3C22D6
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 04:56:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 85C2C3C22C5
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 04:56:18 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B5C6E600858
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 04:56:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571799375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SgrLdqso0UrbEFExgReEzqWY8RzGXR5fSrjzq8g/4B8=;
 b=ACPGYIiGyrTITr2CxEsEea9lU0/qGtO7Pm5jGWrODKTAwMoP3Do3ZRgjAFm1lIoD+nIQ+s
 qS/7g/xaiJOF0jh6GCGduCmEqpJbuHozW+cNS4VgRE1XzjoHwu4C12jljjWDCaaq5oOQ3U
 jrxKjm1z5zepPrDEbthnVF+EPTUUOfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-NmzScn94ORmGnHyvRmFRHA-1; Tue, 22 Oct 2019 22:56:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DE7E800D57
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 02:56:11 +0000 (UTC)
Received: from dhcp-0-148.nay.redhat.com (dhcp-0-148.nay.redhat.com
 [10.66.0.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AD135C1D4;
 Wed, 23 Oct 2019 02:56:10 +0000 (UTC)
From: Ping Fang <pifang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 23 Oct 2019 10:56:06 +0800
Message-Id: <20191023025606.24449-1-pifang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: NmzScn94ORmGnHyvRmFRHA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/pkeys/pkey01: build fail MAP_HUGETLB undefine
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
Cc: liwan@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

build fail on old distro(based glibc-2.12.1 2010-08-03)
MAP_HUGELTB introduced in glibc-2.11.3 2010-11-30.
include lapi/mmap.h to fix it.

Signed-off-by: Ping Fang <pifang@redhat.com>
---
 testcases/kernel/syscalls/pkeys/pkey.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/pkeys/pkey.h b/testcases/kernel/syscalls/pkeys/pkey.h
index 3c1204978..6e32326b6 100644
--- a/testcases/kernel/syscalls/pkeys/pkey.h
+++ b/testcases/kernel/syscalls/pkeys/pkey.h
@@ -9,6 +9,7 @@
 
 #include "tst_test.h"
 #include "lapi/syscalls.h"
+#include "lapi/mmap.h"
 
 #ifndef PKEY_DISABLE_ACCESS
 # define PKEY_DISABLE_ACCESS 0x1
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
