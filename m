Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7273B26D9
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 07:33:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2D5A3C6F2D
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 07:33:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 330B43C2025
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 07:33:40 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6F9D51400F39
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 07:33:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1624512818; i=@fujitsu.com;
 bh=BNS4tz5AY0+VfLBm7VrZPTvotA+IZ85r/wNrhdAtkLw=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=WAPtR5bIdBAeBSnCLaY/NAqYOHJI3HcOli5Zt/hc19qucvwxE6QH6GseKI71YUM4n
 6bt3MIxhytn2kNxXqwPFn2qoTOrL1R4RHpVDM5YNhaFwvpLXx3PTIfRs19+RCgjni4
 fMBd+VaLsza0gUNxjVQmRFzH1ZQ18Di4Ho/bOlyM11W41NYHoq7+VrIf2wbl6qnmeM
 hS7uLcwphv09ftF09SanUNT1vKn4ywDb8NBovpubAMqS0g1iAZMgn0eIFSobZPLbVD
 zlTBdnfP7RrAi0fcqVVO8yp9dWIf32KSpMAwY2GWswsrBK7KXnXg3AdpZPfBenIjsB
 HIQu0ySEDU8/g==
Received: from [100.112.193.7] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-west-1.aws.symcld.net id DC/32-39326-13914D06;
 Thu, 24 Jun 2021 05:33:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8MRomsoeSX
 B4PpuWYvpL46yWaz4voPRgclj3+91rB5nFhxhD2CKYs3MS8qvSGDNmP9hM2PBQ4GKL+0HWBoY
 J/N1MXJxCAm8ZpTYtWAjM4Szh1FiyeJdTF2MnBxsApoSzzoXMIPYIgKiEp+nnwOzmQVsJZ4/v
 MTWxcjBISwQJ9HyXgnEZBFQlWg8qA5SwSvgIfH5wlNWEFtCQEFiysP3YJ2cAioSXVt+gk0XEl
 CWaN+5iAWiXlDi5MwnLBDTJSQOvnjBDNGrKHGp4xsjhF0hMWPGNrYJjPyzkLTMQtKygJFpFaN
 FUlFmekZJbmJmjq6hgYGuoaGRrqElEJuY6CVW6SbqpZbqlqcWl+ga6iWWF+sVV+Ym56To5aWW
 bGIEBmhKwYEJOxj3v/6gd4hRkoNJSZT3Pv+VBCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvLdEg
 XKCRanpqRVpmTnAaIFJS3DwKInwfhQGSvMWFyTmFmemQ6ROMSpKifN+FwNKCIAkMkrz4NpgEX
 qJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvHZApPJl5JXDTXwEtZgJarPD7IsjikkSElFQ
 Dk2tPhNaFzt0WvLFSdQ9uH7i8SnZt0vGZuhvvG4i92aLydWFn3jbDfefy2vvmPfZntGN6ILZX
 64/obr+IpKbP3cKzdpqnyT1vLnn+c94HZ84r11iu1f+OtDn53ljxcsDF8PUhl60ldY6Uh8W66
 P985B6k3HV+4SJ/7efe3T3/vlmXamTeX7n34otkd0/1sE27A7U/KPGtC630vJSi7t9/7LL0D8
 X+9yli91flFVf4uWglbg4XF52oKxF7+qHYxea1L/SmN+yaLWEamJrmnBR45ETE0c8/cxac4Jo
 076/ZvBMFK7reaYbP/9T/eMXV1EIfZkX+zr2z2Hrn3QtbaPd77Wbb3T6++rVFT924xQK2KLEU
 ZyQaajEXFScCAOT/QltLAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-20.tower-267.messagelabs.com!1624512817!113442!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5140 invoked from network); 24 Jun 2021 05:33:37 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-20.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Jun 2021 05:33:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O5XOh4023383
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 24 Jun 2021 06:33:30 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 06:33:21 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 24 Jun 2021 13:33:45 +0800
Message-ID: <1624512827-3256-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <YNM4rlDJLzb4xk6v@yuki>
References: <YNM4rlDJLzb4xk6v@yuki>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/3] lib: Add SAFE_SETGROUPS() and SAFE_GETGROUPS()
 function to LTP library
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 include/tst_safe_macros.h | 10 ++++++++++
 lib/tst_safe_macros.c     | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index d68f26021..6fd618597 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -136,6 +136,16 @@ pid_t safe_getpgid(const char *file, const int lineno, pid_t pid);
 #define SAFE_GETPGID(pid) \
 	safe_getpgid(__FILE__, __LINE__, (pid))
 
+int safe_setgroups(const char *file, const int lineno, size_t size, const gid_t *list);
+
+#define SAFE_SETGROUPS(size, list) \
+	safe_setgroups(__FILE__, __LINE__, (size), (list))
+
+int safe_getgroups(const char *file, const int lineno, int size, gid_t list[]);
+
+#define SAFE_GETGROUPS(size, list) \
+	safe_getgroups(__FILE__, __LINE__, (size), (list))
+
 #define SAFE_UNLINK(pathname) \
 	safe_unlink(__FILE__, __LINE__, NULL, (pathname))
 
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index fd5f1704b..fcff6d161 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -54,6 +54,42 @@ pid_t safe_getpgid(const char *file, const int lineno, pid_t pid)
 	return pgid;
 }
 
+int safe_setgroups(const char *file, const int lineno, size_t size, const gid_t *list)
+{
+	int rval;
+
+	rval = setgroups(size, list);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"setgroups(%zu, %p) failed", size, list);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid setgroups(%zu, %p) return value %d", size,
+			list, rval);
+	}
+
+	return rval;
+}
+
+int safe_getgroups(const char *file, const int lineno, int size, gid_t list[])
+{
+	int rval;
+
+	rval = getgroups(size, list);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"getgroups(%i, %p)", size, list);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid getgroups(%i, %p) return value %d", size,
+			list, rval);
+	}
+
+	return rval;
+}
+
 int safe_personality(const char *filename, unsigned int lineno,
 		    unsigned long persona)
 {
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
