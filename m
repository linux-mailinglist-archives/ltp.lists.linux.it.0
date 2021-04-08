Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA86357A62
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 04:29:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D86383C80C8
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 04:29:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 497A13C1DDD
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 04:29:42 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8F5B11000EC3
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 04:29:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1617848980; i=@fujitsu.com;
 bh=xjDoma22UNDcm/hyv862dYYl05BEi+lCqP3pk9UOqX0=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=Tqwar83FYdVBzGCWYqGf8baEtbOmcI6mN8HyLJlaq0qtaHGKwDsDTxqkAcpL0UtOq
 syZFohnlED0Cac1NJpcyaiRi1ny3ROU+GuLNFgmr15YUoZa2zjShWjnz3LXONEO/qM
 G88hHKEbfJ+4vaBzERYO9rjcpOtZRHI7fm+x8GPtOtTrnDXocpUneFw12NF3Ozx8cI
 1CM3/mMlPyZch7Zdw8IFdOAyFXK9o+sBIp12QHbMLS0je+W60JtP0nwA0IFnesTFvw
 ZjmR7IBjb2zyXGOWxUpIriv2ETKqFZ2PnAAKPv/qqZxkUHZRHYZXiVVNr7JATclyTo
 NHf2czZ3lYWFA==
Received: from [100.112.192.143] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 78/C1-14660-49A6E606;
 Thu, 08 Apr 2021 02:29:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8MRqjslKy/
 B4OYKJov3VycwWaz4voPRgclj3+91rB4fn95iCWCKYs3MS8qvSGDN2L3Pp2ATT0Xj17OMDYyH
 uLoYuTiEBFqZJG40rGWEcHYzSvTu7GXrYuTkYBPQlHjWuYC5i5GDQ0RAXuLC7BoQk1kgT+JVT
 zhIhbCAo8T5GQ8YQWwWARWJv9MvsYPYvAKeEvt3n2EBsSUEFCSmPHzPDGJzCthJLJj0kAnEFh
 Kwlej8dYURol5Q4uTMJ2D1zAISEgdfvGCG6FWUuNTxjRHCrpLo/HCcbQIj/ywkLbOQtCxgZFr
 FaJFUlJmeUZKbmJmja2hgoGtoaKRraAnERmZ6iVW6iXqppbrlqcUluoZ6ieXFesWVuck5KXp5
 qSWbGIHhmVJwoG4H44PXH/QOMUpyMCmJ8to9yU0Q4kvKT6nMSCzOiC8qzUktPsQow8GhJMHbk
 JGXICRYlJqeWpGWmQOMFZi0BAePkgjv+3SgNG9xQWJucWY6ROoUo6KUOK93JlBCACSRUZoH1w
 aLz0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHl9QabwZOaVwE1/BbSYCWhxycFckMUliQg
 pqQamjsRFvps/53/cuX3J9Z4QztOXPiddeHP97Yyo2UW89UyvFO5pTpubrJDDUPbANOHi3tcL
 o5i3r5Waqnhabcb0k5Zr83p2nL5UO6f5xunkRamfv/x6oKwrlH1l45I3Hycaf1S4VXb67obZj
 eFNuxmWVAtvYppTrDipU7rIacY/h7OrxROL9NtWcFv3NqYdf2AcnsfpcdvQsoxri/ibzdvSdG
 PlfYX2e9xS+KlrdPXlgrh7H3YY1Mv0nDeY84yj9lTuwYes2jXTf61KT1rmekGKNb88VvCUME/
 6w1dzdn6KXlbpEZ5yYmVIofjGCb1Pzy79IR3UN+ufaMPXoLyq+baSxWqhU4+0T5KXeDhJmfXa
 ZyWW4oxEQy3mouJEAHm0HJtKAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-6.tower-265.messagelabs.com!1617848979!365340!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8187 invoked from network); 8 Apr 2021 02:29:40 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-6.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Apr 2021 02:29:40 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1382TXST022670
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 8 Apr 2021 03:29:39 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 03:29:31 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <alexey.kodanev@oracle.com>
Date: Thu, 8 Apr 2021 11:29:29 +0800
Message-ID: <1617852571-20874-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <46e7a46a-f3d2-078d-1126-5a8679cea7be@oracle.com>
References: <46e7a46a-f3d2-078d-1126-5a8679cea7be@oracle.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] tst_safe_sysv_ipc.c: Add SAFE_SEMOP macro
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
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
