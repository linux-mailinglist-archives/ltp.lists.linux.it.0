Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B98073B0290
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:15:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E576E3C96E3
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:14:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6F7063C229B
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:14:48 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 708E51A008A1
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:14:47 +0200 (CEST)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lveMf-0006Es-KI
 for ltp@lists.linux.it; Tue, 22 Jun 2021 11:14:45 +0000
Received: by mail-wr1-f71.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so9510651wre.9
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 04:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G3wVOV94NLm3mFzMUIx4kDHZskacUz+fGe6l5DH9Qj8=;
 b=I+UJlFsS0ErIQkiR426iFNYK2vXTts6mM1tgwkdGVRWiBsceiVSxCjy1GO4rE5e3WP
 m1CfgIqEdr37IKMmflU7rzHTxVoF85KYUenxsEwZ5BYQL/ourjnRuM+ijrdeYR7WYNZG
 6RByuCGq+JxSfzAkG/lJq05JlafE8TB7TaegLpCy+la/TzqrvE9ApPvYVxwxDY+XfmpU
 2D6C4zuuTTGjy+OWxogG6pW6JxNeF5XGwSD52sxp7lcrzaGmXWz/jK7JmIHCuyfZ8Tau
 5WFIQJ83oeLBdP76MZoewE4yb/OEgFCHEpxbvKs/LeMmJMrmqYhSGRNtbnolyjF71q6F
 jWBg==
X-Gm-Message-State: AOAM531x25ZTa6Q7nLXou8iM42UUIPzH5d2Vn8zZhtmzMsCiHkmaztah
 Uo0kCbZsOmwX1JItCwJ54NKZz0rb6x24eLfji/+tU1/LB3+Zu9SbOGFTNOmkDoZqTKVFqdYDl1H
 i5qmppiCgmWTJBC45F60wuwBxbsdz
X-Received: by 2002:a05:600c:3651:: with SMTP id
 y17mr3734321wmq.189.1624360484996; 
 Tue, 22 Jun 2021 04:14:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw61sY/XBZIgJeD1C67ivRkaX9tZFZPRJB3w7/+89wfw/M8ODTCF50FRDWDxOkJ7IBOwSXcWQ==
X-Received: by 2002:a05:600c:3651:: with SMTP id
 y17mr3734305wmq.189.1624360484803; 
 Tue, 22 Jun 2021 04:14:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n16sm10852683wrx.85.2021.06.22.04.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 04:14:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 13:14:39 +0200
Message-Id: <20210622111440.74722-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/msgstress03: fix fork failure on small
 memory systems
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

Running syscalls/msgstress03 on a system with less than ~4 GB of RAM fails:

    msgstress03    1  TFAIL  :  msgstress03.c:155: 	Fork failed (may be OK if under stress)

In dmesg:

    LTP: starting msgstress03
    cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-1.scope

The reason is cgroups pid limit set by systemd user.slice.  The limit is
set for login session, also for root user.  For example on 2 GB RAM
machine it is set as:
    /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207

Read the maximum number of pids and adjust the test limit.  For 2 GB RAM
machine with systemd this will result in:

    msgstress03    0  TINFO  :  Found limit of processes 5056 (from /sys/fs/cgroup/pids/user.slice/user-1000.slice/pids.max)
    msgstress03    0  TINFO  :  Requested number of processes higher than user session limit (10000 > 4556), setting to 4556

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/ipcmsg.h                              |  2 +
 libs/libltpipc/libipc.c                       | 58 +++++++++++++++++++
 .../syscalls/ipc/msgstress/msgstress03.c      | 15 ++++-
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/include/ipcmsg.h b/include/ipcmsg.h
index d89894b726cf..b73b72d6d172 100644
--- a/include/ipcmsg.h
+++ b/include/ipcmsg.h
@@ -61,8 +61,10 @@ void rm_queue(int);
 
 key_t getipckey();
 int getuserid(char *);
+int get_session_uid(void);
 
 int get_max_msgqueues(void);
 int get_used_msgqueues(void);
+int get_pids_limit(void);
 
 #endif /* ipcmsg.h */
diff --git a/libs/libltpipc/libipc.c b/libs/libltpipc/libipc.c
index d94880f54b64..cd3480ed9f21 100644
--- a/libs/libltpipc/libipc.c
+++ b/libs/libltpipc/libipc.c
@@ -151,6 +151,31 @@ int getuserid(char *user)
 	return (ent->pw_uid);
 }
 
+/*
+ * Get the effective session UID - either one invoking current test via sudo
+ * or the real UID.
+ */
+int get_session_uid(void)
+{
+	const char *sudo_uid;
+
+	sudo_uid = getenv("SUDO_UID");
+	if (sudo_uid) {
+		int real_uid;
+
+		TEST(sscanf(sudo_uid, "%u", &real_uid));
+		if (TEST_RETURN != 1) {
+#ifdef DEBUG
+			tst_resm(TINFO, "No SUDO_UID from env");
+#endif
+		} else {
+			return real_uid;
+		}
+	}
+
+	return getuid();
+}
+
 /*
  * rm_shm() - removes a shared memory segment.
  */
@@ -218,3 +243,36 @@ int get_max_msgqueues(void)
 	fclose(f);
 	return atoi(buff);
 }
+
+/*
+ * Get the limit of processes for current session configured by systemd user.slice.
+ * This also applies to root user.
+ */
+int get_pids_limit(void)
+{
+	int real_uid, ret;
+	char path[PATH_MAX];
+	long unsigned int max_pids;
+
+	real_uid = get_session_uid();
+	if (TEST_RETURN != 1) {
+		tst_resm(TINFO, "Cannot get UID");
+		return -1;
+	}
+
+	ret = snprintf(path, sizeof(path),
+		       "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max",
+		       real_uid);
+	if (ret < 0 || (size_t)ret >= sizeof(path))
+		return -1;
+
+	if (access(path, R_OK) != 0) {
+		tst_resm(TINFO, "Cannot read session user limits from '%s'", path);
+		return -1;
+	}
+
+	SAFE_FILE_SCANF(cleanup, path, "%lu", &max_pids);
+	tst_resm(TINFO, "Found limit of processes %lu (from %s)", max_pids, path);
+
+	return max_pids;
+}
diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
index 294b401b1b38..9cf96db7956e 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
@@ -78,7 +78,7 @@ static void usage(void)
 
 int main(int argc, char **argv)
 {
-	int i, j, ok, pid;
+	int i, j, ok, pid, max_session_pids;
 	int count, status;
 	struct sigaction act;
 
@@ -109,6 +109,19 @@ int main(int argc, char **argv)
 		}
 	}
 
+	max_session_pids = get_pids_limit();
+	if (max_session_pids > 0) {
+		/* Clamp number of processes to session limit with some buffer for OS */
+		max_session_pids = (max_session_pids > 500 ? max_session_pids - 500 : 0);
+		if (nprocs >= max_session_pids) {
+			tst_resm(TINFO,
+				 "Requested number of processes higher than user session limit (%d > %d), "
+				 "setting to %d", nprocs, max_session_pids,
+				 max_session_pids);
+			nprocs = max_session_pids;
+		}
+	}
+
 	srand(getpid());
 	tid = -1;
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
