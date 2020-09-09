Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 763EF263527
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33FEA3C5376
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id F23373C2E2B
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:22 +0200 (CEST)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8C6FF600683
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:22 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id t10so3941890wrv.1
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CSXFyv8DULSkRkigXjxPkfedFrVp+8UdgXFa2EuKTdw=;
 b=cldnHE2wELiJJp9qiqSCOiAqc7u3yceU41ScnqBsZTPGeycinLCW92Xx7Nx3vwhJL8
 fyQZSs9njsg7Le30UuEuxa2c6/L4zUbRvTmFV38BS5HugAaM3pWzigqRwntLLq7IkXGs
 GY8LZ8X2aTK8B0E2c+4fnWHeMT5PI0FVNObfBkBWGnciWefcskhkevg9BuZqqKATqk4i
 I4Eh9SKQ87IIVXNnMhoh4ah1IuB0zOlRtaLOe6OaCEX7osvX1OT+tsfanY6ym13OS7yt
 Y5Cup9blDfpAga5PLvTFq+6OHRRfcbIzzESyTk7T0rhwi0n0SFsdkAMJy8QU+jX1rJyk
 BDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CSXFyv8DULSkRkigXjxPkfedFrVp+8UdgXFa2EuKTdw=;
 b=QGUXUosjoLt1VlRimEvrf12pf8mfMlMOv3NG5nvQKnMCG41QuQFFf4vQQpILA3ieaV
 2rbgBAa3+qkc8nK4EtFuhnPBDhRIkq+JyP5zQyUb1HMpelXJzxz2eDxdwZkHfJFdd9xD
 6SMdFtMHQUXAG3IpTV5DdkLrhLTszW3OfNd9/LIor7m0JguiDG9VPIbn2uQgGEH3LU1+
 VRap+itc1Q2FHd004Dy6LqbMXDgYz+lNMvVr6hUFz7vBysUBYrXNNZ+DcgplR9u9+EPC
 HbSzRyMwKxUj+QndxM52IJ3cZjnT8wYARFXUm+WjtQNL++VaaOmNU7hZAY1aRq7CikFh
 aJCA==
X-Gm-Message-State: AOAM530esqYOULiLq7jA5nLN/caaoTr0bwMTC6VVjmGi/Py53hXFgmFR
 BVAJb/4YlHr5WNJpV6HLqxI=
X-Google-Smtp-Source: ABdhPJy5MPCX5XfE8ZXXmImvR6VkEeMreMYPHfffGphM+Qhfhn5b6S72so+iuwBLwCicRnGlcdHkLA==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr5411563wrn.2.1599674242090;
 Wed, 09 Sep 2020 10:57:22 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:21 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:57:02 +0300
Message-Id: <20200909175707.10670-6-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
References: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 05/10] syscalls/fanotify16: Verify child fid info
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

If event reports both dir and child fid, also verify the expected
child fid in the second info record.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify16.c     | 73 ++++++++++++++++---
 1 file changed, 61 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
index c8c7a9ee8..7995a1688 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify16.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -44,6 +44,7 @@
 struct event_t {
 	unsigned long long mask;
 	struct fanotify_fid_t *fid;
+	struct fanotify_fid_t *child_fid;
 	char name[BUF_SIZE];
 };
 
@@ -205,6 +206,7 @@ static void do_test(unsigned int number)
 
 	event_set[tst_count].mask = FAN_CREATE | FAN_ONDIR;
 	event_set[tst_count].fid = &root_fid;
+	event_set[tst_count].child_fid = NULL;
 	strcpy(event_set[tst_count].name, DIR_NAME1);
 	tst_count++;
 
@@ -230,6 +232,7 @@ static void do_test(unsigned int number)
 	 */
 	event_set[tst_count].mask = FAN_CREATE | FAN_MOVED_FROM;
 	event_set[tst_count].fid = &dir_fid;
