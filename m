Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF330A8C2
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 14:31:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C47B3C759C
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 14:31:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A48FD3C2EF0
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 14:31:21 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B69342009D6
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 14:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612186279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7UnaLCpSO0vjTeSIzrhaIGXlBMxi6a60MEqBt6hpFv0=;
 b=Ml2yXznfhDs973PpkvUzgyh4Vd2+8QzOa9WSX+5LxH2uX5ltrmRKyrg98kzMKYBmP0ZklM
 cbE1ssvGJJr0XcV8tQ+F7RYGn+wBxKa8EXUy9rNNDnfED9K2ao1LajIkeNCXQm1YLng2+4
 G2RcsRwGoBYjBX3aWST7jcMY+QWIQGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-AKuVr68jMRSZAH5bZ9G1sA-1; Mon, 01 Feb 2021 08:31:15 -0500
X-MC-Unique: AKuVr68jMRSZAH5bZ9G1sA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86A9FB8107;
 Mon,  1 Feb 2021 13:31:11 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74916E14E;
 Mon,  1 Feb 2021 13:31:08 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it,
	liuxp11@chinatelecom.cn
Date: Mon,  1 Feb 2021 13:31:06 +0000
Message-Id: <20210201133106.26970-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH] lib: enhancement of tst_pollute_memory
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

This method base on set '2' to '/proc/sys/vm/overcommit_memory' which
helps to use the strict policy on memory overcommit. After comparing
the existing value of 'CommitLimit' with 'MemAvailable', to determine
how much overcommit_ratio should be used in those two situations:

1. 'CommitLimit' >= 'MemAvailable'

This means system already set a proper ratio (by default is 50), and it
quite safe for memory allocating with 'overcommit_memory=2'. Don't worry
about OOM-Killer because, MAP_FAILED will be returned instantly if the
whole system allocated-memory reaches the limitation.

2. 'CommitLimit' < 'MemAvailable'

This means system possibly has a little size of swap-space (or disabled),
so that wouldn't provide enough memory on expected allocating, more easily
exceed CommitLimit and trigger OOM. We recalculate the capability and let
system won't go over a commit-ratio larger than '(FreeMem - safety) / TotalMem',
that also make safety-margin take effect to it.

And, I propose to skip this function to be performed on larger RAM (128G)
system, because it takes too long to dirty memory.

Signed-off-by: Li Wang <liwang@redhat.com>
---

Notes:
    Hi Xinpeng,
    
    Before Cyril coming up with a new idea for solving this, I'd suggest you
    can help to test this patch with cancel the TCONF on 128G temporarily, to
    verify if my thought works for you.

 lib/tst_memutils.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index dd09db490..af2178a9c 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -15,6 +15,7 @@
 
 void tst_pollute_memory(size_t maxsize, int fillchar)
 {
+	unsigned int ori_overcommit_mem, ori_overcommit_rat, new_overcommit_rat;
 	size_t i, map_count = 0, safety = 0, blocksize = BLOCKSIZE;
 	void **map_blocks;
 	struct sysinfo info;
@@ -40,6 +41,25 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
 	map_count = maxsize / blocksize;
 	map_blocks = SAFE_MALLOC(map_count * sizeof(void *));
 
+	/* Only allow to run on systems with less than or equal to 128GB of memory */
+	if (info.totalram  >= (137438953472 / info.mem_unit)) {
+		tst_brk(TCONF, "Skip test - totalram (%lukB) is larger than 128GB",
+				info.totalram * info.mem_unit / 1024);
+	}
+
+	SAFE_FILE_SCANF("/proc/sys/vm/overcommit_memory", "%u", &ori_overcommit_mem);
+	SAFE_FILE_SCANF("/proc/sys/vm/overcommit_ratio",  "%u", &ori_overcommit_rat);
+
+	/* Disable the memory overcommit to prevent test invoking OOM killer */
+	if (SAFE_READ_MEMINFO("CommitLimit:") >= SAFE_READ_MEMINFO("MemAvailable:")) {
+		SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_memory", "2");
+	} else {
+		new_overcommit_rat = (maxsize / info.mem_unit * 100) / info.totalram;
+		SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_ratio", "%u", new_overcommit_rat);
+
+		SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_memory", "2");
+	}
+
 	/*
 	 * Keep allocating until the first failure. The address space may be
 	 * too fragmented or just smaller than maxsize.
@@ -60,4 +80,7 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
 		SAFE_MUNMAP(map_blocks[i], blocksize);
 
 	free(map_blocks);
+
+	SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_memory", "%u", ori_overcommit_mem);
+	SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_ratio", "%u",  ori_overcommit_rat);
 }
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
