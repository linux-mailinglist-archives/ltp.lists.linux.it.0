Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FA3102218
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 11:29:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E06A3C2278
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 11:29:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2A38A3C13DE
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 11:29:38 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 4748920169A
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 11:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574159375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mem/fFYKLUCwsBH75JAqZSfc5E+JU/1ovRpJ41FPlkM=;
 b=XIVPHHKV8xGfrntoq/uAN0HfT3JMW/qLql3e2gCs0mBYD6BQgaLuLHD85EQVmWDgvlX3mh
 7fvv7ZMAGiljXiZWyI0FkZ6hipMbatC5or/dzuh2nDlPk9Aea4K94nt9lkkmaqKZdcNLVS
 u5nKZqDhZT0USkapZzcJGHHNduJ5OSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-yeZMc1ECOE-YaOzgrkvVvg-1; Tue, 19 Nov 2019 05:29:34 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B604E800686
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 10:29:33 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E5E26055C;
 Tue, 19 Nov 2019 10:29:30 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 19 Nov 2019 11:29:26 +0100
Message-Id: <1a623a82dfac64c8a6f9805c197fa72cb5e6f046.1574159295.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: yeZMc1ECOE-YaOzgrkvVvg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] lib: don't pass NULL to strcmp in safe_mount
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

Rachel reports, that pivot_root01 crashes on latest LTP:
  Thread 3.1 "pivot_root01" received signal SIGSEGV, Segmentation fault.
  0x00000000004062c4 in safe_mount (file=file@entry=0x413017 "pivot_root01.c"
  733             if (strcmp(filesystemtype, "ntfs")) {

Don't pass NULL ptr to strcmp. Also fix return in unreachable path,
to suppress warning about returning uninitialized 'rval'.

Fixes: ae52b6f41bf3 ("lib: Fix safe_mount() when mounting NTFS on kernels with NTFS support")
Reported-by: Rachel Sibley <rasibley@redhat.com>
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 lib/safe_macros.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/safe_macros.c b/lib/safe_macros.c
index c725c7d7763f..41fa4ca83004 100644
--- a/lib/safe_macros.c
+++ b/lib/safe_macros.c
@@ -730,7 +730,7 @@ int safe_mount(const char *file, const int lineno, void (*cleanup_fn)(void),
 	 * Don't try using the kernel's NTFS driver when mounting NTFS, since
 	 * the kernel's NTFS driver doesn't have proper write support.
 	 */
-	if (strcmp(filesystemtype, "ntfs")) {
+	if (!filesystemtype || strcmp(filesystemtype, "ntfs")) {
 		rval = mount(source, target, filesystemtype, mountflags, data);
 		if (!rval)
 			return 0;
@@ -764,7 +764,7 @@ int safe_mount(const char *file, const int lineno, void (*cleanup_fn)(void),
 			 mountflags, data);
 	}
 
-	return rval;
+	return -1;
 }
 
 int safe_umount(const char *file, const int lineno, void (*cleanup_fn)(void),
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
