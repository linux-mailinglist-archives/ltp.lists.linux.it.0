Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C75143B8D82
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:52:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 966573C7596
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:52:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 215983C6B01
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:52:19 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BD4286005EF
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625118736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQ2hmX18Oaf16OewWV0/HHpHsYvs+JIsiVwXYy9ipR4=;
 b=Zq5gykjDQp5+7KGGD3UQX3y1Wd/qgl2+qelTMUj/sPOagS/eLx9lOpLpuyi54ffg7AnqBj
 4iUJCvWh13dVackkyNi2WtwAWpKmqrs7x0YFGXHiFiW8S/Yyqcjlfyftb4EEQ5lqPzKUMX
 dwmpvQXVGwlDM71BEJGmyezzRO/Hvgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-mtPIfXSzO1uT4CKy8oXMyg-1; Thu, 01 Jul 2021 01:52:14 -0400
X-MC-Unique: mtPIfXSzO1uT4CKy8oXMyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CD50800050;
 Thu,  1 Jul 2021 05:52:13 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B0D118A9E;
 Thu,  1 Jul 2021 05:52:11 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  1 Jul 2021 13:52:08 +0800
Message-Id: <20210701055208.715395-2-liwang@redhat.com>
In-Reply-To: <20210701055208.715395-1-liwang@redhat.com>
References: <20210701055208.715395-1-liwang@redhat.com>
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
Subject: [LTP] [PATCH 2/2] lib: mount tmpfs name as ltp-tmpfs
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

Given a specific name as "ltp-tmpfs" instead of the "/dev/loopX"
string in order to make "tmpfs" filesystem more evident.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Li Wang <liwang@redhat.com>
---
 lib/tst_test.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 27766fbfd..ab343e593 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -896,19 +896,23 @@ static void prepare_device(void)
 	}
 
 	if (tst_test->mount_device) {
+		const char *path_name = tdev.dev;
 		char *mnt_data = tst_test->mnt_data;
 
 		if (!strcmp(tdev.fs_type, "tmpfs")) {
 			tst_test->mnt_data = limit_tmpfs_mount_size(tst_test->mnt_data,
 					tst_test->dev_min_size);
+			tdev.dev = "ltp-tmpfs";
 		}
 
 		SAFE_MOUNT(tdev.dev, tst_test->mntpoint, tdev.fs_type,
 			   tst_test->mnt_flags, tst_test->mnt_data);
 		mntpoint_mounted = 1;
 
-		if (!strcmp(tdev.fs_type, "tmpfs"))
+		if (!strcmp(tdev.fs_type, "tmpfs")) {
 			tst_test->mnt_data = mnt_data;
+			tdev.dev = path_name;
+		}
 	}
 }
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
