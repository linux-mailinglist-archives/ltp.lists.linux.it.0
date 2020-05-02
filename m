Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 585AA1C26FA
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 18:28:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF6713C591D
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 18:28:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CFB493C28FD
 for <ltp@lists.linux.it>; Sat,  2 May 2020 18:27:57 +0200 (CEST)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 505451001719
 for <ltp@lists.linux.it>; Sat,  2 May 2020 18:27:57 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id f13so15532272wrm.13
 for <ltp@lists.linux.it>; Sat, 02 May 2020 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7Fgr5gx/PAl4I7Gw92cPdi31DobKPLz6A1vWTfP6+qI=;
 b=fxz9j8r8JN8GNbz1yE4bODGrMcF57YT9pA5BOSR0Ed3p13hvm+hB3m1EuUb/ofFOU/
 Y+tLlDtdMWAPRAGuH/vjuaGPaP6keMrnIbate+Dwiza0KZLoW9iGXLQLhPFLXqywpTiq
 /I9lmMDoO2f437ZJ9JH3farSDEIhsvp/GyayCak5c30WPji485lv+v1HP5fUs3EDjxNy
 vWObZO0bJ85sBOV4skWdBq8pK2hkcnliRT5fgH2N02MQKprIJkgTnfofnvOWUATXGRYS
 MkhvGx4B/HKYsBYWBrkB3zM+GQTSlviT4DfUrHZIBm/LH/DNf0o5MLtQRBKMwXGaoHwD
 /jDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7Fgr5gx/PAl4I7Gw92cPdi31DobKPLz6A1vWTfP6+qI=;
 b=UrWSwllwVpZ5WYYlEc+kINAZii8u8U1KFP6FqbYZryFGjA7nz856ItE8xUj3kwVBI1
 azvaapwIevxqUCm6XXlnEWcPS0K1AGk++ZI4cwAHEDWqBGcQ5i01NBNap8RoJ+66KcB2
 Uy5LRWH8uJqPmYk0dKaFLHuclsgtilv0Y8A1R6SS0ItknvaheTs91Gp/fyDxXjfn2BoA
 AfUAwfEgFv5+95BAd391JX1EKBIIEn1kRfVvff8qT2aGM24iQHeZjS5mzhQ+mGaM04r5
 khM5pBycEeL0qGuPswI1OMEzAUr/0K3fDcFMmHiJm439NMs/qpRt7N+1zFh0KyGLPzi7
 yexg==
X-Gm-Message-State: AGi0PuazWhXG4bwpiqNhWkiASNnNXQw4JnhQoTbeAhiDnSTPar/thKnY
 1H9SnqFkiL6cmMCIJTD+87oWt+ui
X-Google-Smtp-Source: APiQypIGhbdYulW6y7d51C5wre2gMYT/UOBEhzATJphG9mE+C8i2KYXOYjQh/97Wru6GHgcTwCRJxQ==
X-Received: by 2002:adf:9793:: with SMTP id s19mr9224233wrb.147.1588436876823; 
 Sat, 02 May 2020 09:27:56 -0700 (PDT)
Received: from localhost.localdomain ([141.226.12.123])
 by smtp.gmail.com with ESMTPSA id n6sm10683053wrs.81.2020.05.02.09.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 09:27:56 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Sat,  2 May 2020 19:27:44 +0300
Message-Id: <20200502162744.9589-5-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200502162744.9589-1-amir73il@gmail.com>
References: <20200502162744.9589-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] syscalls/fanotify: Use fanotify_save_fid()
 helper
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Reduce some boiler plate code in FAN_REPORT_FID tests and
save fid only once per object instead of once per expected event.

Suggested-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify13.c     | 44 ++++++-------
 .../kernel/syscalls/fanotify/fanotify15.c     | 63 +++++++++----------
 2 files changed, 50 insertions(+), 57 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
