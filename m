Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2373B3B05
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 05:03:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B5463C6F78
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 05:03:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CEBDB3C207E
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 05:03:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 410DB60008F
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 05:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624590205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kV9vVMyaegxClxcMpMbxelHsrEJWzUnlNDwxFybBuH0=;
 b=PwKD/EwjF/mBYX1fOdHerQiOC9mRFDPXfzsXDWtzgs4aPOZwYXVNu/nZqjUGzFcYtjNZgf
 7G9B2hETLeU67CEuZWO98OBwCYHAuTGUrfJsjL37ouLwuOJR3RiMoD2pYU/IVcEWmg601C
 6WOniIPZ3OhC/EvWLrwa3+n4MYBbiHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-x04Z-tIBMFmMWVZYb8ysvA-1; Thu, 24 Jun 2021 23:03:24 -0400
X-MC-Unique: x04Z-tIBMFmMWVZYb8ysvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C703800D62;
 Fri, 25 Jun 2021 03:03:23 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E723B604CD;
 Fri, 25 Jun 2021 03:03:21 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 25 Jun 2021 11:03:19 +0800
Message-Id: <20210625030319.496916-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [COMMITTED] cfs-scheduler: Add one more kernel git hash
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
Cc: rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
index b06cede16..9301ee458 100644
--- a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
+++ b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
@@ -16,6 +16,14 @@
  *
  * The test is known to reproduce an issue with an update to
  * SLE-15-SP1 (kernel 4.12.14-197.64, bsc#1179093).
+ *
+ * Also as an reproducer for another bug:
+ *
+ *    commit fdaba61ef8a268d4136d0a113d153f7a89eb9984
+ *    Author: Rik van Riel <riel@surriel.com>
+ *    Date:   Mon Jun 21 19:43:30 2021 +0200
+ *
+ *    sched/fair: Ensure that the CFS parent is added after unthrottling
  */
 
 #include <stdlib.h>
@@ -179,6 +187,7 @@ static struct tst_test test = {
 		{"linux-git", "fe61468b2cbc"},
 		{"linux-git", "5ab297bab984"},
 		{"linux-git", "6d4d22468dae"},
+		{"linux-git", "fdaba61ef8a2"},
 		{ }
 	}
 };
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
