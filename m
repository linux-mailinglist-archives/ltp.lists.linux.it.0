Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E04C2CEB86
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 11:00:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C869F3C58F3
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 11:00:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 735413C58E9
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:38 +0100 (CET)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1A2FD600708
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:38 +0100 (CET)
Received: by mail-ed1-x542.google.com with SMTP id b2so5203996edm.3
 for <ltp@lists.linux.it>; Fri, 04 Dec 2020 01:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=txVBk56tO2gFllxzb8d5qhXnXnp0Q96rIqcLEaPRzUE=;
 b=WCIW49XjIHQxy5BFnxhDqgggbXFjm5mjJIkLd6YhETpuYkkVCx5N2EO2La+vfOjHHf
 ILBrMgeuJTCrNernHmlqslChk2CHVekBzroUaCQD/8KP1RZlvXyqz6XgoWjpfgSn1y2k
 i9xw2GH0EcN97K5UN6QQTx0X5lHTFiDX1dRQ9Aa2QvvaxHo4XhPNI6AtoAqtmo6Vj4GB
 iz4OEaLLVKABq07Dp9rfiDhchdgKOb0cCtBkC22afZ4vZ9AR1ajbJI52lnlObwwSTp30
 eF4GXzSbIa0xRSPa2CCalIR+TYuXuHu0G7tw7vI1JrtSE7oZ3VieAHUM45YMESxOXORB
 smNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=txVBk56tO2gFllxzb8d5qhXnXnp0Q96rIqcLEaPRzUE=;
 b=cv7uWi03rjJcTjKAZFrpHlNM3uQu6sjmrwRF2HpxfUe9yAh6X+rSwHVOr+j654+J/o
 5JWmsTtjfxJJTXS0tw9Yd//mg/t9XM9/xi3u1rmgaHUBEe/6cHZafdiV6z1K64IsV4a+
 jM9A+iI3EZzoI3Ho1rlDzIMGwXt0u5Ai+DEMapSRSdJmVc0Pd9ML7Y223Qrds9SSM8VR
 827w2M9pVzstoNJ0p/N8oeDlRN6IyL+FE+0WgnB1c8imEZLyA9F2HsV+svo6NIfx3MII
 bF3YkhbUhTmOMaGvu+EEQy1t7tgr4gJ+x+b4sgfNRal/SNxoGlfy2LuUXKkGHtJ8ZKvP
 ZoQw==
X-Gm-Message-State: AOAM533ZCu+ZZFEgq2QRStBAZ9+F8igNAYatN5Tz14Y5cKmfLGv99Sod
 21tFfE0iqASjlQY6KI2eQxU=
X-Google-Smtp-Source: ABdhPJyL1rUYtOInN0sxnoZZKHHl4+8RjXoDp1ibePwgoN7ml+t+MySuQhfQZ4OVi7JbNwCE43Z6wA==
X-Received: by 2002:aa7:cc8f:: with SMTP id p15mr6629835edt.240.1607075977709; 
 Fri, 04 Dec 2020 01:59:37 -0800 (PST)
Received: from localhost.localdomain ([31.210.181.203])
 by smtp.gmail.com with ESMTPSA id qp16sm2701811ejb.74.2020.12.04.01.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:59:37 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri,  4 Dec 2020 11:59:28 +0200
Message-Id: <20201204095930.866421-4-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204095930.866421-1-amir73il@gmail.com>
References: <20201204095930.866421-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/5] syscalls/fanotify09: Read variable length events
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In preparation of testing events with filename info, teach the
how to read variable length events and parse the name info.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify09.c     | 88 +++++++++++++------
 1 file changed, 60 insertions(+), 28 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
