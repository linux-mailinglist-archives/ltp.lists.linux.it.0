Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9A302236
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 07:47:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B1BF3C527B
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 07:47:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4A5F03C285B
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 07:47:56 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C07DD600A01
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 07:47:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611557274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VEUbMJcVb6BzlCNgsIEahLzFWXxvy6IHHETb93YGmuM=;
 b=GyW3eTKxcGDceaosNQKgD7hN0PY4SEe27t0ijqqtvNnICaqV5aQtGFwxfnzALAFXMEG8qa
 yYGLfc0eDFOwrhmYVMXKVLsVeEtVwYqCe5V4tW0TW6UzD6RAloW/5UM9JoliIz6HtDvwi8
 6kf43zLCRCSMPe5u9RnyM7VrfiRXi3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-MB1GT8oYPq-T9SFOQZTxgQ-1; Mon, 25 Jan 2021 01:47:52 -0500
X-MC-Unique: MB1GT8oYPq-T9SFOQZTxgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56A5E180A093;
 Mon, 25 Jan 2021 06:47:51 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 189EA60C5F;
 Mon, 25 Jan 2021 06:47:49 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it,
	egorenar@linux.ibm.com
Date: Mon, 25 Jan 2021 06:47:46 +0000
Message-Id: <20210125064747.26759-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Subject: [LTP] [PATCH RFC 1/2] lib: add SAFE_READ_PROC_STATUS macro
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

To parse /proc/PID/status files, for example:
    SAFE_READ_PROC_STATUS(pid, "VmSwap:");

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Petr Vorel <pvorel@suse.cz>
Cc: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 include/tst_safe_file_ops.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/tst_safe_file_ops.h b/include/tst_safe_file_ops.h
index 894c16123..7a4076c4c 100644
--- a/include/tst_safe_file_ops.h
+++ b/include/tst_safe_file_ops.h
@@ -25,6 +25,14 @@
                         &tst_rval); \
         tst_rval;})
 
+#define SAFE_READ_PROC_STATUS(pid, item) \
+       ({long tst_rval_; \
+        char tst_path_[128]; \
+        sprintf(tst_path_, "/proc/%d/status", pid); \
+        SAFE_FILE_LINES_SCANF(tst_path_, item " %ld", \
+                        &tst_rval_); \
+        tst_rval_;})
+
 #define FILE_PRINTF(path, fmt, ...) \
 	file_printf(__FILE__, __LINE__, \
 		    (path), (fmt), ## __VA_ARGS__)
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
