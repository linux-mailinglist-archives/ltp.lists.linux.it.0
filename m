Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F373C7E91
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 08:34:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E512A3C675C
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 08:34:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E74673C65FF
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 08:34:15 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2E19A200C29
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 08:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1626244453; i=@fujitsu.com;
 bh=VE08/wXy2+sBeZv6w0kkBmAwNY99PANUU5VzbCVDX0o=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=y3S5mwcYPF8TW7eDYHlGzOozvX7JxK4QjdtUAb7b8WUrxO0pLpwnjlsSdaFl4YSFk
 iYvzq+a7EaD4kVpvXhlucY9Kmg3GZEssr82xN0/XQFggo4QNfFfOdtn2wCCnjP1SjT
 sQkNr6knIOnuZAJ5EPMJbZ6ecuJbe2jDrCNgR3gHEZQgqgWZ67qscwreZ3wSjNIHRs
 diHU5j0cWDFCruVrIQ/yUF9FfAN+KK9JLXUbcZdNntpXmnbp27+THPKws0fgrmnkxp
 0bDRCVQQbQTZY3vnO9KvPllZ1RwvR7FfY8JFlPEtZd6m+eqHM/Q8YYg2YiiwkUgnrx
 4AqZXWF8lgpRg==
Received: from [100.112.192.137] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 4A/69-31114-5658EE06;
 Wed, 14 Jul 2021 06:34:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVTel9V2
 Cwc8mA4sV33cwOjB67Pu9jjWAMYo1My8pvyKBNePao21MBf0iFd23brM1MO4W6GLk4hASmM8k
 8e3yFUYIZy+jxKdDD5m7GDk52AQ0JZ51LgCzRQQkJDoa3rKD2MwC6hLLJ/1iArGFBYIlfs55A
 lbDIqAqcXBpA5jNK+Ap8en7UhYQW0JAQWLKw/dQcUGJkzOfsEDMkZA4+OIFM0SNosSljm+MEH
 alxJ5Z/UwTGHlnIWmZhaRlASPTKkbzpKLM9IyS3MTMHF1DAwNdQ0MjXUNLE10LY73EKt1EvdR
 S3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwPBKKTgUvIOx780HvUOMkhxMSqK8N3zeJgjxJeWn
 VGYkFmfEF5XmpBYfYpTh4FCS4M1reZcgJFiUmp5akZaZAwx1mLQEB4+SCK87SJq3uCAxtzgzH
 SJ1ilFRSpx3YTNQQgAkkVGaB9cGi69LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR580Gm8G
 TmlcBNfwW0mAlosfaatyCLSxIRUlINTAmfp3vdTDw6LTzTLEXonemR2SortzDpzwu6mi7g7+7
 0OVTx2pfFF/zyt23myrmm17bz54PTVRllE5KS+MXuZK1tXlQ4NUDqrHGrf00UV0QM/643/3j+
 ZR884mi/qGTfff178wpl59SlTkgwa6pwVy7k/3pv5VvDnWpxnttNj9+XSS5VY+Rv8N3z9u+kO
 5E50Y+8hbJmb1dO3Caw84eem6D25cmK2ivTvpyfcPf+plmZlfJ3dmV1dKfu3qL8VYFBYb+s0x
 6/iw9vdX/Pj2zd9s7z7t83FZcfbZfZrLjhWLXk/WsnmNKDjV/H/NrU8/BPw+IvQWUiVWGNHw0
 nXf354GJQzvyL5+V07T/Nu98+W1OJpTgj0VCLuag4EQCagIO/KgMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-9.tower-265.messagelabs.com!1626244452!58253!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28189 invoked from network); 14 Jul 2021 06:34:12 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-9.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Jul 2021 06:34:12 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16E6Y52V027175
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 07:34:12 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 14 Jul 2021 07:34:03 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 14 Jul 2021 14:34:38 +0800
Message-ID: <1626244478-15350-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] interfaces/sched_setparam/9-1.c: Fix leak of shared
 memory segment
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

Since this case uses a shared memory segment to test, we should free it at the end.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 .../interfaces/sched_setparam/9-1.c           | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam/9-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam/9-1.c
index 87e726a8e..6f158da04 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam/9-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam/9-1.c
@@ -43,6 +43,7 @@
 #include <unistd.h>
 #include "posixtest.h"
 #include "ncpu.h"
+#include "safe_helpers.h"
 
 static int nb_cpu;
 static int *shmptr;
@@ -134,7 +135,7 @@ int main(void)
 	shmptr = shmat(shm_id, 0, 0);
 	if (shmptr == (void *)-1) {
 		perror("An error occurs when calling shmat()");
-		return PTS_UNRESOLVED;
+		goto free_shm;
 	}
 	*shmptr = 0;
 
@@ -148,7 +149,7 @@ int main(void)
 			perror("An error occurs when calling"
 			       " sched_setscheduler()");
 		}
-		return PTS_UNRESOLVED;
+		goto free_shm;
 	}
 
 	for (i = 0; i < (nb_cpu - 1); i++) {
@@ -156,13 +157,13 @@ int main(void)
 		if (child_pid[i] == -1) {
 			perror("An error occurs when calling fork()");
 			kill_children(child_pid, i);
-			return PTS_UNRESOLVED;
+			goto free_shm;
 		} else if (child_pid[i] == 0) {
 
 			child_process();
 
 			printf("This code should not be executed.\n");
-			return PTS_UNRESOLVED;
+			goto free_shm;
 		}
 	}
 
@@ -170,13 +171,13 @@ int main(void)
 	if (child_pid[i] == -1) {
 		perror("An error occurs when calling fork()");
 		kill_children(child_pid, i);
-		return PTS_UNRESOLVED;
+		goto free_shm;
 	} else if (child_pid[i] == 0) {
 
 		test_process();
 
 		printf("This code should not be executed.\n");
-		return PTS_UNRESOLVED;
+		goto free_shm;
 	}
 
 	param.sched_priority = mean_prio;
@@ -184,10 +185,11 @@ int main(void)
 	if (sched_setparam(child_pid[i], &param) != 0) {
 		perror("An error occurs when calling sched_setparam()");
 		kill_children(child_pid, nb_cpu);
-		return PTS_UNRESOLVED;
+		goto free_shm;
 	}
 	newcount = *shmptr;
 
+	SAFE_FUNC(shmctl(shm_id, IPC_RMID, NULL));
 	if (newcount == oldcount) {
 		printf("The target process does not preempt"
 		       " the calling process\n");
@@ -198,4 +200,7 @@ int main(void)
 	printf("Test PASSED\n");
 	kill_children(child_pid, nb_cpu);
 	return PTS_PASS;
+free_shm:
+	SAFE_FUNC(shmctl(shm_id, IPC_RMID, NULL));
+	return PTS_UNRESOLVED;
 }
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
