Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF82359C69
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 12:55:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8D403C7F3A
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 12:55:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2DEB23C735C
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 12:55:12 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9E3626017E9
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 12:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1617965710; i=@fujitsu.com;
 bh=xjDoma22UNDcm/hyv862dYYl05BEi+lCqP3pk9UOqX0=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=wsPbwkJPsv5nPuV8YKqbKaCkzklmWOy/lW5uba9sCs2uVW/oJEVYr/GUm5MRICA7n
 Nh39z+8+niQBF66mHwiJPk5upLlSWh6fhbYkqxMzWP6Ggj7SifXIgGW/WwWywUGQ2E
 oSYazonnyqs4ss6mOrJGAbOL70lcVfQZcBh42D2GhcwXHsZz8ACDwq++5flNpARxD/
 I48jbELhhlVJd8faHdgGq0KtuxN/G6AsY4G1UNbVUm/zQOKcYppSUW7aH3ye2YoOxF
 UvDiK/FyGzaNqotmwHD8cejbkDSMSduLkCGMFYn7ghvO0SPQtnvBfHHHpMK0+JaLwX
 ewAGPdl4oQqLg==
Received: from [100.113.6.193] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-central-1.aws.symcld.net id B3/16-23163-E8230706;
 Fri, 09 Apr 2021 10:55:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxRbfXqCD
 BYNZHU4sV33cwOjB67Pu9jjWAMYo1My8pvyKBNWP3Pp+CTTwVjV/PMjYwHuLqYuTiEBKYxyTx
 /OdiFghnN6PEj/c3WbsYOTnYBDQlnnUuYAaxRQQkJDoa3rKD2MwCERIL305lBLGFBRwlbs6fB
 1bPIqAi8XzaNrA4r4CHxIr708F6JQQUJKY8fA9kc3BwAtWcWCQKEhYSUJboPXyDDaJcUOLkzC
 csEOMlJA6+eAHVqihxqeMbI4RdJdH54TjbBEb+WUhaZiFpWcDItIrRIqkoMz2jJDcxM0fX0MB
 A19DQWNdM18JcL7FKN0kvtVQ3OTWvpCgRKKmXWF6sV1yZm5yTopeXWrKJERiMKYVs4TsYz7z+
 oHeIUZKDSUmU9xdTQYIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV5LQ6CcYFFqempFWmYOMDJg0
 hIcPEoivIf1gdK8xQWJucWZ6RCpU4yKUuK8p0D6BEASGaV5cG2waLzEKCslzMvIwMAgxFOQWp
 SbWYIq/4pRnINRSZiXG2QKT2ZeCdz0V0CLmYAWlxzMBVlckoiQkmpgEgrdEFp2IdJj/5Gqo+v
 jcmz5GN4dy3jWXfZOs3Gi+cWz1g4aC892+O5f/WlBQw5DfO1N9fIdtk9nyysudlQUsXjr25yd
 MOtuQurz4tOF8b8F13I7ZrBHZqtqTIypUSv7/PWmw/fpV+cfy+xQE7GaNO0p307/RW3mpukPN
 m6azBqltkPXoCGwzZ/plrv2nqkK3Rx/hbyYVL58Wm7a2KPL+nfNLhOVvIMJJmc/fXKI//pz74
 Pfltu79pq925oUZrIqNmrn3W2ix5NvnKk/NunbhpC3yqb35m7a9fCMaMmnWXdmmCsm+JRkJih
 tZZzcI39k+zqnx2cDqmcevHOioSRIe1bsvB0Tbxps6L/JuOG2qhJLcUaioRZzUXEiAOA6YfpB
 AwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-3.tower-238.messagelabs.com!1617965709!1706551!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5122 invoked from network); 9 Apr 2021 10:55:09 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-3.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Apr 2021 10:55:09 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 139At2ne005832
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 9 Apr 2021 11:55:08 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 9 Apr 2021 11:55:00 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 9 Apr 2021 19:55:03 +0800
Message-ID: <1617969305-2237-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <YHAoQooWArsl2rgD@yuki>
References: <YHAoQooWArsl2rgD@yuki>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/3] tst_safe_sysv_ipc.c: Add SAFE_SEMOP macro
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

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
