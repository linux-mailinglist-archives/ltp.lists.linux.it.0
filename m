Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D1635E095
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 15:50:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BBB03C71DE
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 15:50:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC1723C71D9
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 15:50:29 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D93FF200AD7
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 15:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618321827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=vS7W7dRpuPnQcHaRKGeysqUUbFu545yRJ3VWxmwxDBg=;
 b=AuPS46W+LX8Ey+eNnC+0dbDPRNhcDkX2+B10pe6K9pDcccAIfOHZCkLUzU2P+H7Py+b6y7
 03DzzwHAjdMek/6K62yn/5Wj5wXhqBDHrfeJpUSvxYKoE6ewZvb3mBafHc8Dte2yY154bq
 +Fa1gO8rHgumpe9BsjFJ2oiNkYVrjwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-XjTLjr53ONW3ga8jALOL9Q-1; Tue, 13 Apr 2021 09:50:25 -0400
X-MC-Unique: XjTLjr53ONW3ga8jALOL9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A93FD8189DB
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 13:50:24 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.36.110.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FB3D6F439
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 13:50:23 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 13 Apr 2021 15:50:04 +0200
Message-Id: <f776dd1a02dc16efa8aa80bbe6f9b55186dc82cd.1618321799.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] read_all: limit per cpu nodes to first ten cpus
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

Some per cpu sysfs entries have high lock contention and when
this is combined with systems which have many CPUs (meaning they
also have many per cpu sysfs entries) the test spends most of
time on these nodes and occasionally also hits timeout.

For example, these entries are largest contributor on HPE Apollo 70
(aarch64, 256 CPUs):
  /sys/kernel/tracing/per_cpu/cpu247/*
  /sys/devices/system/cpu/cpu239/acpi_cppc/*

To preserve some coverage, add a blacklist rule that will ignore
"cpu" nodes with 2 or more digits.

Before:
  real    4m47.747s
  user    0m0.885s
  sys     5m47.909s

After:
  real    0m42.696s
  user    0m0.911s
  sys     0m4.759s

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/fs/read_all/read_all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
index 79c6b93fad73..a4123220afbe 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -87,6 +87,7 @@ static char *blacklist[] = {
 	"/sys/kernel/debug/*",
 	"/sys/devices/platform/*/eeprom",
 	"/sys/devices/platform/*/nvmem",
+	"/sys/*/cpu??*(?)/*",	/* cpu* entries with 2 or more digits */
 };
 
 static int queue_pop(struct queue *q, char *buf)
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
