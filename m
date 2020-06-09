Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4021F38CE
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 12:56:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 907143C2E4B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 12:56:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 37D653C0EB6
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 12:56:00 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6C316200C04
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 12:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=maez5PEcJUkPEi6H6gcaFzVRw4s8xEbQMkTsR+pMI38=;
 b=J0zzh69+FGxdqo3ogzaGFqbhREgE05oPOeup91n8i2b4oTJT7Y+vFdobarjQOrtKtiSOjV
 tCQZBweUINYZVoX8s73SmbNQiVwy1tbiSoeY+nIEMIp4VXP8js8wmKFQPczQk0JAimDq7V
 YPIxpYRcp/4SmPj3tDrL/qTqWakBslM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-Y53y66wGMimvoJt3e4kMoA-1; Tue, 09 Jun 2020 06:55:55 -0400
X-MC-Unique: Y53y66wGMimvoJt3e4kMoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF94E81A3FF
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 10:55:54 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 758E36111F
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 10:55:54 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  9 Jun 2020 12:55:51 +0200
Message-Id: <33c4abf347e2de96f89b9acea02d731e47dbf2a9.1591700131.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] read_all: scale down how many times we read by default
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

read_all is running into timeouts on high cpu systems, where
access to some per-cpu files is protected by a lock. Latest
example is /sys/kernel/tracing/per_cpu/*.

At the moment we read each file 10 times, and we have been
excluding files that take too long. Rather than expanding
blacklist, scale the default down to 3.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 runtest/fs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/runtest/fs b/runtest/fs
index 464ba8fb9686..5892e9fdaee5 100644
--- a/runtest/fs
+++ b/runtest/fs
@@ -69,9 +69,9 @@ fs_di fs_di -d $TMPDIR
 # Was not sure why it should reside in runtest/crashme and won't get tested ever
 proc01 proc01 -m 128
 
-read_all_dev read_all -d /dev -p -q -r 10
-read_all_proc read_all -d /proc -q -r 10
-read_all_sys read_all -d /sys -q -r 10
+read_all_dev read_all -d /dev -p -q -r 3
+read_all_proc read_all -d /proc -q -r 3
+read_all_sys read_all -d /sys -q -r 3
 
 #Run the File System Race Condition Check tests as well
 fs_racer fs_racer.sh -t 5
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
