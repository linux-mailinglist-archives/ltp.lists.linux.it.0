Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E34365395
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 09:54:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7D783C6C88
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 09:54:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D6B743C6C67
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 09:54:16 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DB9D4600748
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 09:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618905253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ghn0QETr5XBtaP4oGwEJ476ul/tbCwyAVP9qg5scM0Y=;
 b=P6hdForx+uD/KX68JAesH8f3U7tAJZc0k4aw7+XcWfPem1ZFLmvS14v+1tw8AmD2WZmigd
 Sd7wyPP61jIuwCh5lrgUdxBiry5PHHXYK9UQBeUJdIbnObOvJqNj31hN0eADdxbqoTqQn6
 SYgIqncgoMfzigA8dtfITwbVvdXgjTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-X5piuipYPvieycRsWMHi-A-1; Tue, 20 Apr 2021 03:53:55 -0400
X-MC-Unique: X5piuipYPvieycRsWMHi-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56985107ACCD;
 Tue, 20 Apr 2021 07:53:54 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ADB619172;
 Tue, 20 Apr 2021 07:53:52 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: xuyang2018.jy@cn.fujitsu.com,
	ltp@lists.linux.it
Date: Tue, 20 Apr 2021 15:53:51 +0800
Message-Id: <20210420075351.16059-1-liwang@redhat.com>
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
Subject: [LTP] [PATCH] mkfs: print more info for debugging
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

We can NOT reproduce the problem by manual with both ppc64le and s390x,
so let's print more useful info from test when getting fail.

 mkfs01 1 TPASS: 'mkfs -t ext4  /dev/loop0 ' passed.
 mkfs01 2 TFAIL: 'mkfs -t ext4  /dev/loop0 16000' failed, not expected.
 mkfs01 3 TPASS: 'mkfs -t ext4 -c /dev/loop0 ' passed.
 mkfs01 4 TPASS: 'mkfs -V   ' passed.
 mkfs01 5 TPASS: 'mkfs -h   ' passed.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/commands/mkfs/mkfs01.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/testcases/commands/mkfs/mkfs01.sh b/testcases/commands/mkfs/mkfs01.sh
index 90368190d..55296c8df 100755
--- a/testcases/commands/mkfs/mkfs01.sh
+++ b/testcases/commands/mkfs/mkfs01.sh
@@ -128,7 +128,8 @@ mkfs_test()
 	if [ -n "$device" ]; then
 		mkfs_verify_type "$fs_type" "$device"
 		if [ $? -ne 0 ]; then
-			tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
+			tst_res TFAIL "'${mkfs_cmd}' failed, not expected type."
+			cat temp
 			return
 		fi
 	fi
@@ -136,7 +137,8 @@ mkfs_test()
 	if [ -n "$size" ]; then
 		mkfs_verify_size "$fs_type" "$size"
 		if [ $? -ne 0 ]; then
-			tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
+			tst_res TFAIL "'${mkfs_cmd}' failed, not expected size."
+			cat temp
 			return
 		fi
 	fi
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
