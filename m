Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE273C203E
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 09:52:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 499FB3C67DB
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 09:52:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4119B3C790A
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 09:52:14 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B71366001F2
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 09:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625817132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJgH3fbalZQlUHldMEHnzw72GqiKRIluSoozc+P1mU8=;
 b=aNlTwEf4RYbmdwQ+s3PbLnU87jWXwcLQv9Dm4qVMYIFFvlWgVpPbv3vBHREFak/fYtgprV
 FsBqM3mHk/XN/NVZKTCEaOlLKO0EoDWlDXsDGoY3tseQtCTQzO2CU2ZVWQNRYzwhQD48U0
 xZgbjxOyTsJU4mCDkgqP69sFRwXzzOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-yPem5-JpOcW7lA5B-qeOzQ-1; Fri, 09 Jul 2021 03:52:11 -0400
X-MC-Unique: yPem5-JpOcW7lA5B-qeOzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F232D100CA89;
 Fri,  9 Jul 2021 07:52:09 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE3F05D6A8;
 Fri,  9 Jul 2021 07:52:08 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  9 Jul 2021 15:52:04 +0800
Message-Id: <20210709075204.999168-3-liwang@redhat.com>
In-Reply-To: <20210709075204.999168-1-liwang@redhat.com>
References: <20210709075204.999168-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/3] lib: mount tmpfs name as ltp-tmpfs
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

Achieve that in get_device_name() function.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Li Wang <liwang@redhat.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_test.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index b996f1b2e..f4d9f8e3b 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -898,6 +898,14 @@ static char *limit_tmpfs_mount_size(const char *mnt_data,
 	return buf;
 }
 
+static const char *get_device_name(const char *fs_type)
+{
+       if (!strcmp(fs_type, "tmpfs"))
+               return "ltp-tmpfs";
+       else
+               return tdev.dev;
+}
+
 static void prepare_device(void)
 {
 	char *mnt_data, buf[1024];
@@ -917,8 +925,8 @@ static void prepare_device(void)
 		mnt_data = limit_tmpfs_mount_size(tst_test->mnt_data,
 				buf, sizeof(buf), tdev.fs_type);
 
-		SAFE_MOUNT(tdev.dev, tst_test->mntpoint, tdev.fs_type,
-			   tst_test->mnt_flags, mnt_data);
+		SAFE_MOUNT(get_device_name(tdev.fs_type), tst_test->mntpoint,
+				tdev.fs_type, tst_test->mnt_flags, mnt_data);
 		mntpoint_mounted = 1;
 	}
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