index 3d8de6009..51a498202 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify13.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
@@ -44,18 +44,16 @@
 #if defined(HAVE_NAME_TO_HANDLE_AT)
 struct event_t {
 	unsigned long long expected_mask;
-	__kernel_fsid_t fsid;
-	struct file_handle handle;
-	char buf[MAX_HANDLE_SZ];
 };
 
 static struct object_t {
 	const char *path;
 	int is_dir;
+	struct fanotify_fid_t fid;
 } objects[] = {
-	{FILE_PATH_ONE, 0},
-	{FILE_PATH_TWO, 0},
-	{DIR_PATH_ONE, 1}
+	{FILE_PATH_ONE, 0, {}},
+	{FILE_PATH_TWO, 0, {}},
+	{DIR_PATH_ONE, 1, {}}
 };
 
 static struct test_case_t {
@@ -108,11 +106,8 @@ static void create_objects(void)
 static void get_object_stats(void)
 {
 	unsigned int i;
-	for (i = 0; i < ARRAY_SIZE(objects); i++) {
-		event_set[i].handle.handle_bytes = MAX_HANDLE_SZ;
-		fanotify_get_fid(objects[i].path, &event_set[i].fsid,
-				&event_set[i].handle);
-	}
+	for (i = 0; i < ARRAY_SIZE(objects); i++)
+		fanotify_save_fid(objects[i].path, &objects[i].fid);
 }
 
 static int setup_marks(unsigned int fd, struct test_case_t *tc)
@@ -130,8 +125,8 @@ static int setup_marks(unsigned int fd, struct test_case_t *tc)
 					"kernel");
 				return 1;
 			} else if (errno == ENODEV &&
-					!event_set[i].fsid.val[0] &&
-					!event_set[i].fsid.val[1]) {
+				   !FSID_VAL_MEMBER(objects[i].fid.fsid, 0) &&
+				   !FSID_VAL_MEMBER(objects[i].fid.fsid, 1)) {
 				tst_res(TCONF,
 					"FAN_REPORT_FID not supported on "
 					"filesystem type %s",
@@ -207,6 +202,7 @@ static void do_test(unsigned int number)
 	for (i = 0, metadata = (struct fanotify_event_metadata *) events_buf;
 		FAN_EVENT_OK(metadata, len);
 		metadata = FAN_EVENT_NEXT(metadata, len), i++) {
+		struct fanotify_fid_t *expected_fid = &objects[i].fid;
 		event_fid = (struct fanotify_event_info_fid *) (metadata + 1);
 		event_file_handle = (struct file_handle *) event_fid->handle;
 
@@ -226,43 +222,43 @@ static void do_test(unsigned int number)
 				event_set[i].expected_mask);
 
 		/* Verify handle_bytes returned in event */
-		if (event_file_handle->handle_bytes
-				!= event_set[i].handle.handle_bytes) {
+		if (event_file_handle->handle_bytes !=
+		    expected_fid->handle.handle_bytes) {
 			tst_res(TFAIL,
 				"handle_bytes (%x) returned in event does not "
 				"equal to handle_bytes (%x) returned in "
 				"name_to_handle_at(2)",
 				event_file_handle->handle_bytes,
-				event_set[i].handle.handle_bytes);
+				expected_fid->handle.handle_bytes);
 			continue;
 		}
 
 		/* Verify handle_type returned in event */
 		if (event_file_handle->handle_type !=
-				event_set[i].handle.handle_type) {
+		    expected_fid->handle.handle_type) {
 			tst_res(TFAIL,
 				"handle_type (%x) returned in event does not "
 				"equal to handle_type (%x) returned in "
 				"name_to_handle_at(2)",
 				event_file_handle->handle_type,
-				event_set[i].handle.handle_type);
+				expected_fid->handle.handle_type);
 			continue;
 		}
 
 		/* Verify file identifier f_handle returned in event */
 		if (memcmp(event_file_handle->f_handle,
-				event_set[i].handle.f_handle,
-				event_set[i].handle.handle_bytes) != 0) {
+			   expected_fid->handle.f_handle,
+			   expected_fid->handle.handle_bytes) != 0) {
 			tst_res(TFAIL,
-				"event_file_handle->f_handle does not match "
-				"event_set[i].handle.f_handle returned in "
+				"file_handle returned in event does not match "
+				"the file_handle returned in "
 				"name_to_handle_at(2)");
 			continue;
 		}
 
 		/* Verify filesystem ID fsid  returned in event */
