Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 438FF35BABA
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 09:20:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D48813C2509
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 09:20:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A3A1B3C1C56
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 09:20:15 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 701FA1A0121A
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 09:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1618212013; i=@fujitsu.com;
 bh=ejhPsJM8lWLVfvM5WbHev0U2LVdswB6bJ6ajdjn1sa8=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=J1bHU+twpkfXtGTuFt8gGM5eYOYaNAyarSvqyFbKiA4nO6nJbnZGc1xlAIUYrT74N
 YOUMDDgN4b7Q4O9XYktFnZ5n45/3KU7/o7uD7HksBuJ3mlzACxRHPywUBt2Q9fl5o2
 Ra2M3XZ26o5mi21NgK6UCamqhU5ZW/uIKFjg40hwY3SjyQRxIvVydFeMwkWHvD+mPi
 IosMrPvrM9WElk84QcakFXQS/UyscUqGsSMsQ9PwgVTkxMoQjy2aEK1cQiVbY4dfyf
 BbiwhBnk6YfZq0eHsxV0MZRwj6TSgEYk/gBkUk6vdp3YYd6NjltrXQk2R4W6XOCs/U
 fCAMjwu+7eOJA==
Received: from [100.113.6.49] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 3A/99-33844-DA4F3706;
 Mon, 12 Apr 2021 07:20:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRorvmS3G
 CwZ8uG4sV33cwOjB67Pu9jjWAMYo1My8pvyKBNePErE2MBS08FWe2H2VrYJzJ1cXIySEk0MIk
 sWNZRBcjF5C9m1Fi7trDzCAJNgFNiWedC8BsEQEJiY6Gt+wgNrOAusTySb+YQGxhAUeJX9+ms
 oHYLAKqEhsPrmABsXkFPCW63ywB65UQUJCY8vA9mM0pYCcx78hMRojFthJf9qxihagXlDg58w
 kLxHwJiYMvXkD1Kkpc6vjGCGFXSnSuX8A4gZF/FpKWWUhaFjAyrWK0TCrKTM8oyU3MzNE1NDD
 QNTQ01jXXNTI21Eus0k3SSy3VTU7NKylKBMrqJZYX6xVX5ibnpOjlpZZsYgQGZEoh+/MdjKve
 fNA7xCjJwaQkyvvNqThBiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTv3k9AOcGi1PTUirTMHGB0w
 KQlOHiURHiXfABK8xYXJOYWZ6ZDpE4xKkqJ89Z9BkoIgCQySvPg2mAReYlRVkqYl5GBgUGIpy
 C1KDezBFX+FaM4B6OSMG8HyBSezLwSuOmvgBYzAS2+uLUQZHFJIkJKqoGpTtZK46b4Vk3vXWl
 TakJcjA+a9vY47hHk0ec9vUgywf9c5SrXLJVlx3f4yX1wWfVxzylTvWqOrTsFj0wIm3Nr476X
 /x9YPKnXWibK3bp3xdzzO1cds0hI1P/HYThPerpRnG26U/LjbdUiT8OrKuXT+nenfMzbtG+OX
 tAxj4i1ErEK+41TA0tN9jHufWps1Pf3kdKG1/yR87bcNKowWNC98Y+4Ek+86lkPn9r8X1fyP8
 5rTu5xTWj1uuLV0rQv8qt/1qmZt8p6nqywyF3Fq3bo5D3Z9r3OollcXnLi33fFPPZ4atF976J
 uTdiNq1svPPUPDU1qXpqzXfPwm7lLhQPP6H+fIiy3i/3ycUn7A4uVWIozEg21mIuKEwGiOcpa
 QwMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-15.tower-245.messagelabs.com!1618212012!1162987!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11264 invoked from network); 12 Apr 2021 07:20:12 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-15.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2021 07:20:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13C7K6Go023161
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 08:20:12 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 12 Apr 2021 08:20:04 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 12 Apr 2021 16:20:12 +0800
Message-ID: <1618215614-24840-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <d1c91207-35eb-402f-566c-1289ba2c786a@oracle.com>
References: <d1c91207-35eb-402f-566c-1289ba2c786a@oracle.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/3] tst_safe_sysv_ipc.c: Add SAFE_SEMOP macro
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

Reviewed-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 include/tst_safe_sysv_ipc.h |  4 ++++
 lib/tst_safe_sysv_ipc.c     | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/tst_safe_sysv_ipc.h b/include/tst_safe_sysv_ipc.h
index bb6532662..7804ce192 100644
--- a/include/tst_safe_sysv_ipc.h
+++ b/include/tst_safe_sysv_ipc.h
@@ -65,4 +65,8 @@ int safe_semctl(const char *file, const int lineno, int semid, int semnum,
 	(semid) = ((cmd) == IPC_RMID ? -1 : (semid)); \
 	tst_ret_; })
 
+int safe_semop(const char *file, const int lineno, int semid, struct sembuf *sops,
+		size_t nsops);
+#define SAFE_SEMOP(semid, sops, nsops) \
+	safe_semop(__FILE__, __LINE__, (semid), (sops), (nsops))
 #endif /* TST_SAFE_SYSV_IPC_H__ */
diff --git a/lib/tst_safe_sysv_ipc.c b/lib/tst_safe_sysv_ipc.c
index e72985d61..012f5ba38 100644
--- a/lib/tst_safe_sysv_ipc.c
+++ b/lib/tst_safe_sysv_ipc.c
@@ -227,3 +227,21 @@ int safe_semctl(const char *file, const int lineno, int semid, int semnum,
 
 	return rval;
 }
+
+int safe_semop(const char *file, const int lineno, int semid, struct sembuf *sops,
+		size_t nsops)
+{
+	int rval;
+
+	rval = semop(semid, sops, nsops);
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"semop(%d, %p, %zu) failed", semid, sops, nsops);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid semop(%d, %p, %zu) return value %d",
+			semid, sops, nsops, rval);
+	}
+
+	return rval;
+}
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
