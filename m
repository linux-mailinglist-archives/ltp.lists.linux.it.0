Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 735F51F3744
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 11:51:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F33503C2E5B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 11:51:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B457A3C2E49
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 11:51:12 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id CE1771A011ED
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 11:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591696270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0KPY5iFvYKXvsE4Z9LwHTfgQcnCEkio52l1zVXHbQ4=;
 b=S6aRSHEqZHkOEsI1LttCIzH8wqhlLeA5UTI5u7cQx7m5O2Q2bsTQWHoBtNL6xSZvJ5MvIv
 /ra+vodUp5xiCDfFdkh8GmL5lhMqgi1L9Tk4YUXLnodTsm8cby+kWPR9gd+TlWp/FDQ4Ui
 8ZcediUFEK12TQI/0N8y/o4yfpkuP5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-_ffOmaHPOSCbtLQgXC63pA-1; Tue, 09 Jun 2020 05:51:08 -0400
X-MC-Unique: _ffOmaHPOSCbtLQgXC63pA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6974835B8D
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 09:51:07 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F4046891E2
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 09:51:06 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  9 Jun 2020 17:51:01 +0800
Message-Id: <20200609095102.21153-3-liwang@redhat.com>
In-Reply-To: <20200609095102.21153-1-liwang@redhat.com>
References: <20200609095102.21153-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/4] mem: remove the old cgroup API
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
 testcases/kernel/mem/include/mem.h |  18 +----
 testcases/kernel/mem/lib/mem.c     | 108 -----------------------------
 2 files changed, 1 insertion(+), 125 deletions(-)

diff --git a/testcases/kernel/mem/include/mem.h b/testcases/kernel/mem/include/mem.h
index c5dca1d9b..42b12a230 100644
--- a/testcases/kernel/mem/include/mem.h
+++ b/testcases/kernel/mem/include/mem.h
@@ -60,24 +60,8 @@ void test_ksm_merge_across_nodes(unsigned long nr_pages);
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
-void read_cpuset_files(char *prefix, char *filename, char *retbuf);
-void write_cpuset_files(char *prefix, char *filename, char *buf);
+/* cpuset/memcg - include/tst_cgroup.h */
 void write_cpusets(const char *cgroup_dir, long nd);
-void mount_mem(char *name, char *fs, char *options, char *path, char *path_new);
-void umount_mem(char *path, char *path_new);
 
 /* shared */
 unsigned int get_a_numa_node(void);
diff --git a/testcases/kernel/mem/lib/mem.c b/testcases/kernel/mem/lib/mem.c
index 50bee39cb..2de3f83a6 100644
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
@@ -603,7 +596,6 @@ void test_ksm_merge_across_nodes(unsigned long nr_pages)
 /* THP */
 
 /* cpuset/memcg */
-
 static void gather_node_cpus(char *cpus, long nd)
 {
 	int ncpus = 0;
@@ -637,55 +629,6 @@ static void gather_node_cpus(char *cpus, long nd)
 	cpus[strlen(cpus) - 1] = '\0';
 }
 
-void read_cpuset_files(char *prefix, char *filename, char *retbuf)
-{
-	int fd;
-	char path[BUFSIZ];
-
-	/*
-	 * try either '/dev/cpuset/XXXX' or '/dev/cpuset/cpuset.XXXX'
-	 * please see Documentation/cgroups/cpusets.txt from kernel src
-	 * for details
-	 */
-	snprintf(path, BUFSIZ, "%s/%s", prefix, filename);
-	fd = open(path, O_RDONLY);
-	if (fd == -1) {
-		if (errno == ENOENT) {
-			snprintf(path, BUFSIZ, "%s/cpuset.%s",
-				 prefix, filename);
-			fd = SAFE_OPEN(path, O_RDONLY);
-		} else
-			tst_brk(TBROK | TERRNO, "open %s", path);
-	}
-	if (read(fd, retbuf, BUFSIZ) < 0)
-		tst_brk(TBROK | TERRNO, "read %s", path);
-	close(fd);
-}
-
-void write_cpuset_files(char *prefix, char *filename, char *buf)
-{
-	int fd;
-	char path[BUFSIZ];
-
-	/*
-	 * try either '/dev/cpuset/XXXX' or '/dev/cpuset/cpuset.XXXX'
-	 * please see Documentation/cgroups/cpusets.txt from kernel src
-	 * for details
-	 */
-	snprintf(path, BUFSIZ, "%s/%s", prefix, filename);
-	fd = open(path, O_WRONLY);
-	if (fd == -1) {
-		if (errno == ENOENT) {
-			snprintf(path, BUFSIZ, "%s/cpuset.%s",
-				 prefix, filename);
-			fd = SAFE_OPEN(path, O_WRONLY);
-		} else
-			tst_brk(TBROK | TERRNO, "open %s", path);
-	}
-	SAFE_WRITE(1, fd, buf, strlen(buf));
-	close(fd);
-}
-
 void write_cpusets(const char *cgroup_dir, long nd)
 {
 	char buf[BUFSIZ];
@@ -709,57 +652,6 @@ void write_cpusets(const char *cgroup_dir, long nd)
 	}
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