-		if (memcmp(&event_fid->fsid, &event_set[i].fsid,
-				sizeof(event_set[i].fsid)) != 0) {
+		if (memcmp(&event_fid->fsid, &expected_fid->fsid,
+			   sizeof(expected_fid->fsid)) != 0) {
 			tst_res(TFAIL,
 				"event_fid.fsid != stat.f_fsid that was "
 				"obtained via statfs(2)");
diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
index a9ed2ec81..cca6a5313 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify15.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify15.c
@@ -48,9 +48,7 @@
 #if defined(HAVE_NAME_TO_HANDLE_AT)
 struct event_t {
 	unsigned long long mask;
-	__kernel_fsid_t fsid;
-	struct file_handle handle;
-	char buf[MAX_HANDLE_SZ];
+	struct fanotify_fid_t *fid;
 };
 
 static int fanotify_fd;
@@ -83,6 +81,7 @@ static void do_test(unsigned int number)
 	struct fanotify_event_info_fid *event_fid;
 	struct test_case_t *tc = &test_cases[number];
 	struct fanotify_mark_type *mark = &tc->mark;
+	struct fanotify_fid_t root_fid, dir_fid, file_fid;
 
 	tst_res(TINFO, "Test #%d: %s", number, tc->tname);
 
@@ -102,16 +101,20 @@ static void do_test(unsigned int number)
 			fanotify_fd, mark->name, tc->mask, TEST_DIR);
 	}
 
+	/* Save the test root dir fid */
+	fanotify_save_fid(TEST_DIR, &root_fid);
+
 	/* All dirent events on testdir are merged */
 	event_set[count].mask = FAN_CREATE | FAN_MOVE | FAN_DELETE;
-	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
-	fanotify_get_fid(TEST_DIR, &event_set[count].fsid,
-			 &event_set[count].handle);
+	event_set[count].fid = &root_fid;
 	count++;
 
 	fd = SAFE_CREAT(FILE1, 0644);
 	SAFE_CLOSE(fd);
 
