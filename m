Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C821E6CC6
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 22:46:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F3B53C31F6
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 22:46:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9A5693C3079
 for <ltp@lists.linux.it>; Thu, 28 May 2020 22:46:03 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 18634200913
 for <ltp@lists.linux.it>; Thu, 28 May 2020 22:46:02 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id 5so115887pjd.0
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cm5xjopu+TmMl4MRDTAPwM8jvzujE1E3Bb0kq+cX7Ns=;
 b=DrpOsA3g+fJqUWbF+BTNnH6KXIP4bCId0h2dWx+vqW944A5+mJSnroKrjOxKrNPNyG
 8PjeMPT50kwlUTRW8ZQ6yUbgzk3TFHFgwd9oAjEtnencvuih5VMP1r1J0eSUnxf2YwJ/
 /nyhpx6ndSHS0uRSbAQQ4DTS89776mxmzxIU+pOBy2P46WciCtHBT8ayP89weokvWTC9
 cWyZACPc2U/TF5/r2s5G9+FIjIt5Cn54CF85M7qPTrD5ulEzQCseakRV8UD2oa45qfJD
 MuZifRcakinvPZ1o++zTXmCUPHwOQbQjEKin/JNKHIK0oP7kHCZuZm6ukJtbwIuY0NmD
 DdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cm5xjopu+TmMl4MRDTAPwM8jvzujE1E3Bb0kq+cX7Ns=;
 b=DH/nHKTERkLSaawwq+KIZKNhQHHVOzfD0tvHrcaPjyVeY+R5rTVmrnae3N3cVeQxCz
 flcR4DcJDHdCWQ9H452XqLFUrEtUD2XoPEOkzZ1n77CLE9XxNTVSAUyZ6YBidp1wKgJa
 noUC5WBhix3vLkyV77C0iqdJFM6VthEeA82CKIT21cNp5Dbhy7biQMKXeDlWbNgom6wt
 9Qg1EM0ZauBdL0QuvVqTEws91dLA6ZhBOZJXLtsctMLW3Ovb6mt3ApPhcSJUwq+Y/FPY
 seIJq3isciBLbSDH11/u9uPQU5M5k2C9O2DM+2MyRLMcm+rcqGhz1lVo0qO8TqNeyR8B
 zjRw==
X-Gm-Message-State: AOAM5301Jy/ukGLQRWYVDtBucmMYXT4EMjO+me2LZw+VSS3tfgWqRDsE
 FkvAo0WiWSeMPONTfS9EPmqCs3b1sD0=
X-Google-Smtp-Source: ABdhPJyuwuCBymvrCygl7m4LNfSevFYq4PSjTZI2qKEXQFLPG6cqwpKsA6/7uS1zbSLHfjLdgAONtA==
X-Received: by 2002:a17:902:b401:: with SMTP id
 x1mr5515819plr.43.1590698760119; 
 Thu, 28 May 2020 13:46:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net
 (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
 by smtp.gmail.com with ESMTPSA id h24sm5659319pjz.24.2020.05.28.13.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 13:45:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 28 May 2020 13:45:56 -0700
Message-Id: <20200528204556.2444156-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] sigwaitinfo: Do not run invalid/undefined test cases
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
Cc: Rich Felker <dalias@aerifal.cx>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

These testcases run for eternity on musl

test_bad_address* cases are passing invalid pointers to a function; that's always UB
empty_set and timeout rely on the implementation-defined "may fail" for EINTR in sigtimedwait [1]

normally "may fail" is an "unspecified" but here the impl
is supposed to document it so it's "impl-defined"

[1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/sigtimedwait.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Rich Felker <dalias@aerifal.cx>
---
 .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c      | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
index 6a30c27f6f..3a4cfe1b43 100644
--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
@@ -452,25 +452,17 @@ struct test_desc {
 #endif
 #if defined TEST_SIGWAITINFO
 	{
-	test_empty_set, my_sigwaitinfo, SIGUSR1}, {
 	test_unmasked_matching, my_sigwaitinfo, SIGUSR1}, {
 	test_masked_matching, my_sigwaitinfo, SIGUSR1}, {
 	test_unmasked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
-	test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
-	test_bad_address, my_sigwaitinfo, SIGUSR1}, {
-	test_bad_address2, my_sigwaitinfo, SIGUSR1},
+	test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1},
 #endif
 #if defined TEST_SIGTIMEDWAIT
 	{
-	test_empty_set, my_sigtimedwait, SIGUSR1}, {
 	test_unmasked_matching, my_sigtimedwait, SIGUSR1}, {
 	test_masked_matching, my_sigtimedwait, SIGUSR1}, {
 	test_unmasked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
-	test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
-	test_bad_address, my_sigtimedwait, SIGUSR1}, {
-	test_bad_address2, my_sigtimedwait, SIGUSR1}, {
-	test_bad_address3, my_sigtimedwait, SIGUSR1}, {
-	test_timeout, my_sigtimedwait, 0},
+	test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1},
 #endif
 };
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
