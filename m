Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B6FAB7B5A
	for <lists+linux-ltp@lfdr.de>; Thu, 15 May 2025 04:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1747274409; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=UJpUnS3C2h77bSqpDHi7RjVNlH5bNYi+09y2dOOo5kI=;
 b=i+IPyg9CRCZnK68K8OpZATKnrtbdeky010OMkl8barm/IQ5yTxvt3RUW8EqCU0zLVPOQB
 ihvh0JHXhFb5MQvjjkzyWDhEB2iymtiacB4Cm66BAONB6GtEzVythcnWWcmfnSRuFFDS/lh
 pW/nV0P1SwpGVUCrpP/8jUnrvX1czyU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C0343CC3FC
	for <lists+linux-ltp@lfdr.de>; Thu, 15 May 2025 04:00:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D31223CC3F6
 for <ltp@lists.linux.it>; Thu, 15 May 2025 03:59:12 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 67AE620099B
 for <ltp@lists.linux.it>; Thu, 15 May 2025 03:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747274350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQtxUV9crKI01kyxgSIMrGcjpxhiwyRskDgDtEaElEU=;
 b=VB0aE07R8W9vk1uZqCEbfAI+gY9YQb8LLKTe30jKaEKpCYGdY/5fvYql/fnrobhecd089/
 18Si5wPPMnnp8CsZwXHNsfyLJrNqwQhJzgZAOcrBobKOQfTaCREgMJQbWox+tAhgZj5ZKl
 MrJwrK005YS79eu6cVaDNTsTiV41PYs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-8wd9I3LePXuwr7P-6gTSyg-1; Wed,
 14 May 2025 21:59:08 -0400
X-MC-Unique: 8wd9I3LePXuwr7P-6gTSyg-1
X-Mimecast-MFC-AGG-ID: 8wd9I3LePXuwr7P-6gTSyg_1747274347
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 57D68180045B
 for <ltp@lists.linux.it>; Thu, 15 May 2025 01:59:07 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com
 (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C7A681955F24
 for <ltp@lists.linux.it>; Thu, 15 May 2025 01:59:05 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 15 May 2025 09:58:55 +0800
Message-ID: <20250515015855.68510-3-liwang@redhat.com>
In-Reply-To: <20250515015855.68510-1-liwang@redhat.com>
References: <20250515015855.68510-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pitob9QlNtW7r4WzBFFa8qz_PGXx8MDFJXsj2w21xuk_1747274347
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v1 2/2] lib: moves test infrastructure states into a
 shared context structure
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patch introduces a new struct context to consolidate various
runtime state variables previously maintained as global variables
in tst_test.c. The goal is to support better state sharing between
parent and child processes particularly in scenarios that involve
checkpointing or fork/exec patterns.

To achieve this, a new struct ipc_region is defined, which encapsulates
three components: a magic field for validation, a context structure for
runtime metadata, and a results structure for test result counters.
Optionally, a futex array is appended for test checkpoint synchronization.

Test library IPC region (only one page size):

        +----------------------+
        |   Magic Number       |
        +----------------------+
        |   struct context     |
        +----------------------+
        |   struct results     |
        +----------------------+
        |   futexes[], or N/A  |
        +----------------------+

The shared memory region is allocated with a single page using mmap()
and is zero-initialized with memset() to ensure a clean initial state.

The patch refactors setup_ipc() and tst_reinit() to map this shared
region and properly initialize internal pointers to the `context`,
`results`, and `futexes` regions.

Overall, this refactor reduces global state pollution, centralizes the
runtime state management, and enables safe and efficient state sharing
across test lifecycle phases. It also sets the foundation for future
improvements such as multi-threaded test coordination or enhanced IPC
mechanisms.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 lib/tst_test.c | 222 ++++++++++++++++++++++++++++---------------------
 1 file changed, 126 insertions(+), 96 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 451a19eb6..9b051f6f8 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -52,6 +52,7 @@ const char *TCID __attribute__((weak));
 #define CVE_DB_URL "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-"
 
 #define DEFAULT_TIMEOUT 30
