Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F36381E722A
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 03:44:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B6283C3292
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 03:44:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 227FE3C31C6
 for <ltp@lists.linux.it>; Fri, 29 May 2020 03:44:54 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CBAFD1200456
 for <ltp@lists.linux.it>; Fri, 29 May 2020 03:44:53 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id q9so422146pjm.2
 for <ltp@lists.linux.it>; Thu, 28 May 2020 18:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xPD3QsuLdiQx92Efd3oFPSGdCussURW2RnuOrA0QzoY=;
 b=clJNwxhtSF80yRl0heVU4MsRnG/Dm5cytNx4YkfXVdMxfpIpXSPFmT6cgZ47mFL06P
 i02oqdGclQU418mQERACahKgdaxKtVcpVXLDFPZbEl8QxEKRe3yWfqL7SqLhkAmyNsH1
 rwYfsDTR6Mv/wpU6acoTPhQn6di/FhhNbHLiZ4FFMMRiTnwVlwFItKYaqw073inoFuG5
 4TqOdOAog2zNT1d3STkfCZ1x8+KxaQoLbCv00OgtNn7iGhPPSt+DodtKfD4RmqDJbvnd
 LImDwpWOfsrDsy0tI3110/OsfdZpfeeTj34bez9FZ7R9F2Q4nZtj1Quw1pUJdSua96Jx
 ZwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xPD3QsuLdiQx92Efd3oFPSGdCussURW2RnuOrA0QzoY=;
 b=PZN4sE4BuVoUPwW7yardQQM0BwFbmjdooOyEwjcDnWTnGuSh+5+C1QjCY0bIHDfEJv
 GGNBcYCVqD2fm8t87jeKVEWbOUXTuw0FhI0IXEmNUihDz6EQ7OWM9+ZTzp6+lF1/UOXm
 YfIKS5umHemI+T0dZfvdlug0NRDpm9F47n9RPBcqpX1a2UQj6Q9W4FIaq26sUX6rwqg/
 MzMdatD35PAZYLxsBYOrb0Gmaaz3Q5SS6X2H+YeRKHZv7PXeRrhC7SzH9XDvsF3MFwwB
 dJMcZQA6s++7moPrSRda5eabuJ/JvZeYtaNdcF7CHEuA2JMwI0QW39FSoJdEq+mInTas
 wkFA==
X-Gm-Message-State: AOAM532vd8BUBwS+2fMenR8APnuccLEHwzCBHnAZPS6Abkke9SrAN2+R
 OOXp/93DeKrtnFTjkQcZOPhfDXkd6FM=
X-Google-Smtp-Source: ABdhPJxjF4bf4lnbJCiIQt9s5qMyujHvVY766XpxW7HVtMQNzJGmy5pTemsSzjq4tNTvW+0lbwfg/Q==
X-Received: by 2002:a17:902:7c05:: with SMTP id
 x5mr6687192pll.278.1590716691796; 
 Thu, 28 May 2020 18:44:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3faa])
 by smtp.gmail.com with ESMTPSA id 73sm5345907pge.15.2020.05.28.18.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 18:44:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 28 May 2020 18:44:48 -0700
Message-Id: <20200529014448.3815022-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] sigwaitinfo: Do not run invalid/undefined test
 cases
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
v2: Extend same fixes to include sigwaitinfo01

 .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c      | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
@@ -422,15 +422,10 @@ struct test_desc {
 } tests[] = {
 #ifdef TEST_RT_SIGTIMEDWAIT
 	{
-	test_empty_set, my_rt_sigtimedwait, SIGUSR1}, {
 	test_unmasked_matching, my_rt_sigtimedwait, SIGUSR1}, {
 	test_masked_matching, my_rt_sigtimedwait, SIGUSR1}, {
 	test_unmasked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
-	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
-	test_bad_address, my_rt_sigtimedwait, SIGUSR1}, {
-	test_bad_address2, my_rt_sigtimedwait, SIGUSR1}, {
-	test_bad_address3, my_rt_sigtimedwait, SIGUSR1}, {
-	test_timeout, my_rt_sigtimedwait, 0},
+	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, 
 	    /* Special cases */
 	    /* 1: sigwaitinfo does respond to ignored signal */
 	{
@@ -452,25 +447,17 @@ struct test_desc {
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
Mailing list info: https://lists.linux.it/listinfo/ltp
