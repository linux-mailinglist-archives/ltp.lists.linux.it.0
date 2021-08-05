Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0CD3E0CE4
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 05:48:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 026DF3C8103
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 05:48:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 43B073C808F
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 05:48:39 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5BED21A006BE
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 05:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1628135317; i=@fujitsu.com;
 bh=lxWY6+oImCUZYZgjewS9hXDTW36tXIb8dW3jh6lWhCQ=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=jtNXUkZWa64I6oeUXBOackTUK4rbHTpC7/Uwz66isAl9H++xZ7zRbrmidI2uUiAvr
 K98CWJ6CugAVef1MxQ0vOYIOFzfQFQyiNGTi3J+cWRE6pB/H0SSl34x1AkaGOLc8I0
 cGbeP7fiU/DSdOP0JJhO1LOhU0R+u2SaMzynlBEcv0sbDO25OYL5i3Fv/Dw/kbMBfU
 Frow7l5YDgowfp8BFb36p8HGWad26pRgsv/PK3upgM7J0m1cvEj8t+e+uUeK85pNQ1
 JdDTpoNIpWfULFY4LDUudYZ4YDZepf/ME7fx+6Do8ddtFScIwnipnQ6FjxYUDMgVtv
 5qo51HwNzIjfw==
Received: from [100.112.192.148] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 0A/3E-07839-49F5B016;
 Thu, 05 Aug 2021 03:48:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRXdKPHe
 iweVdqhYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8aHp0/YCg4IVVw+fZuxgfERfxcjF4eQQDOT
 xJUVU5ggnN2MEo/bH7J3MXJysAloSjzrXMAMYosISEh0NLwFizMLqEssn/SLCcQWFnCUeDh3E
 5jNIqAi8eDjS7AaXgEPiQ+TloH1SggoSEx5+J4ZIi4ocXLmExaIORISB1+8gKpRlLjU8Y0Rwq
 6QmDWrjWkCI+8sJC2zkLQsYGRaxWieVJSZnlGSm5iZo2toYKBraGika2hppGtiopdYpZuol1q
 qW55aXKJrqJdYXqxXXJmbnJOil5dasokRGF4pBQd0djD+fPVB7xCjJAeTkijvBwnuRCG+pPyU
 yozE4oz4otKc1OJDjDIcHEoSvBdigXKCRanpqRVpmTnAUIdJS3DwKInwhoCkeYsLEnOLM9MhU
 qcYFaXEeSXjgBICIImM0jy4Nlh8XWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzJsCMoUnM6
 8EbvoroMVMQIsvxHKCLC5JREhJNTBJx+pybfa0WNTr9vhIhMHa9TuUnadWbfK6psfPXsbVOke
 ujKmxl0EsWGZN6fVWtmPsUR8KFz+sqPnyd719u2yD7d9c8ayL+3kfdfPzPrm4++r2NAaLfQeX
 ffFWCN/W4fVhXcbrxpqF3AvOMAgvWHp50T5jey3m2IXM3Oxq/3mrjVimXbVhDDWcrvl0rr5vp
 fTcjtjL6pNLvZzXd5p7RU7Y2cEWZLWm4uRCp1qB5kML9pxp6v29+6prfvK6KUvlzu9bqfSzam
 mCz/ZFn5hu3xVs2fdqgohb4TyGRd/n3G47ns/yWzGV89ju+w/P77sfo6tksEjpuKnL4+5fe1/
 sNVfUd/4qZSaYy/txZuce4TdKLMUZiYZazEXFiQAz9jy+KgMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-11.tower-271.messagelabs.com!1628135316!233687!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9493 invoked from network); 5 Aug 2021 03:48:36 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-11.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Aug 2021 03:48:36 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1753mUfN011127
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 5 Aug 2021 04:48:36 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 04:48:29 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 5 Aug 2021 11:48:41 +0800
Message-ID: <1628135323-3722-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/3] libs/libnewipc: Alter get_used_queues api
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

Rename get_used_queues as get_used_sysvipc and add a proc file argument, so we can use
GET_USED_QUEQUES() and GET_USED_SEGMENTS() to get the corresponding used sysvipc resource
total. Since no new api cases used get_used_queues(), we don't need to change anything.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 include/libnewipc.h           |  6 ++++--
 libs/libltpnewipc/libnewipc.c | 16 ++++++++--------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/libnewipc.h b/include/libnewipc.h
index 075364f85..52e054c51 100644
--- a/include/libnewipc.h
+++ b/include/libnewipc.h
@@ -49,9 +49,11 @@ key_t getipckey(const char *file, const int lineno);
 #define GETIPCKEY() \
 	getipckey(__FILE__, __LINE__)
 
-int get_used_queues(const char *file, const int lineno);
+int get_used_sysvipc(const char *file, const int lineno, const char *sysvipc_file);
 #define GET_USED_QUEUES() \
-	get_used_queues(__FILE__, __LINE__)
+	get_used_sysvipc(__FILE__, __LINE__, "/proc/sysvipc/msg")
+#define GET_USED_SEGMENTS() \
+	get_used_sysvipc(__FILE__, __LINE__, "/proc/sysvipc/shm")
 
 void *probe_free_addr(const char *file, const int lineno);
 #define PROBE_FREE_ADDR() \
diff --git a/libs/libltpnewipc/libnewipc.c b/libs/libltpnewipc/libnewipc.c
index d0974bbe0..583291ee0 100644
--- a/libs/libltpnewipc/libnewipc.c
+++ b/libs/libltpnewipc/libnewipc.c
@@ -48,25 +48,25 @@ key_t getipckey(const char *file, const int lineno)
 	return key;
 }
 
-int get_used_queues(const char *file, const int lineno)
+int get_used_sysvipc(const char *file, const int lineno, const char *sysvipc_file)
 {
 	FILE *fp;
-	int used_queues = -1;
+	int used = -1;
 	char buf[BUFSIZE];
 
-	fp = safe_fopen(file, lineno, NULL, "/proc/sysvipc/msg", "r");
+	fp = safe_fopen(file, lineno, NULL, sysvipc_file, "r");
 
 	while (fgets(buf, BUFSIZE, fp) != NULL)
-		used_queues++;
+		used++;
 
 	fclose(fp);
 
-	if (used_queues < 0) {
-		tst_brk(TBROK, "can't read /proc/sysvipc/msg to get "
-			"used message queues at %s:%d", file, lineno);
+	if (used < 0) {
+		tst_brk(TBROK, "can't read %s to get used sysvipc resource total "
+			"at %s:%d", sysvipc_file, file, lineno);
 	}
 
-	return used_queues;
+	return used;
 }
 
 void *probe_free_addr(const char *file, const int lineno)
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
