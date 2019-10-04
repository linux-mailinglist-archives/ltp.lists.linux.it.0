Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A8CBA8C
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 14:36:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04E8C3C2265
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 14:36:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 884AC3C2212
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 14:36:39 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DC26E1A00925
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 14:36:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 074C6AF85
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 12:36:37 +0000 (UTC)
Date: Fri, 4 Oct 2019 14:36:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20191004123636.GA5442@rei.lan>
References: <20190926151331.25070-1-mdoucha@suse.cz>
 <20190926151331.25070-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926151331.25070-2-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] Update syscalls/bind02 to new API
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

Hi!
Pushed with minor changes, thanks.

* The new test library runs the test in a forked process, there is no
  need to reset the effective GID and UID in the cleanup anymore, so
  I've removed the cleanup function.

* Changed the test to explicitly test for -1 as a return value. We have
  to be pedantic here. We had bugs where syscalls returned non-zero
  value which was != -1 which broke programs that were explicitly
  testing for -1.

+ Minor things such as:
  - using TTERRNO instead of TERRNO, which means that you print the
    value of TST_ERR instead of errno which could be clobbered because
    you call close() after bind()
  - declared run() and setup() as a static functions
  - make use of SAFE_CLOSE() instead of close()

Full diff:

diff --git a/testcases/kernel/syscalls/bind/bind02.c b/testcases/kernel/syscalls/bind/bind02.c
index 532831265..65944cbe3 100644
--- a/testcases/kernel/syscalls/bind/bind02.c
+++ b/testcases/kernel/syscalls/bind/bind02.c
@@ -26,7 +26,7 @@
 #define TCP_PRIVILEGED_PORT 463
 #define TEST_USERNAME "nobody"
 
-void run(void)
+static void run(void)
 {
 	struct sockaddr_in servaddr;
 	int sockfd;
@@ -37,18 +37,18 @@ void run(void)
 	servaddr.sin_port = htons(TCP_PRIVILEGED_PORT);
 	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
 	TEST(bind(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)));
-	close(sockfd);
+	SAFE_CLOSE(sockfd);
 
-	if (!TST_RET) {
-		tst_res(TFAIL, "bind() succeeded unexpectedly");
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "bind() returned %li, expected -1", TST_RET);
 	} else if (TST_ERR == EACCES) {
-		tst_res(TPASS, "bind() failed as expected");
+		tst_res(TPASS | TTERRNO, "bind() failed as expected");
 	} else {
-		tst_res(TFAIL | TERRNO, "Unexpected error");
+		tst_res(TFAIL | TTERRNO, "Unexpected error");
 	}
 }
 
-void setup(void)
+static void setup(void)
 {
 	struct passwd *pw;
 	struct group *gr;
@@ -62,15 +62,8 @@ void setup(void)
 	SAFE_SETEUID(pw->pw_uid);
 }
 
-void cleanup(void)
-{
-	SAFE_SETEGID(0);
-	SAFE_SETEUID(0);
-}
-
 static struct tst_test test = {
 	.test_all = run,
 	.needs_root = 1,
 	.setup = setup,
-	.cleanup = cleanup
 };

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
