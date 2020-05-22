Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE191DDC98
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 03:23:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCC423C2606
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 03:23:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D71E13C0EC2
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:23:37 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 9AEBC201264
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:23:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590110615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wu0ch1vFE2jTjijqekeuibgIoaWfloqwr6XZ0wGnUAE=;
 b=S3Z8y6UWYfTUQPCzrNIexcyCRBoen7okkqrMOBn3uIfZocyJxM3ekE+Cv4vjexwbWYrlOy
 9gl1tFzT46OLOYS8bjiWEzEGLV5dN75Nukrkjn0EG5SC7ubnklzmDl30MG2olQ17ixREEC
 3pgbnwZonvb2xo8KpvTc+dTQPQOGNo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-XuCZWXXUMAiwG4SfQTHhZA-1; Thu, 21 May 2020 21:23:33 -0400
X-MC-Unique: XuCZWXXUMAiwG4SfQTHhZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E32938015CF
 for <ltp@lists.linux.it>; Fri, 22 May 2020 01:23:32 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2291738D
 for <ltp@lists.linux.it>; Fri, 22 May 2020 01:23:31 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 09:23:26 +0800
Message-Id: <20200522012327.18991-3-liwang@redhat.com>
In-Reply-To: <20200522012327.18991-2-liwang@redhat.com>
References: <20200522012327.18991-1-liwang@redhat.com>
 <20200522012327.18991-2-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH RFC 3/4] mem: remove the old cgroup API
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/mem/include/mem.h | 16 +--------
 testcases/kernel/mem/lib/mem.c     | 58 ------------------------------
 2 files changed, 1 insertion(+), 73 deletions(-)

diff --git a/testcases/kernel/mem/include/mem.h b/testcases/kernel/mem/include/mem.h
index f553651c2..0e089fae2 100644
--- a/testcases/kernel/mem/include/mem.h
+++ b/testcases/kernel/mem/include/mem.h
@@ -60,24 +60,10 @@ void test_ksm_merge_across_nodes(unsigned long nr_pages);
 void check_hugepage(void);
 void write_memcg(void);
 
-/* cpuset/memcg */
-
-#define CPATH			"/dev/cpuset"
-#define CPATH_NEW		CPATH "/1"
-#define MEMCG_PATH		"/dev/cgroup"
-#define MEMCG_PATH_NEW		MEMCG_PATH "/1"
-#define MEMCG_LIMIT		MEMCG_PATH_NEW "/memory.limit_in_bytes"
-#define MEMCG_SW_LIMIT		MEMCG_PATH_NEW "/memory.memsw.limit_in_bytes"
-#if HAVE_SYS_EVENTFD_H
-#define PATH_OOMCTRL		MEMCG_PATH_NEW "/memory.oom_control"
-#define PATH_EVTCTRL		MEMCG_PATH_NEW "/cgroup.event_control"
-#endif
-
+/* cpuset/memcg - include/tst_cgroup.h */
 void read_cpuset_files(char *prefix, char *filename, char *retbuf);
 void write_cpuset_files(char *prefix, char *filename, char *buf);
 void write_cpusets(long nd);
-void mount_mem(char *name, char *fs, char *options, char *path, char *path_new);
-void umount_mem(char *path, char *path_new);
 
 /* shared */
 unsigned int get_a_numa_node(void);
diff --git a/testcases/kernel/mem/lib/mem.c b/testcases/kernel/mem/lib/mem.c
index df1baa42a..3ccba142e 100644
--- a/testcases/kernel/mem/lib/mem.c
+++ b/testcases/kernel/mem/lib/mem.c
@@ -312,13 +312,6 @@ void check_hugepage(void)
 		tst_brk(TCONF, "Huge page is not supported.");
 }
 
-void write_memcg(void)
-{
-	SAFE_FILE_PRINTF(MEMCG_LIMIT, "%ld", TESTMEM);
-
-	SAFE_FILE_PRINTF(MEMCG_PATH_NEW "/tasks", "%d", getpid());
-}
-
 struct ksm_merge_data {
 	char data;
 	unsigned int mergeable_size;
@@ -711,57 +704,6 @@ void write_cpusets(long nd)
 	SAFE_FILE_PRINTF(PATH_CG1_CST_LTP "/tasks", "%d", getpid());
 }
 
-void umount_mem(char *path, char *path_new)
-{
-	FILE *fp;
-	int fd;
-	char s_new[BUFSIZ], s[BUFSIZ], value[BUFSIZ];
-
-	/* Move all processes in task to its parent node. */
-	sprintf(s, "%s/tasks", path);
-	fd = open(s, O_WRONLY);
-	if (fd == -1)
-		tst_res(TWARN | TERRNO, "open %s", s);
-
-	snprintf(s_new, BUFSIZ, "%s/tasks", path_new);
-	fp = fopen(s_new, "r");
-	if (fp == NULL)
-		tst_res(TWARN | TERRNO, "fopen %s", s_new);
-	if ((fd != -1) && (fp != NULL)) {
-		while (fgets(value, BUFSIZ, fp) != NULL)
-			if (write(fd, value, strlen(value) - 1)
-			    != (ssize_t)strlen(value) - 1)
-				tst_res(TWARN | TERRNO, "write %s", s);
-	}
-	if (fd != -1)
-		close(fd);
-	if (fp != NULL)
-		fclose(fp);
-	if (rmdir(path_new) == -1)
-		tst_res(TWARN | TERRNO, "rmdir %s", path_new);
-	if (umount(path) == -1)
-		tst_res(TWARN | TERRNO, "umount %s", path);
-	if (rmdir(path) == -1)
-		tst_res(TWARN | TERRNO, "rmdir %s", path);
-}
-
-void mount_mem(char *name, char *fs, char *options, char *path, char *path_new)
-{
-	SAFE_MKDIR(path, 0777);
-	if (mount(name, path, fs, 0, options) == -1) {
-		if (errno == ENODEV) {
-			if (rmdir(path) == -1)
-				tst_res(TWARN | TERRNO, "rmdir %s failed",
-					 path);
-			tst_brk(TCONF,
-				 "file system %s is not configured in kernel",
-				 fs);
-		}
-		tst_brk(TBROK | TERRNO, "mount %s", path);
-	}
-	SAFE_MKDIR(path_new, 0777);
-}
-
 /* shared */
 
 /* Warning: *DO NOT* use this function in child */
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
