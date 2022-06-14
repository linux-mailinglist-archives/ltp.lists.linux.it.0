Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8466F54AE35
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jun 2022 12:23:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C48843C9480
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jun 2022 12:23:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 225FC3C217F
 for <ltp@lists.linux.it>; Tue, 14 Jun 2022 12:23:42 +0200 (CEST)
Received: from a8-81.smtp-out.amazonses.com (a8-81.smtp-out.amazonses.com
 [54.240.8.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 05906200923
 for <ltp@lists.linux.it>; Tue, 14 Jun 2022 12:23:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1655202220;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=QZSsYwMJ0ewbx+HJhBsIcJgoKaYLYehT6gGSbsNNCs8=;
 b=ZPKD3oFbEMyaOm7TJn3uw1RVSa7XCAQDwQGNSuIbN+pMaAlaBF5aiucXV4L/QKMl
 2IZMyo7PO3GZYw0F6lH3pVqHX4sgltvnqNEJLBpWosf2mkTIuuWYH0/eZMMzxOUNZVt
 xlL83C14GWSEGeGX/sC348+d0tB7rGzP6S66H6Wk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1655202220;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=QZSsYwMJ0ewbx+HJhBsIcJgoKaYLYehT6gGSbsNNCs8=;
 b=QFtWDs80Ba09CZGzTs80q3823n//QAXaS9cNgIFlbEapQJ3cT27ndwDtS7rAgcg0
 RX3ipQLdm7gaeaBosYs/bbLS6ZiNoZB4aQxBdQuwPjvBJ3i/MooYcezFU7i8WMFdZAG
 ZU4YE1UuKpLD6Z3mOHdJH2snj+nrXu4dUqCPgHBI=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100018161bd8892-766ad5c6-069c-4a14-9cca-7b57203fe56e-000000@email.amazonses.com>
Date: Tue, 14 Jun 2022 10:23:40 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.06.14-54.240.8.81
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 20220527-44-g3b783e4
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
Cc: lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

## Build
* kernel: 5.17.13
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.17.y
* git commit: 8eb69e8f0d4544de764ab03c5b292ead949d9ac1
* git describe: 20220527-44-g3b783e4
* test details: https://qa-reports.linaro.org/lkft/ltp/build/20220527-44-g3b783e4

## Test Regressions (compared to 20220527-43-g1a51aa7)
* qemu_arm64, ltp-cve-tests
  - cve-2019-8912


## Metric Regressions (compared to 20220527-43-g1a51aa7)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 20220527-43-g1a51aa7)
No test fixes found.

## Metric Fixes (compared to 20220527-43-g1a51aa7)
No metric fixes found.

## Test result summary
total: 12223, pass: 10290, fail: 54, skip: 1879, xfail: 0

## Build Summary

## Test suites summary
* log-parser-boot
* log-parser-test
* ltp-cap_bounds-tests
* ltp-commands-tests
* ltp-containers-tests
* ltp-controllers-tests
* ltp-cpuhotplug-tests
* ltp-crypto-tests
* ltp-cve-tests
* ltp-dio-tests
* ltp-fcntl-locktests-tests
* ltp-filecaps-tests
* ltp-fs-tests
* ltp-fs_bind-tests
* ltp-fs_perms_simple-tests
* ltp-fsx-tests
* ltp-hugetlb-tests
* ltp-io-tests
* ltp-ipc-tests
* ltp-math-tests
* ltp-mm-tests
* ltp-nptl-tests
* ltp-pty-tests
* ltp-sched-tests
* ltp-securebits-tests
* ltp-syscalls-tests
* ltp-tracing-tests

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
