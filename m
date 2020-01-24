Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B443148AC8
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 15:56:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A463D3C23F8
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 15:56:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 92E133C2377
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 15:56:48 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1D8901A05188
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 15:56:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579877806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZOju6cnRGU4RcSYRfjkXWblKvBfB3ZgXHmaQorKeOZs=;
 b=NGVevavSPqGy+aN6StO3Z5re1nhm0hVcgfGlOBEYLtWSPtv6eoC75FMEOn/1wQDP+ya/zC
 1TdXrF+VVsQzTvVhL2OoD2e72Vwkr9x7c4W9NzDeTAUD1Tuvv08jb7UrNlAqCc+imPBhpm
 VR4ms1GAgOI5urUcT6HIUnpvKSPnd1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-PzzPU2YaNvqCNZEYN-KAxg-1; Fri, 24 Jan 2020 09:56:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A12DB2D
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 14:56:41 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A67710016EB
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 14:56:38 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 24 Jan 2020 15:56:35 +0100
Message-Id: <79fee43729701f3a3d46c6cbc26fa3f2402e182e.1579877705.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: PzzPU2YaNvqCNZEYN-KAxg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] read_all: skip eeprom and nvmem
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

Big Power9 NV systems are failing to complete the test, as they
spend lot of time on /sys/devices/platform, trying to read dozens
of low level files like eeprom or nvmem. Each adds couple seconds,
eventually pushing test over timeout.

User or system admin is unlikely to ever need to access these
entries, so skip them.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/fs/read_all/read_all.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
index 47f8532231d9..f091f2f64a4d 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -85,6 +85,8 @@ static char *blacklist[] = {
 	NULL, /* reserved for -e parameter */
 	"/sys/power/wakeup_count",
 	"/sys/kernel/debug/*",
+	"/sys/devices/platform/*/eeprom",
+	"/sys/devices/platform/*/nvmem",
 };
 
 static struct tst_option options[] = {
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
