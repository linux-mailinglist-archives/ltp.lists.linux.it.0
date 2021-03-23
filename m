Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA66345C5E
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 11:57:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2345B3C2D06
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 11:57:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4ECAB3C2853
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 11:57:25 +0100 (CET)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F049F1A00459
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 11:57:24 +0100 (CET)
Received: from [100.112.199.60] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.eu-west-1.aws.symcld.net id C5/3B-64503-499C9506;
 Tue, 23 Mar 2021 10:57:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MRqjv5ZGS
 Cwan35hYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8b6o63MBd+5KzZuusDawNjN1cXIxSEkMJdJ
 4vb/fawQzh5GiW8LFzF3MXJwsAnoSEycLtDFyMkhIiAh0dHwlh3EZhZQl1g+6RcTiC0sYCexZ
 NYDNhCbRUBV4s/MJ+wgrbwCPhLXtvCDhCUEFCSmPHzPDGLzCghKnJz5hAVijITEwRcvmCFqFC
 UudXxjhLCrJNZ0TGObwMg7C0nLLCQtCxiZVjGaJxVlpmeU5CZm5ugaGhjoGhoa6RpaWugaG+g
 lVukm6aWW6panFpfoGuollhfrFVfmJuek6OWllmxiBIZWSsExuR2MvW8+6B1ilORgUhLltToa
 mSDEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvfHcaCcYFFqempFWmYOMMxh0hIcPEoivAYHgNK8x
 QWJucWZ6RCpU4yKUuK8C04AJQRAEhmleXBtsNi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUU
 mY9yXIdp7MvBK46a+AFjMBLf7AHAayuCQRISXVwCTVEVZ4fe/v8nu+57L/HTx4Lag0wU3U11t
 /TrZZUf/cGX3XZwppC2mrXeYpl3gQZzl32+W7qg86Hdbvcri2/iCL2LUr81fkFc5W7Mh8Usti
 zN9qEtKsGS74IDbK9+XV+35zvjSc3n35eJHgk0n7478kLsz5OGHGrZ5pxp+OKPxW4Xc+MDtp8
 0Sv6U/zXB4nqBzSVXv2IUT94PvfC6b++nv4wF2ectZVy0pPMCw/FR9RPWtt/jEt59dHDLZ7vM
 uZpbc9X5Zvzhxmo8PGKnGP31tve6j564Stus+xtUmRzEFJ4hfdQteu3L1+htftZxkL6tT8fP8
 1xzP+lzpoEmG1nfepz+1v20/+33q2cB7jF/mfSizFGYmGWsxFxYkAN8PQ2CgDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-13.tower-285.messagelabs.com!1616497043!69529!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16621 invoked from network); 23 Mar 2021 10:57:23 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-13.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Mar 2021 10:57:23 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com
 [10.182.185.116])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12NAvD5h031109
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 10:57:23 GMT
Received: from localhost.localdomain (10.167.220.84) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 23 Mar 2021 10:57:12 +0000
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 23 Mar 2021 18:57:15 +0800
Message-ID: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] tst_safe_sysv_ipc.c: Add SAFE_SEMOP macro
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

From: Yang Xu <xuyang2018.jy@fujitsu.com>

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