+	/* Save the file fid */
+	fanotify_save_fid(FILE1, &file_fid);
+
 	/* Recursive watch file for events "on self" */
 	if (mark->flag == FAN_MARK_INODE &&
 	    fanotify_mark(fanotify_fd, FAN_MARK_ADD | mark->flag,
@@ -129,9 +132,7 @@ static void do_test(unsigned int number)
 	 * FAN_MODIFY event reported on parent directory watch.
 	 */
 	event_set[count].mask = FAN_MODIFY;
-	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
-	fanotify_get_fid(FILE1, &event_set[count].fsid,
-			 &event_set[count].handle);
+	event_set[count].fid = &file_fid;
 	count++;
 
 	SAFE_TRUNCATE(FILE1, 1);
@@ -141,9 +142,7 @@ static void do_test(unsigned int number)
 	 * FAN_DELETE_SELF may be merged with FAN_MODIFY event above.
 	 */
 	event_set[count].mask = FAN_DELETE_SELF;
-	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
-	fanotify_get_fid(FILE2, &event_set[count].fsid,
-			 &event_set[count].handle);
+	event_set[count].fid = &file_fid;
 	count++;
 
 	SAFE_UNLINK(FILE2);
@@ -159,13 +158,14 @@ static void do_test(unsigned int number)
 	 * on non-subdirectories.
 	 */
 	event_set[count].mask = FAN_ONDIR | FAN_CREATE | FAN_MOVE | FAN_DELETE;
-	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
-	fanotify_get_fid(TEST_DIR, &event_set[count].fsid,
-			 &event_set[count].handle);
+	event_set[count].fid = &root_fid;
 	count++;
 
 	SAFE_MKDIR(DIR1, 0755);
 
+	/* Save the subdir fid */
+	fanotify_save_fid(DIR1, &dir_fid);
+
 	/* Recursive watch subdir for events "on self" */
 	if (mark->flag == FAN_MARK_INODE &&
 	    fanotify_mark(fanotify_fd, FAN_MARK_ADD | mark->flag,
@@ -180,9 +180,7 @@ static void do_test(unsigned int number)
 	SAFE_RENAME(DIR1, DIR2);
 
 	event_set[count].mask = FAN_ONDIR | FAN_DELETE_SELF;
-	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
-	fanotify_get_fid(DIR2, &event_set[count].fsid,
-			 &event_set[count].handle);
+	event_set[count].fid = &dir_fid;
 	count++;
 
 	SAFE_RMDIR(DIR2);
@@ -204,6 +202,7 @@ static void do_test(unsigned int number)
 	/* Process each event in buffer */
 	for (i = 0, metadata = (struct fanotify_event_metadata *) events_buf;
 		FAN_EVENT_OK(metadata, len); i++) {
+		struct event_t *expected = &event_set[i];
 		event_fid = (struct fanotify_event_info_fid *) (metadata + 1);
 		event_file_handle = (struct file_handle *) event_fid->handle;
 
@@ -220,13 +219,12 @@ static void do_test(unsigned int number)
 				"Received unexpected file descriptor %d in "
 				"event. Expected to get FAN_NOFD(%d)",
 				metadata->fd, FAN_NOFD);
-		} else if (!(metadata->mask & event_set[i].mask)) {
+		} else if (!(metadata->mask & expected->mask)) {
 			tst_res(TFAIL,
 				"Got event: mask=%llx (expected %llx) "
 				"pid=%u fd=%d",
 				(unsigned long long) metadata->mask,
-				event_set[i].mask,
-				(unsigned) metadata->pid,
+				expected->mask, (unsigned) metadata->pid,
 				metadata->fd);
 		} else if (metadata->pid != getpid()) {
 			tst_res(TFAIL,
@@ -237,31 +235,30 @@ static void do_test(unsigned int number)
 				(unsigned) getpid(),
 				metadata->fd);
 		} else if (event_file_handle->handle_bytes !=
-				event_set[i].handle.handle_bytes) {
+			   expected->fid->handle.handle_bytes) {
 			tst_res(TFAIL,
 				"Got event: handle_bytes (%x) returned in "
 				"event does not equal handle_bytes (%x) "
 				"retunred in name_to_handle_at(2)",
 				event_file_handle->handle_bytes,
-				event_set[i].handle.handle_bytes);
+				expected->fid->handle.handle_bytes);
 		} else if (event_file_handle->handle_type !=
-				event_set[i].handle.handle_type) {
+			   expected->fid->handle.handle_type) {
 			tst_res(TFAIL,
 				"handle_type (%x) returned in event does not "
 				"equal to handle_type (%x) returned in "
 				"name_to_handle_at(2)",
 				event_file_handle->handle_type,
-				event_set[i].handle.handle_type);
+				expected->fid->handle.handle_type);
 		} else if (memcmp(event_file_handle->f_handle,
-					event_set[i].handle.f_handle,
-					event_set[i].handle.handle_bytes)
-					!= 0) {
+				  expected->fid->handle.f_handle,
+				  expected->fid->handle.handle_bytes) != 0) {
 			tst_res(TFAIL,
-				"event_file_handle->f_handle does not match "
-				"handle.f_handle returned in "
+				"file_handle returned in event does not match "
+				"the file_handle returned in "
 				"name_to_handle_at(2)");
-		} else if (memcmp(&event_fid->fsid, &event_set[i].fsid,
-					sizeof(event_set[i].fsid)) != 0) {
+		} else if (memcmp(&event_fid->fsid, &expected->fid->fsid,
+				  sizeof(event_fid->fsid)) != 0) {
 			tst_res(TFAIL,
 				"event_fid->fsid != stats.f_fsid that was "
 				"obtained via statfs(2)");
@@ -276,7 +273,7 @@ static void do_test(unsigned int number)
 				*(unsigned long *)
 				event_file_handle->f_handle);
 		}
-		metadata->mask  &= ~event_set[i].mask;
+		metadata->mask  &= ~expected->mask;
 		/* No events left in current mask? Go for next event */
 		if (metadata->mask == 0)
 			metadata = FAN_EVENT_NEXT(metadata, len);
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
