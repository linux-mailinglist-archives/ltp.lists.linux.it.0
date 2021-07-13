Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C103C7470
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:25:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3991C3C9CBC
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:25:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B26A53C2A73
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:25:08 +0200 (CEST)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3FF431400191
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:25:08 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id d2so31315284wrn.0
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz1orakFwOS15hCFDHqrk9Q+hxeUg1yWzt866iS7T0w=;
 b=SmoAe0zsZAovrFmqCTcWKNgsmB0nvETRWi5rfPD8BTuquyp4JhR5BPTo/G20CAF+cT
 Ftz/WON4J1CWRyzeS5UijaCJBM8E6fme+wnFjSL62QfhgcFbTwC845R+Ke7zf+7h8sZw
 hbwZvTpCPQxsWgIUL3vP7nWBQemdEHbrH/mgSF5gRgIyZVraRqbBCdwS+F6UMbdpfu6+
 eajDA0+m7vyi0ft8SQ1IxCbv/W2wtcfsVDh40pqyilc2pCp9uPpVRWKzjK3cKlCRedf5
 daoPpYGXs1Gid1TGfcisi575Ey74K7ptipNOIsDXHEoNJmOF9bU4yz+WlgBUNwRd80PP
 G2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz1orakFwOS15hCFDHqrk9Q+hxeUg1yWzt866iS7T0w=;
 b=FuZvhiv5NxO7GIe3bnGypOef++M/nDO/Oowc8LgiP7wqaL7vWBhR+TOa/I9UUipwfr
 wbfLa3JhNN2v3Og9Gbp5xBJBoT/2zAxp2xehlOfz+s/arWW258O8OC5XoeeJeUF0n4zx
 yUs2PlXNkj/d7dGWYrNIpYsirmWuhUtUzFPPN/C0gRlsnqW8kVZSXzFayktPb2jeA7rW
 5Dtl1IYxzBiejmV0H6Xa08j4+lqgo297EDqDs44lyDHgHKddsQ00X+C9nOG4k8HAqcP/
 AsJGSGnSkbFW+e884RJKlJoArGbUO2haEhWp++33g5ZklqNvbH/OKx8qWPo0Mz3z5WIa
 T94w==
X-Gm-Message-State: AOAM530s2ivpYS1MPtMPsSn/VaPQ0+pWNxpbOExFmTaz/EYtuiI+r7a3
 uRoYEQKkzk4vgvpQuNmy4v/n2dmBhZc=
X-Google-Smtp-Source: ABdhPJwq9Aj+Q+VHW9QH5Qa0NIQcOYFrl8ulu3Vha+/MVBNOh4X2q21Wxo2lzf7/IjsJNs91gysKhA==
X-Received: by 2002:a5d:524e:: with SMTP id k14mr6865567wrc.264.1626193507862; 
 Tue, 13 Jul 2021 09:25:07 -0700 (PDT)
Received: from amir-ThinkPad-T480.ctera.local
 (bzq-166-168-31-246.red.bezeqint.net. [31.168.166.246])
 by smtp.gmail.com with ESMTPSA id r15sm4744963wrx.94.2021.07.13.09.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:25:07 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Tue, 13 Jul 2021 19:24:50 +0300
Message-Id: <20210713162450.34947-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fanotify19: Add test cases for elevated
 reader privileges
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Even when event reader has elevated privileges, the information provided
in events is determined by the privileges of the user that created the
fanotify group.

Add test cases for unprivileged listener and privileged event reader.

This is a regression test for kernel commit
a8b98c808eab ("fanotify: fix permission model of unprivileged group")

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---

Hi Petr,

Added test for a fix in v5.13-rc5.

Thanks,
Amir.

 .../kernel/syscalls/fanotify/fanotify19.c     | 57 ++++++++++++++++---
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify19.c b/testcases/kernel/syscalls/fanotify/fanotify19.c
index e4ac8a032..3792c717c 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify19.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify19.c
@@ -38,6 +38,7 @@
 #define MOUNT_PATH	"fs_mnt"
 #define TEST_FILE	MOUNT_PATH "/testfile"
 
+static uid_t euid;
 static int fd_notify;
 static char buf[BUF_SIZE];
 static struct fanotify_event_metadata event_buf[EVENT_BUF_LEN];
@@ -45,12 +46,14 @@ static struct fanotify_event_metadata event_buf[EVENT_BUF_LEN];
 static struct test_case_t {
 	const char *name;
 	unsigned int fork;
+	unsigned int elevate;
 	unsigned int event_count;
 	unsigned long long event_set[EVENT_SET_MAX];
 } test_cases[] = {
 	{
 		"unprivileged listener - events by self",
 		0,
+		0,
 		4,
 		{
 			FAN_OPEN,
@@ -62,6 +65,7 @@ static struct test_case_t {
 	{
 		"unprivileged lisneter - events by child",
 		1,
+		0,
 		4,
 		{
 			FAN_OPEN,
@@ -69,7 +73,31 @@ static struct test_case_t {
 			FAN_MODIFY,
 			FAN_CLOSE,
 		}
-	}
+	},
+	{
+		"unprivileged listener, privileged reader - events by self",
+		0,
+		1,
+		4,
+		{
+			FAN_OPEN,
+			FAN_ACCESS,
+			FAN_MODIFY,
+			FAN_CLOSE,
+		}
+	},
+	{
+		"unprivileged lisneter, privileged reader - events by child",
+		1,
+		1,
+		4,
+		{
+			FAN_OPEN,
+			FAN_ACCESS,
+			FAN_MODIFY,
+			FAN_CLOSE,
+		}
+	},
 };
 
 static void generate_events(void)
@@ -118,6 +146,14 @@ static void test_fanotify(unsigned int n)
 
 	tst_res(TINFO, "Test #%d %s", n, tc->name);
 
+	/* Relinquish privileged user */
+	if (euid == 0) {
+		tst_res(TINFO,
+			"Running as privileged user, revoking.");
+		struct passwd *nobody = SAFE_GETPWNAM("nobody");
+		SAFE_SETEUID(nobody->pw_uid);
+	}
+
 	/* Initialize fanotify */
 	fd_notify = fanotify_init(FANOTIFY_REQUIRED_USER_INIT_FLAGS, O_RDONLY);
 
@@ -149,6 +185,13 @@ static void test_fanotify(unsigned int n)
 	else
 		generate_events();
 
+	/* Restore privileges */
+	if (euid == 0 && tc->elevate) {
+		tst_res(TINFO,
+			"Restoring privileged user.");
+		SAFE_SETEUID(0);
+	}
+
 	/* Read events from queue */
 	len = SAFE_READ(0, fd_notify, event_buf + len, EVENT_BUF_LEN - len);
 
@@ -224,13 +267,7 @@ static void setup(void)
 	/* Check for kernel fanotify support */
 	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(FAN_REPORT_FID, TEST_FILE);
 
-	/* Relinquish privileged user */
-	if (geteuid() == 0) {
-		tst_res(TINFO,
-			"Running as privileged user, revoking.");
-		struct passwd *nobody = SAFE_GETPWNAM("nobody");
-		SAFE_SETUID(nobody->pw_uid);
-	}
+	euid = geteuid();
 }
 
 static void cleanup(void)
@@ -248,6 +285,10 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.mount_device = 1,
 	.mntpoint = MOUNT_PATH,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "a8b98c808eab"},
+		{}
+	}
 };
 
 #else
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