+	event_set[tst_count].child_fid = NULL;
 	strcpy(event_set[tst_count].name, FILE_NAME1);
 	tst_count++;
 	/*
@@ -242,12 +245,14 @@ static void do_test(unsigned int number)
 	if (group->flag & FAN_REPORT_NAME) {
 		event_set[tst_count].mask = FAN_OPEN;
 		event_set[tst_count].fid = &dir_fid;
+		event_set[tst_count].child_fid = &file_fid;
 		strcpy(event_set[tst_count].name, FILE_NAME1);
 		tst_count++;
 	}
 
 	event_set[tst_count].mask = FAN_DELETE | FAN_MOVED_TO;
 	event_set[tst_count].fid = &dir_fid;
+	event_set[tst_count].child_fid = NULL;
 	strcpy(event_set[tst_count].name, FILE_NAME2);
 	tst_count++;
 	/*
@@ -257,6 +262,7 @@ static void do_test(unsigned int number)
 	if (!(group->flag & FAN_REPORT_NAME)) {
 		event_set[tst_count].mask = FAN_OPEN | FAN_CLOSE_WRITE;
 		event_set[tst_count].fid = &dir_fid;
+		event_set[tst_count].child_fid = &file_fid;
 		strcpy(event_set[tst_count].name, "");
 		tst_count++;
 	}
@@ -268,6 +274,7 @@ static void do_test(unsigned int number)
 	if (mark->flag == FAN_MARK_FILESYSTEM && (group->flag & FAN_REPORT_FID)) {
 		event_set[tst_count].mask = FAN_DELETE_SELF | FAN_MOVE_SELF;
 		event_set[tst_count].fid = &file_fid;
+		event_set[tst_count].child_fid = NULL;
 		strcpy(event_set[tst_count].name, "");
 		tst_count++;
 	}
@@ -279,6 +286,7 @@ static void do_test(unsigned int number)
 	if (group->flag & FAN_REPORT_NAME) {
 		event_set[tst_count].mask = FAN_CLOSE_WRITE;
 		event_set[tst_count].fid = &dir_fid;
+		event_set[tst_count].child_fid = &file_fid;
 		strcpy(event_set[tst_count].name, FILE_NAME2);
 		tst_count++;
 	}
@@ -294,6 +302,7 @@ static void do_test(unsigned int number)
 	 */
 	event_set[tst_count].mask = FAN_OPEN | FAN_CLOSE_NOWRITE | FAN_ONDIR;
 	event_set[tst_count].fid = &dir_fid;
+	event_set[tst_count].child_fid = NULL;
 	strcpy(event_set[tst_count].name, ".");
 	tst_count++;
 	/*
@@ -302,6 +311,7 @@ static void do_test(unsigned int number)
 	 */
 	event_set[tst_count].mask = FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR;
 	event_set[tst_count].fid = &dir_fid;
+	event_set[tst_count].child_fid = NULL;
 	strcpy(event_set[tst_count].name, ".");
 	tst_count++;
 
@@ -313,10 +323,12 @@ static void do_test(unsigned int number)
 
 	event_set[tst_count].mask = FAN_MOVED_FROM | FAN_ONDIR;
 	event_set[tst_count].fid = &root_fid;
+	event_set[tst_count].child_fid = NULL;
 	strcpy(event_set[tst_count].name, DIR_NAME1);
 	tst_count++;
 	event_set[tst_count].mask = FAN_DELETE | FAN_MOVED_TO | FAN_ONDIR;
 	event_set[tst_count].fid = &root_fid;
+	event_set[tst_count].child_fid = NULL;
 	strcpy(event_set[tst_count].name, DIR_NAME2);
 	tst_count++;
 	/* Expect no more events */
@@ -332,17 +344,21 @@ static void do_test(unsigned int number)
 		struct event_t *expected = &event_set[test_num];
 		struct fanotify_event_metadata *event;
 		struct fanotify_event_info_fid *event_fid;
+		struct fanotify_event_info_fid *child_fid;
+		struct fanotify_fid_t *expected_fid = expected->fid;
+		struct fanotify_fid_t *expected_child_fid = expected->child_fid;
 		struct file_handle *file_handle;
 		unsigned int fhlen;
 		const char *filename;
-		int namelen, info_type, mask_match;
+		int namelen, info_type, mask_match, info_id = 0;
 
 		event = (struct fanotify_event_metadata *)&event_buf[i];
 		event_fid = (struct fanotify_event_info_fid *)(event + 1);
 		file_handle = (struct file_handle *)event_fid->handle;
 		fhlen = file_handle->handle_bytes;
 		filename = (char *)file_handle->f_handle + fhlen;
-		namelen = ((char *)event_fid + event_fid->hdr.len) - filename;
+		child_fid = (void *)((char *)event_fid + event_fid->hdr.len);
+		namelen = (char *)child_fid - (char *)filename;
 		/* End of event_fid could have name, zero padding, both or none */
 		if (namelen > 0) {
 			namelen = strlen(filename);
@@ -350,6 +366,12 @@ static void do_test(unsigned int number)
 			filename = "";
 			namelen = 0;
 		}
+		/* Is there a child fid after first fid record? */
+		if (((char *)child_fid - (char *)event) >= event->event_len)
+			child_fid = NULL;
+
+		if (!(group->flag & FAN_REPORT_FID))
+			expected_child_fid = NULL;
 
 		if (!(group->flag & FAN_REPORT_NAME))
 			expected->name[0] = 0;
@@ -375,6 +397,7 @@ static void do_test(unsigned int number)
 			      !(expected->mask & ~event->mask) &&
 			      !((event->mask ^ expected->mask) & FAN_ONDIR));
 