+#define LTP_MAGIC 0x4C54504D /* Magic number is "LTPM" */
 
 struct tst_test *tst_test;
 
@@ -59,35 +60,46 @@ static const char *tcid;
 static int iterations = 1;
 static float duration = -1;
 static float timeout_mul = -1;
-static int mntpoint_mounted;
-static int ovl_mounted;
-static struct timespec tst_start_time; /* valid only for test pid */
-static int tdebug;
 
-struct results {
-	int passed;
-	int skipped;
-	int failed;
-	int warnings;
-	int broken;
+struct context {
+	int32_t lib_pid;
+	int32_t main_pid;
+	struct timespec start_time;
+	uint32_t runtime;
+	uint32_t overall_time;
 	/*
 	 * This is set by a call to tst_brk() with TBROK parameter and means
 	 * that the test should exit immediately.
 	 */
-	int abort_flag;
-	unsigned int runtime;
-	unsigned int overall_time;
-	pid_t lib_pid;
-	pid_t main_pid;
+	uint32_t abort_flag;
+	uint32_t mntpoint_mounted:1;
+	uint32_t ovl_mounted:1;
+	uint32_t tdebug:1;
 };
 
-static struct results *results;
+struct results {
+	uint32_t passed;
+	uint32_t skipped;
+	uint32_t failed;
+	uint32_t warnings;
+	uint32_t broken;
+};
 
-static int ipc_fd;
+struct ipc_region {
+	uint32_t magic;
+	struct context context;
+	struct results results;
+	futex_t futexes[];
+};
 
-extern void *tst_futexes;
+static struct ipc_region *ipc;
+static struct context *context;
+static struct results *results;
+
+extern volatile void *tst_futexes;
 extern unsigned int tst_max_futexes;
 
+static int ipc_fd;
 static char ipc_path[1064];
 const char *tst_ipc_path = ipc_path;
 
@@ -126,25 +138,31 @@ static void setup_ipc(void)
 
 	SAFE_FTRUNCATE(ipc_fd, size);
 
-	results = SAFE_MMAP(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, ipc_fd, 0);
-
-	/* Checkpoints needs to be accessible from processes started by exec() */
-	if (tst_test->needs_checkpoints || tst_test->child_needs_reinit) {
-		sprintf(ipc_path, IPC_ENV_VAR "=%s", shm_path);
-		putenv(ipc_path);
-	} else {
-		SAFE_UNLINK(shm_path);
-	}
+	ipc = SAFE_MMAP(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, ipc_fd, 0);
 
 	SAFE_CLOSE(ipc_fd);
 
+	memset(ipc, 0, size);
+
+	ipc->magic = LTP_MAGIC;
+	context = &ipc->context;
+	results = &ipc->results;
+	context->lib_pid = getpid();
+
 	if (tst_test->needs_checkpoints) {
-		tst_futexes = (char *)results + sizeof(struct results);
-		tst_max_futexes = (size - sizeof(struct results))/sizeof(futex_t);
+		tst_futexes = ipc->futexes;
+
+		size_t futexes_offset = (char *)ipc->futexes - (char *)ipc;
+		tst_max_futexes = (size - futexes_offset) / sizeof(futex_t);
 	}
 
-	memset(results, 0 , size);
-	results->lib_pid = getpid();
+	/* Set environment variable for exec()'d children */
+	if (tst_test->needs_checkpoints || tst_test->child_needs_reinit) {
+		snprintf(ipc_path, sizeof(ipc_path), IPC_ENV_VAR "=%s", shm_path);
+		putenv(ipc_path);
+	} else {
+		SAFE_UNLINK(shm_path);
+	}
 }
 
 static void cleanup_ipc(void)
@@ -157,9 +175,11 @@ static void cleanup_ipc(void)
 	if (shm_path[0] && !access(shm_path, F_OK) && unlink(shm_path))
 		tst_res(TWARN | TERRNO, "unlink(%s) failed", shm_path);
 
