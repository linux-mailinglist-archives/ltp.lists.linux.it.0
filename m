Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FFA17172D
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 13:28:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9B173C23F2
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 13:28:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7D7663C1D93
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 13:28:23 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4275B140200C
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 13:28:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582806501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E6yDQonBXlvuqkhRa077feXaEHUusfdenl2n4kPBc88=;
 b=bd5qivGaxVdhD3zrn4RhxCFB6FBZR8STTaaK9xbzeUZtr24D3ms4ycJwoxF7sW/7eCx8ff
 55MY5sno6cPUI54aw1F5QF3vj9VQh0SULQRuET6y8/5waHx25GL0HNT448aWaTAYliIrPL
 0CRMwj//b2n43C2bpftcGhqDRWQUf9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-hvGt_cAXPsWPwRuBTiZdng-1; Thu, 27 Feb 2020 07:28:19 -0500
X-MC-Unique: hvGt_cAXPsWPwRuBTiZdng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D321800D5C
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 12:28:18 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C066460BE2
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 12:28:17 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 13:28:13 +0100
Message-Id: <fa386b967db52665ca84150a59058d0f601ca051.1582806435.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/bpf: bump RLIMIT_MEMLOCK limit
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

Some bpf array types reserve space according to number of
possible CPUs. This is running into limits on a ppc64le with
64k pages and NR_CPUS==2048:
    84 bpf_map01(1049142):   <-bpf_map_init_from_attr
    89 bpf_map01(1049142):   ->bpf_map_charge_init mem={.pages=0, .user=0x0} size=208456
    94 bpf_map01(1049142):   <-bpf_map_charge_init return=0xffffffffffffffff

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/bpf/bpf_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/bpf/bpf_common.h b/testcases/kernel/syscalls/bpf/bpf_common.h
index 1dbbd5f25635..d36a2b09ffd9 100644
--- a/testcases/kernel/syscalls/bpf/bpf_common.h
+++ b/testcases/kernel/syscalls/bpf/bpf_common.h
@@ -6,7 +6,7 @@
 #ifndef LTP_BPF_COMMON_H
 #define LTP_BPF_COMMON_H
 
-#define BPF_MEMLOCK_ADD (256*1024)
+#define BPF_MEMLOCK_ADD (2*1024*1024)
 
 void rlimit_bump_memlock(void);
 int bpf_map_create(union bpf_attr *attr);
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
