Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6482A45F5
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 14:09:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 815943C3021
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 14:09:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D2EA43C245E
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 14:09:40 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 40D84601068
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 14:09:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604408978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=kQVG/E3XBpt8YGCbtp/l/nlDKZZlXtbwxUcj6kAhziw=;
 b=DMz8VPr4cQ7eXo09I6t30iw2EfnWGVxQ70Ig42lPGLRSSHLdz+uUGZfiNJFY0VUIwYA8ZK
 FNNFOowr/leLAye4i4Er14MdlUQdHJBfqc6pl7gnaenyDMB6gKGbnKMUgA5IHRImWzkBvT
 oYh36yJ5OsjlHHvDo/KdPszy17m4Yhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-S05WZvK8N8ajW7DNno_HDw-1; Tue, 03 Nov 2020 08:09:36 -0500
X-MC-Unique: S05WZvK8N8ajW7DNno_HDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6F79835B75
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 13:09:35 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B394568431;
 Tue,  3 Nov 2020 13:09:29 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 14:09:23 +0100
Message-Id: <5d6e978c803e4e6449cabd89596729bfad996a17.1604408825.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_cgroup: fix short reads of mems/cpus
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

tst_cgroup_cpuset_read_files() is wrongly using sizeof on pointer
type to figure out length of buffer. On some systems there's
more content in cgroup mems/cpus, which leads to partial read
and subsequent EINVAL on write.

Also the retval buffer should be zero terminated, since buffer
can be passed uninitialized, subsequently leading to writing garbage
to cgroup and again hitting EINVAL.

Before:
  tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
  tst_device.c:423: TINFO: No device is mounted at cgroup2
  tst_device.c:423: TINFO: No device is mounted at /tmp/cgroup_cst
  tst_cgroup.c:100: TINFO: Cgroup(cpuset) v1 mount at /tmp/cgroup_cst success
  safe_macros.c:458: TBROK: tst_cgroup.c:449: write(6,0x7fffc0425410,18446744073709551615) failed: EINVAL (22)
  tst_cgroup.c:173: TWARN: umount /tmp/cgroup_cst: EBUSY (16)
  tst_cgroup.c:175: TWARN: rmdir /tmp/cgroup_cst: EBUSY (16)
  tst_cgroup.c:178: TINFO: Cgroup v1 unmount success

After:
  tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
  tst_device.c:423: TINFO: No device is mounted at cgroup2
  tst_device.c:423: TINFO: No device is mounted at /tmp/cgroup_cst
  tst_cgroup.c:100: TINFO: Cgroup(cpuset) v1 mount at /tmp/cgroup_cst success
  cpuset01.c:83: TPASS: cpuset test pass
  tst_cgroup.c:178: TINFO: Cgroup v1 unmount success

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 include/tst_cgroup.h                   | 6 ++++--
 lib/tst_cgroup.c                       | 6 ++++--
 testcases/kernel/mem/cpuset/cpuset01.c | 4 ++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
index 77780e0d64c9..bfd8482608c4 100644
--- a/include/tst_cgroup.h
+++ b/include/tst_cgroup.h
@@ -39,7 +39,9 @@ int  tst_cgroup_mem_swapacct_enabled(const char *cgroup_dir);
 void tst_cgroup_mem_set_maxswap(const char *cgroup_dir, long memsz);
 
 /* Set of functions to read/write cpuset controller files content */
-void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char *filename, char *retbuf);
-void tst_cgroup_cpuset_write_files(const char *cgroup_dir, const char *filename, const char *buf);
+void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char *filename,
+	char *retbuf, size_t retbuf_sz);
+void tst_cgroup_cpuset_write_files(const char *cgroup_dir, const char *filename,
+	const char *buf);
 
 #endif /* TST_CGROUP_H */
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index ba413d874f69..96c9524d2b3a 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -393,7 +393,8 @@ void tst_cgroup_mem_set_maxswap(const char *cgroup_dir, long memsz)
 		tst_cgroup_set_knob(cgroup_dir, "memory.swap.max", memsz);
 }
 
-void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char *filename, char *retbuf)
+void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char *filename,
+	char *retbuf, size_t retbuf_sz)
 {
 	int fd;
 	char *cgroup_new_dir;
@@ -417,7 +418,8 @@ void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char *filename,
 			tst_brk(TBROK | TERRNO, "open %s", knob_path);
 	}
 
-	if (read(fd, retbuf, sizeof(retbuf)) < 0)
+	memset(retbuf, 0, retbuf_sz);
+	if (read(fd, retbuf, retbuf_sz) < 0)
 		tst_brk(TBROK | TERRNO, "read %s", knob_path);
 
 	close(fd);
diff --git a/testcases/kernel/mem/cpuset/cpuset01.c b/testcases/kernel/mem/cpuset/cpuset01.c
index f70ae0e486c2..fcd22040f7dd 100644
--- a/testcases/kernel/mem/cpuset/cpuset01.c
+++ b/testcases/kernel/mem/cpuset/cpuset01.c
@@ -51,9 +51,9 @@ static void test_cpuset(void)
 	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
 	char mems[BUFSIZ], buf[BUFSIZ];
 
-	tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf);
+	tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf, sizeof(buf));
 	tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "cpus", buf);
-	tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems);
+	tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems, sizeof(buf));
 	tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "mems", mems);
 	tst_cgroup_move_current(PATH_TMP_CG_CST);
 
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
