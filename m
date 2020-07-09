Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615E219A34
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 09:49:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1851E3C2978
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 09:49:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 07A7B3C0196
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 09:49:48 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 3323E600739
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 09:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594280987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=mAPuVxC1oaE03tNsnRKWY0lOWDQe0GNwrNWQc8Kl3gs=;
 b=T81/B/KsY27HclpUldws5wbwM9xP3qnqVDx1YMq157OnKuuHlnnE7rh83x+M+eNvxUb1ZO
 KM11d+cMqXE3L+p2Pv1tpkltSWh8QetAF44UpgSZRDaO+61bWK9KvHWWUwYvLiBvgTKEYL
 UEqaAETEvMOPIKEGf6EfCrcyPtsW2rM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-yyQinbGtPUGYuKx2x9sOqg-1; Thu, 09 Jul 2020 03:49:44 -0400
X-MC-Unique: yyQinbGtPUGYuKx2x9sOqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EEEB1085
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 07:49:44 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 733CF6FED5
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 07:49:43 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  9 Jul 2020 09:49:36 +0200
Message-Id: <4cb36d04b5ac4dd60f073d5a5c2f96faaa03cbd4.1594280924.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] runltp: let each test acquire/release device
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

Problem with runltp creating and using single loop device for all tests
is that if one test fails/gets stuck or fails to umount loop device
for any reason, then all subsequent tests also fail, because
they try to use mounted device.

Don't force same loop device on all tests (unless it is chosen via
env. variable DEVICE) and let LTP library try to acquire and release
first usable loop device for each test.

Fixes #703
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 runltp | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/runltp b/runltp
index ec0811834862..94e290d6dbb9 100755
--- a/runltp
+++ b/runltp
@@ -963,17 +963,7 @@ create_block()
 
 set_block_device()
 {
-    if [ -z "$DEVICE" ]; then
-        create_block
-        if [ $? -ne 0 ]; then
-            echo "no block device was specified on commandline."
-            echo "Block device could not be created using loopback device"
-            echo "Tests which require block device are disabled."
-            echo "You can specify it with option -b"
-	else
-            export LTP_DEV=$DEVICE
-        fi
-    else
+    if [ -n "$DEVICE" ]; then
         export LTP_DEV=$DEVICE
     fi
 }
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