-	if (results) {
-		msync((void *)results, size, MS_SYNC);
-		munmap((void *)results, size);
+	if (ipc) {
+		msync((void *)ipc, size, MS_SYNC);
+		munmap((void *)ipc, size);
+		ipc = NULL;
+		context = NULL;
 		results = NULL;
 	}
 }
@@ -177,12 +197,22 @@ void tst_reinit(void)
 		tst_brk(TBROK, "File %s does not exist!", path);
 
 	fd = SAFE_OPEN(path, O_RDWR);
+	ipc = SAFE_MMAP(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	SAFE_CLOSE(fd);
 
-	results = SAFE_MMAP(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
-	tst_futexes = (char *)results + sizeof(struct results);
-	tst_max_futexes = (size - sizeof(struct results))/sizeof(futex_t);
+	if (ipc->magic != LTP_MAGIC)
+		tst_brk(TBROK, "Invalid shared memory region (bad magic)");
 
-	SAFE_CLOSE(fd);
+	/* Restore the parent context from IPC region */
+	context = &ipc->context;
+	results = &ipc->results;
+
+	tst_futexes = ipc->futexes;
+	size_t futexes_offset = (char *)ipc->futexes - (char *)ipc;
+	tst_max_futexes = (size - futexes_offset) / sizeof(futex_t);
+
+	if (context->tdebug)
+		tst_res(TINFO, "tst_reinit(): restored metadata for PID %d", getpid());
 }
 
 extern char **environ;
@@ -236,19 +266,19 @@ static void update_results(int ttype)
 
 	switch (ttype) {
 	case TCONF:
-		tst_atomic_inc(&results->skipped);
+		tst_atomic_inc((int *)&results->skipped);
 	break;
 	case TPASS:
-		tst_atomic_inc(&results->passed);
+		tst_atomic_inc((int *)&results->passed);
 	break;
 	case TWARN:
-		tst_atomic_inc(&results->warnings);
+		tst_atomic_inc((int *)&results->warnings);
 	break;
 	case TFAIL:
-		tst_atomic_inc(&results->failed);
+		tst_atomic_inc((int *)&results->failed);
 	break;
 	case TBROK:
-		tst_atomic_inc(&results->broken);
+		tst_atomic_inc((int *)&results->broken);
 	break;
 	}
 }