index daeb712d2..7bb901cf3 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -138,42 +138,73 @@ static void cleanup_fanotify_groups(void)
 }
 
 static void event_res(int ttype, int group,
-		      struct fanotify_event_metadata *event)
+		      struct fanotify_event_metadata *event,
+		      const char *filename)
 {
-	int len;
-	sprintf(symlnk, "/proc/self/fd/%d", event->fd);
-	len = readlink(symlnk, fdpath, sizeof(fdpath));
-	if (len < 0)
-		len = 0;
-	fdpath[len] = 0;
-	tst_res(ttype, "group %d got event: mask %llx pid=%u fd=%d path=%s",
+	if (event->fd != FAN_NOFD) {
+		int len = 0;
+		sprintf(symlnk, "/proc/self/fd/%d", event->fd);
+		len = readlink(symlnk, fdpath, sizeof(fdpath));
+		if (len < 0)
+			len = 0;
+		fdpath[len] = 0;
+		filename = fdpath;
+	}
+	tst_res(ttype, "group %d got event: mask %llx pid=%u fd=%d filename=%s",
 		group, (unsigned long long)event->mask,
-		(unsigned)event->pid, event->fd, fdpath);
+		(unsigned)event->pid, event->fd, filename);
+}
+
+static const char *event_filename(struct fanotify_event_metadata *event)
+{
+	struct fanotify_event_info_fid *event_fid;
+	struct file_handle *file_handle;
+	const char *filename, *end;
+
+	if (event->event_len <= FAN_EVENT_METADATA_LEN)
+		return "";
+
+	event_fid = (struct fanotify_event_info_fid *)(event + 1);
+	file_handle = (struct file_handle *)event_fid->handle;
+	filename = (char *)file_handle->f_handle + file_handle->handle_bytes;
+	end = (char *)event_fid + event_fid->hdr.len;
+
+	/* End of event_fid could have name, zero padding, both or none */
+	return (filename == end) ? "" : filename;
 }
 
 static void verify_event(int group, struct fanotify_event_metadata *event,
-			 uint32_t expect)
+			 uint32_t expect, const char *expect_filename)
 {
+	const char *filename = event_filename(event);
+
 	if (event->mask != expect) {
 		tst_res(TFAIL, "group %d got event: mask %llx (expected %llx) "
-			"pid=%u fd=%d", group, (unsigned long long)event->mask,
+			"pid=%u fd=%d filename=%s", group, (unsigned long long)event->mask,
 			(unsigned long long)expect,
-			(unsigned)event->pid, event->fd);
+			(unsigned)event->pid, event->fd, filename);
 	} else if (event->pid != getpid()) {
 		tst_res(TFAIL, "group %d got event: mask %llx pid=%u "
-			"(expected %u) fd=%d", group,
+			"(expected %u) fd=%d filename=%s", group,
 			(unsigned long long)event->mask, (unsigned)event->pid,
-			(unsigned)getpid(), event->fd);
+			(unsigned)getpid(), event->fd, filename);
+	} else if (strcmp(filename, expect_filename)) {
+		tst_res(TFAIL, "group %d got event: mask %llx pid=%u "
+			"fd=%d filename='%s' (expected '%s')", group,
+			(unsigned long long)event->mask, (unsigned)event->pid,
+			event->fd, filename, expect_filename);
 	} else {
-		event_res(TPASS, group, event);
+		event_res(TPASS, group, event, filename);
 	}
+	if (event->fd != FAN_NOFD)
+		SAFE_CLOSE(event->fd);
 }
 
 static void test_fanotify(unsigned int n)
 {
 	int ret, dirfd;
 	unsigned int i;
-	struct fanotify_event_metadata *event, *ev;
+	struct fanotify_event_metadata *event;
 	struct tcase *tc = &tcases[n];
 
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
@@ -210,20 +241,21 @@ static void test_fanotify(unsigned int n)
 			ret, tc->nevents * (int)FAN_EVENT_METADATA_LEN);
 	}
 	event = (struct fanotify_event_metadata *)event_buf;
-	verify_event(0, event, FAN_MODIFY);
-	if (tc->ondir)
-		verify_event(0, event + 1, FAN_CLOSE_NOWRITE);
-	if (ret > tc->nevents * (int)FAN_EVENT_METADATA_LEN) {
+	verify_event(0, event, FAN_MODIFY, "");
+	event = FAN_EVENT_NEXT(event, ret);
+	if (tc->ondir) {
+		verify_event(0, event, FAN_CLOSE_NOWRITE, "");
+		event = FAN_EVENT_NEXT(event, ret);
+	}
+	if (ret > 0) {
 		tst_res(TFAIL,
-			"first group got more than %d events (%d > %d)",
-			tc->nevents, ret,
-			tc->nevents * (int)FAN_EVENT_METADATA_LEN);
+			"first group got more than %d events (%d bytes)",
+			tc->nevents, ret);
 	}
 	/* Close all file descriptors of read events */
-	for (ev = event; ret >= (int)FAN_EVENT_METADATA_LEN; ev++) {
-		if (ev->fd != FAN_NOFD)
-			SAFE_CLOSE(ev->fd);
-		ret -= (int)FAN_EVENT_METADATA_LEN;
+	for (; FAN_EVENT_OK(event, ret); FAN_EVENT_NEXT(event, ret)) {
+		if (event->fd != FAN_NOFD)
+			SAFE_CLOSE(event->fd);
 	}
 
 	/*
@@ -233,7 +265,7 @@ static void test_fanotify(unsigned int n)
 	for (i = 1; i < NUM_GROUPS; i++) {
 		ret = read(fd_notify[i], event_buf, FAN_EVENT_METADATA_LEN);
 		if (ret > 0) {
-			event_res(TFAIL, i, event);
+			event_res(TFAIL, i, event, "");
 			if (event->fd != FAN_NOFD)
 				SAFE_CLOSE(event->fd);
 			continue;
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
