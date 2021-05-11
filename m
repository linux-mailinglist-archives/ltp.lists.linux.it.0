Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E537A343
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 11:16:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CECE3C64AA
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 11:16:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 928673C1421
 for <ltp@lists.linux.it>; Tue, 11 May 2021 11:16:48 +0200 (CEST)
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 447CC600652
 for <ltp@lists.linux.it>; Tue, 11 May 2021 11:16:45 +0200 (CEST)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net ((LNX1044)) with ASMTP (SSL) id FGC00037
 for <ltp@lists.linux.it>; Tue, 11 May 2021 17:16:37 +0800
Received: from localhost.localdomain (10.48.66.98) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server id
 15.1.2176.2; Tue, 11 May 2021 17:16:38 +0800
From: dongshijiang <dongshijiang@inspur.com>
To: <ltp@lists.linux.it>
Date: Tue, 11 May 2021 05:16:30 -0400
Message-ID: <20210511091630.23257-1-dongshijiang@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
X-Originating-IP: [10.48.66.98]
tUid: 20215111716373513c2051feadc42bfc384f864c52b5a
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] bugfix for network/lib6/getaddrinfo_01.c
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
Cc: dongshijiang <dongshijiang@inspur.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

For test cases (test2 ,IPV4 canonical name) and (test13 ,IPV6 canonical name)

The gethostname() API returns the official name of host, not the canonical name of host. The canonical name of host needs to be obtained through the gethostbyname() API;

Signed-off-by: dongshijiang <dongshijiang@inspur.com>
---
 testcases/network/lib6/getaddrinfo_01.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/testcases/network/lib6/getaddrinfo_01.c b/testcases/network/lib6/getaddrinfo_01.c
index db252a998..bf5af7b4a 100644
--- a/testcases/network/lib6/getaddrinfo_01.c
+++ b/testcases/network/lib6/getaddrinfo_01.c
@@ -75,6 +75,14 @@ static void gaiv4(void)
 	if (gethostname(hostname, sizeof(hostname)) < 0)
 		tst_brkm(TBROK | TERRNO, NULL, "gethostname failed");
 	strncpy(shortname, hostname, MAXHOSTNAMELEN);
+
+	//get official name of host
+	struct hostent *phostent = NULL;
+
+	phostent = gethostbyname(hostname);
+	if (phostent == NULL)
+		tst_brkm(TBROK | TERRNO, NULL, "gethostbyname failed");
+
 	shortname[MAXHOSTNAMELEN] = '\0';
 	p = strchr(shortname, '.');
 	if (p)
@@ -134,10 +142,10 @@ static void gaiv4(void)
 				 "entries with canonical name set");
 			freeaddrinfo(aires);
 			return;
-		} else if (strcasecmp(hostname, pai->ai_canonname)) {
+		} else if (strcasecmp(phostent->h_name, pai->ai_canonname)) {
 			tst_resm(TFAIL, "getaddrinfo IPv4 canonical name "
 				 "(\"%s\") doesn't match hostname (\"%s\")",
-				 pai->ai_canonname, hostname);
+				 pai->ai_canonname, phostent->h_name);
 			freeaddrinfo(aires);
 			return;
 		}
@@ -533,6 +541,14 @@ static void gaiv6(void)
 	if (gethostname(hostname, sizeof(hostname)) < 0)
 		tst_brkm(TBROK, NULL, "gethostname failed - %s",
 			 strerror(errno));
+
+	//get official name of host
+	struct hostent *phostent = NULL;
+
+	phostent = gethostbyname(hostname);
+	if (phostent == NULL)
+		tst_brkm(TBROK | TERRNO, NULL, "gethostbyname failed");
+
 	strncpy(shortname, hostname, MAXHOSTNAMELEN);
 	shortname[MAXHOSTNAMELEN] = '\0';
 	p = strchr(shortname, '.');
@@ -593,10 +609,10 @@ static void gaiv6(void)
 				 "entries with canonical name set");
 			freeaddrinfo(aires);
 			return;
-		} else if (strcasecmp(hostname, pai->ai_canonname)) {
+		} else if (strcasecmp(phostent->h_name, pai->ai_canonname)) {
 			tst_resm(TFAIL, "getaddrinfo IPv6 canonical name "
 				 "(\"%s\") doesn't match hostname (\"%s\")",
-				 pai->ai_canonname, hostname);
+				 pai->ai_canonname, phostent->h_name);
 			freeaddrinfo(aires);
 			return;
 		}
-- 
2.18.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