+check_match:
 		if (test_num >= tst_count) {
 			tst_res(TFAIL,
 				"got unnecessary event: mask=%llx "
@@ -409,7 +432,7 @@ static void do_test(unsigned int number)
 				(unsigned)event->pid, event->fd,
 				event->event_len, event_fid->hdr.info_type,
 				info_type, event_fid->hdr.len, fhlen);
-		} else if (fhlen != expected->fid->handle.handle_bytes) {
+		} else if (fhlen != expected_fid->handle.handle_bytes) {
 			tst_res(TFAIL,
 				"got event: mask=%llx pid=%u fd=%d name='%s' "
 				"len=%d info_type=%d info_len=%d fh_len=%d expected(%d)"
@@ -418,10 +441,10 @@ static void do_test(unsigned int number)
 				(unsigned)event->pid, event->fd, filename,
 				event->event_len, info_type,
 				event_fid->hdr.len, fhlen,
-				expected->fid->handle.handle_bytes,
+				expected_fid->handle.handle_bytes,
 				file_handle->handle_type);
 		} else if (file_handle->handle_type !=
-			   expected->fid->handle.handle_type) {
+			   expected_fid->handle.handle_type) {
 			tst_res(TFAIL,
 				"got event: mask=%llx pid=%u fd=%d name='%s' "
 				"len=%d info_type=%d info_len=%d fh_len=%d "
@@ -431,9 +454,9 @@ static void do_test(unsigned int number)
 				event->event_len, info_type,
 				event_fid->hdr.len, fhlen,
 				file_handle->handle_type,
-				expected->fid->handle.handle_type);
+				expected_fid->handle.handle_type);
 		} else if (memcmp(file_handle->f_handle,
-				  expected->fid->handle.f_handle, fhlen)) {
+				  expected_fid->handle.f_handle, fhlen)) {
 			tst_res(TFAIL,
 				"got event: mask=%llx pid=%u fd=%d name='%s' "
 				"len=%d info_type=%d info_len=%d fh_len=%d "
@@ -444,7 +467,7 @@ static void do_test(unsigned int number)
 				event_fid->hdr.len, fhlen,
 				file_handle->handle_type,
 				*(int *)(file_handle->f_handle));
-		} else if (memcmp(&event_fid->fsid, &expected->fid->fsid,
+		} else if (memcmp(&event_fid->fsid, &expected_fid->fsid,
 				  sizeof(event_fid->fsid)) != 0) {
 			tst_res(TFAIL,
 				"got event: mask=%llx pid=%u fd=%d name='%s' "
@@ -456,8 +479,8 @@ static void do_test(unsigned int number)
 				event_fid->hdr.len, fhlen,
 				FSID_VAL_MEMBER(event_fid->fsid, 0),
 				FSID_VAL_MEMBER(event_fid->fsid, 1),
-				expected->fid->fsid.val[0],
-				expected->fid->fsid.val[1]);
+				expected_fid->fsid.val[0],
+				expected_fid->fsid.val[1]);
 		} else if (strcmp(expected->name, filename)) {
 			tst_res(TFAIL,
 				"got event: mask=%llx "
@@ -479,13 +502,39 @@ static void do_test(unsigned int number)
 				event->fd, filename,
 				event->event_len, event_fid->hdr.info_type,
 				event_fid->hdr.len, fhlen);
+		} else if (!!child_fid != !!expected_child_fid) {
+			tst_res(TFAIL,
+				"got event: mask=%llx "
+				"pid=%u fd=%d name='%s' num_info=%d (expected %d) "
+				"len=%d info_type=%d info_len=%d fh_len=%d",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid, event->fd,
+				filename, 1 + !!child_fid, 1 + !!expected_child_fid,
+				event->event_len, event_fid->hdr.info_type,
+				event_fid->hdr.len, fhlen);
+		} else if (child_fid) {
+			tst_res(TINFO,
+				"got event #%d: info #%d: info_type=%d info_len=%d fh_len=%d",
+				test_num, info_id, event_fid->hdr.info_type,
+				event_fid->hdr.len, fhlen);
+
+			/* Recheck event_fid match with child_fid */
+			event_fid = child_fid;
+			expected_fid = expected->child_fid;
+			info_id = 1;
+			info_type = FAN_EVENT_INFO_TYPE_FID;
+			file_handle = (struct file_handle *)event_fid->handle;
+			fhlen = file_handle->handle_bytes;
+			child_fid = NULL;
+			expected_child_fid = NULL;
+			goto check_match;
 		} else {
 			tst_res(TPASS,
 				"got event #%d: mask=%llx pid=%u fd=%d name='%s' "
-				"len=%d info_type=%d info_len=%d fh_len=%d",
+				"len=%d; info #%d: info_type=%d info_len=%d fh_len=%d",
 				test_num, (unsigned long long)event->mask,
 				(unsigned)event->pid, event->fd, filename,
-				event->event_len, event_fid->hdr.info_type,
+				event->event_len, info_id, event_fid->hdr.info_type,
 				event_fid->hdr.len, fhlen);
 		}
 
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