@@ -395,7 +425,7 @@ void tst_vbrk_(const char *file, const int lineno, int ttype, const char *fmt,
 	 * If tst_brk() is called from some of the C helpers even before the
 	 * library was initialized, just exit.
 	 */
-	if (!results || !results->lib_pid)
+	if (!context || !context->lib_pid)
 		exit(TTYPE_RESULT(ttype));
 
 	update_results(TTYPE_RESULT(ttype));
@@ -406,13 +436,13 @@ void tst_vbrk_(const char *file, const int lineno, int ttype, const char *fmt,
 	 * specified but CLONE_THREAD is not. Use direct syscall to avoid
 	 * cleanup running in the child.
 	 */
-	if (tst_getpid() == results->main_pid)
+	if (tst_getpid() == context->main_pid)
 		do_test_cleanup();
 
 	/*
 	 * The test library process reports result statistics and exits.
 	 */
-	if (getpid() == results->lib_pid)
+	if (getpid() == context->lib_pid)
 		do_exit(TTYPE_RESULT(ttype));
 
 	/*
@@ -423,16 +453,16 @@ void tst_vbrk_(const char *file, const int lineno, int ttype, const char *fmt,
 	 */
 	if (TTYPE_RESULT(ttype) == TBROK) {
 		if (results)
-			tst_atomic_inc(&results->abort_flag);
+			tst_atomic_inc((int *)&context->abort_flag);
 
 		/*
 		 * If TBROK was called from one of the child processes we kill
 		 * the main test process. That in turn triggers the code that
 		 * kills leftover children once the main test process did exit.
 		 */
-		if (results->main_pid && tst_getpid() != results->main_pid) {
+		if (context->main_pid && tst_getpid() != context->main_pid) {
 			tst_res(TINFO, "Child process reported TBROK killing the test");
-			kill(results->main_pid, SIGKILL);
+			kill(context->main_pid, SIGKILL);
 		}
 	}
 
@@ -444,7 +474,7 @@ void tst_res_(const char *file, const int lineno, int ttype,
 {
 	va_list va;
 
-	if (ttype == TDEBUG && !tdebug)
+	if (ttype == TDEBUG && context && !context->tdebug)
 		return;
 
 	va_start(va, fmt);
@@ -759,7 +789,7 @@ static void parse_opts(int argc, char *argv[])
 		break;
 		case 'D':
 			tst_res(TINFO, "Enabling debug info");
-			tdebug = 1;
+			context->tdebug = 1;
 		break;
 		case 'h':
 			print_help();
@@ -1104,7 +1134,7 @@ static int prepare_and_mount_ro_fs(const char *dev, const char *mntpoint,
 		return 1;
 	}
 
-	mntpoint_mounted = 1;
+	context->mntpoint_mounted = 1;
 
 	snprintf(buf, sizeof(buf), "%s/dir/", mntpoint);
 	SAFE_MKDIR(buf, 0777);
@@ -1128,14 +1158,14 @@ static void prepare_and_mount_dev_fs(const char *mntpoint)
 		tst_res(TINFO, "tmpdir isn't suitable for creating devices, "
 			"mounting tmpfs without nodev on %s", mntpoint);
 		SAFE_MOUNT(NULL, mntpoint, "tmpfs", 0, NULL);
-		mntpoint_mounted = 1;
+		context->mntpoint_mounted = 1;
 	}
 }
 
 static void prepare_and_mount_hugetlb_fs(void)
 {
 	SAFE_MOUNT("none", tst_test->mntpoint, "hugetlbfs", 0, NULL);
-	mntpoint_mounted = 1;
+	context->mntpoint_mounted = 1;
 }
 
 int tst_creat_unlinked(const char *path, int flags, mode_t mode)
@@ -1221,7 +1251,7 @@ static void prepare_device(struct tst_fs *fs)
 
 		SAFE_MOUNT(get_device_name(tdev.fs_type), tst_test->mntpoint,
 				tdev.fs_type, fs->mnt_flags, mnt_data);
-		mntpoint_mounted = 1;
+		context->mntpoint_mounted = 1;
 	}
 }
 
@@ -1316,27 +1346,27 @@ static void do_setup(int argc, char *argv[])
 	if (tst_test->supported_archs && !tst_is_on_arch(tst_test->supported_archs))
 		tst_brk(TCONF, "This arch '%s' is not supported for test!", tst_arch.name);
 
+	if (tst_test->sample)
+		tst_test = tst_timer_test_setup(tst_test);
+
+	if (tst_test->runs_script) {
+		tst_test->child_needs_reinit = 1;
+		tst_test->forks_child = 1;
+	}
+
 	assert_test_fn();
 
 	TCID = tcid = get_tcid(argv);
 
-	if (tst_test->sample)
-		tst_test = tst_timer_test_setup(tst_test);
+	setup_ipc();
 
 	parse_opts(argc, argv);
 
 	if (tdebug_env && (!strcmp(tdebug_env, "1") || !strcmp(tdebug_env, "y"))) {
 		tst_res(TINFO, "Enabling debug info");
-		tdebug = 1;
+		context->tdebug = 1;
 	}
 
-	if (tst_test->runs_script) {
-		tst_test->child_needs_reinit = 1;
-		tst_test->forks_child = 1;
-	}
-
-	setup_ipc();
-
 	if (tst_test->needs_kconfigs && tst_kconfig_check(tst_test->needs_kconfigs))
 		tst_brk(TCONF, "Aborting due to unsuitable kernel config, see above!");
 
@@ -1454,7 +1484,7 @@ static void do_setup(int argc, char *argv[])
 	if (tst_test->needs_hugetlbfs)
 		prepare_and_mount_hugetlb_fs();
 
-	if (tst_test->needs_device && !mntpoint_mounted) {
+	if (tst_test->needs_device && !context->mntpoint_mounted) {
 		tdev.dev = tst_acquire_device_(NULL, tst_test->dev_min_size);
 
 		if (!tdev.dev)
@@ -1480,12 +1510,12 @@ static void do_setup(int argc, char *argv[])
 	if (tst_test->needs_overlay && !tst_test->mount_device)
 		tst_brk(TBROK, "tst_test->mount_device must be set");
 
-	if (tst_test->needs_overlay && !mntpoint_mounted)
+	if (tst_test->needs_overlay && !context->mntpoint_mounted)
 		tst_brk(TBROK, "tst_test->mntpoint must be mounted");
 
-	if (tst_test->needs_overlay && !ovl_mounted) {
+	if (tst_test->needs_overlay && !context->ovl_mounted) {
 		SAFE_MOUNT_OVERLAY();
-		ovl_mounted = 1;
+		context->ovl_mounted = 1;
 	}
 
 	if (tst_test->resource_files)
@@ -1505,7 +1535,7 @@ static void do_setup(int argc, char *argv[])
 
 static void do_test_setup(void)
 {
-	results->main_pid = getpid();
+	context->main_pid = getpid();
 
 	if (!tst_test->all_filesystems && tst_test->skip_filesystems) {
 		long fs_type = tst_fs_type(".");
@@ -1525,7 +1555,7 @@ static void do_test_setup(void)
 	if (tst_test->setup)
 		tst_test->setup();
 
-	if (results->main_pid != tst_getpid())
+	if (context->main_pid != tst_getpid())
 		tst_brk(TBROK, "Runaway child in setup()!");
 
 	if (tst_test->caps)
@@ -1537,10 +1567,10 @@ static void do_cleanup(void)
 	if (tst_test->needs_cgroup_ctrls)
 		tst_cg_cleanup();
 
-	if (ovl_mounted)
+	if (context->ovl_mounted)
 		SAFE_UMOUNT(OVL_MNT);
 
-	if (mntpoint_mounted)
+	if (context->mntpoint_mounted)
 		tst_umount(tst_test->mntpoint);
 
 	if (tst_test->needs_device && tdev.dev)
@@ -1562,7 +1592,7 @@ static void do_cleanup(void)
 
 static void heartbeat(void)
 {
-	if (tst_clock_gettime(CLOCK_MONOTONIC, &tst_start_time))
+	if (tst_clock_gettime(CLOCK_MONOTONIC, &context->start_time))
 		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
 
 	if (getppid() == 1) {
@@ -1588,7 +1618,7 @@ static void run_tests(void)
 		heartbeat();
 		tst_test->test_all();
 
-		if (tst_getpid() != results->main_pid)
+		if (tst_getpid() != context->main_pid)
 			exit(0);
 
 		tst_reap_children();
@@ -1604,7 +1634,7 @@ static void run_tests(void)
 		heartbeat();
 		tst_test->test(i);
 
-		if (tst_getpid() != results->main_pid)
+		if (tst_getpid() != context->main_pid)
 			exit(0);
 
 		tst_reap_children();
@@ -1704,7 +1734,7 @@ static void alarm_handler(int sig LTP_ATTRIBUTE_UNUSED)
 
 static void heartbeat_handler(int sig LTP_ATTRIBUTE_UNUSED)
 {
-	alarm(results->overall_time);
+	alarm(context->overall_time);
 	sigkill_retries = 0;
 }
 
@@ -1721,15 +1751,15 @@ unsigned int tst_remaining_runtime(void)
 	static struct timespec now;
 	int elapsed;
 
-	if (results->runtime == 0)
+	if (context->runtime == 0)
 		tst_brk(TBROK, "Runtime not set!");
 
 	if (tst_clock_gettime(CLOCK_MONOTONIC, &now))
 		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
 
-	elapsed = tst_timespec_diff_ms(now, tst_start_time) / 1000;
-	if (results->runtime > (unsigned int) elapsed)
-		return results->runtime - elapsed;
+	elapsed = tst_timespec_diff_ms(now, context->start_time) / 1000;
+	if (context->runtime > (unsigned int) elapsed)
+		return context->runtime - elapsed;
 
 	return 0;
 }
@@ -1757,29 +1787,29 @@ static void set_overall_timeout(void)
 		return;
 	}
 
-	results->overall_time = tst_multiply_timeout(timeout) + results->runtime;
+	context->overall_time = tst_multiply_timeout(timeout) + context->runtime;
 
 	tst_res(TINFO, "Overall timeout per run is %uh %02um %02us",
-		results->overall_time/3600, (results->overall_time%3600)/60,
-		results->overall_time % 60);
+		context->overall_time/3600, (context->overall_time%3600)/60,
+		context->overall_time % 60);
 }
 
 void tst_set_timeout(int timeout)
 {
 	int timeout_adj = DEFAULT_TIMEOUT + timeout;
 
-	results->overall_time = tst_multiply_timeout(timeout_adj) + results->runtime;
+	context->overall_time = tst_multiply_timeout(timeout_adj) + context->runtime;
 
 	tst_res(TINFO, "Overall timeout per run is %uh %02um %02us",
-		results->overall_time/3600, (results->overall_time%3600)/60,
-		results->overall_time % 60);
+		context->overall_time/3600, (context->overall_time%3600)/60,
+		context->overall_time % 60);
 
 	heartbeat();
 }
 
 void tst_set_runtime(int runtime)
 {
-	results->runtime = multiply_runtime(runtime);
+	context->runtime = multiply_runtime(runtime);
 	tst_res(TINFO, "Updating runtime to %uh %02um %02us",
 		runtime/3600, (runtime%3600)/60, runtime % 60);
 	set_overall_timeout();
@@ -1793,7 +1823,7 @@ static int fork_testrun(void)
 	SAFE_SIGNAL(SIGINT, sigint_handler);
 	SAFE_SIGNAL(SIGTERM, sigint_handler);
 
-	alarm(results->overall_time);
+	alarm(context->overall_time);
 
 	show_failure_hints = 1;
 
@@ -1827,7 +1857,7 @@ static int fork_testrun(void)
 	if (WIFEXITED(status) && WEXITSTATUS(status))
 		tst_brk(TBROK, "Child returned with %i", WEXITSTATUS(status));
 
-	if (results->abort_flag)
+	if (context->abort_flag)
 		return 0;
 
 	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGKILL) {
@@ -1886,9 +1916,9 @@ static int run_tcase_on_fs(struct tst_fs *fs, const char *fs_type)
 
 	ret = fork_testrun();
 
-	if (mntpoint_mounted) {
+	if (context->mntpoint_mounted) {
 		tst_umount(tst_test->mntpoint);
-		mntpoint_mounted = 0;
+		context->mntpoint_mounted = 0;
 	}
 
 	return ret;
@@ -1913,7 +1943,7 @@ static int run_tcases_per_fs(void)
 		found_valid_fs = true;
 		run_tcase_on_fs(fs, filesystems[i]);
 
-		if (tst_atomic_load(&results->abort_flag))
+		if (tst_atomic_load((int *)&context->abort_flag))
 			do_exit(0);
 	}
 
@@ -1933,7 +1963,7 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
 	tst_test = self;
 
 	do_setup(argc, argv);
-	tst_enable_oom_protection(results->lib_pid);
+	tst_enable_oom_protection(context->lib_pid);
 
 	SAFE_SIGNAL(SIGALRM, alarm_handler);
 	SAFE_SIGNAL(SIGUSR1, heartbeat_handler);
@@ -1944,7 +1974,7 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
 	tst_res(TINFO, "Tested kernel: %s %s %s", uval.release, uval.version, uval.machine);
 
 	if (tst_test->runtime)
-		results->runtime = multiply_runtime(tst_test->runtime);
+		context->runtime = multiply_runtime(tst_test->runtime);
 
 	set_overall_timeout();
 
@@ -1957,7 +1987,7 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
 		else
 			fork_testrun();
 
-		if (tst_atomic_load(&results->abort_flag))
+		if (tst_atomic_load((int *)&context->abort_flag))
 			do_exit(0);
 	}
 
-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
