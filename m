Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7485B109D
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Sep 2022 01:44:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 541123CA97E
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Sep 2022 01:44:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 043983C075E
 for <ltp@lists.linux.it>; Thu,  8 Sep 2022 01:44:04 +0200 (CEST)
Received: from a48-34.smtp-out.amazonses.com (a48-34.smtp-out.amazonses.com
 [54.240.48.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BA5B5600C57
 for <ltp@lists.linux.it>; Thu,  8 Sep 2022 01:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1662594242;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=glfeiFyQaHfAeyzEKl23zjrUNlszn5EzZ+SMIXXZeV8=;
 b=Oh405HL6hRpVCwfy3Z6Xo2TwnQj3KU84kt7KY5QrYWx14hBGq2A4JCINSxEv415W
 CH/VAnBvqfgg4s2kinXXM121OO7TamFUvqv7Xb5vhCufVuvJDopHSuVCX2qj/ZDsNm4
 22n/fTgwTu6IaUXPMAg5Dw8Ka7r0y/QCG3TNKjuc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1662594242;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=glfeiFyQaHfAeyzEKl23zjrUNlszn5EzZ+SMIXXZeV8=;
 b=PGTLq6A80O/IGdUofkMEPom1/winQDbg5NSuPsNw6aUyc+yr+SZQ20Gyttw6YuOO
 1FZGGwmQITF75fDSXsyV9ILZknB+H0lG8YgjJNk401VGyI90d06TGjRoVp2jRUvio3n
 35Z2k1tLdvCbTWoqBIhdhssWGiaOgqqK38iBPMXk=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <010001831a56d5d1-2db10f05-98ca-49b3-804a-e5594b7ac11b-000000@email.amazonses.com>
Date: Wed, 7 Sep 2022 23:44:02 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.09.07-54.240.48.34
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 7614aed
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
* kernel: 5.18.19
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.18.y
* git commit: 22a992953741ad79c07890d3f4104585e52ef26b
* git describe: 7614aed
* test details: https://qa-reports.linaro.org/lkft/ltp/build/7614aed

## Test Regressions (compared to 14e3179)
* qemu_arm, ltp-crypto
  - af_alg07

* qemu_arm64, ltp-controllers
  - memcg_stat_rss

* qemu_x86_64, ltp-controllers
  - cpuacct_100_100


## Metric Regressions (compared to 14e3179)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 14e3179)
* bcm2711-rpi-4-b, ltp-syscalls
  - inotify11


## Metric Fixes (compared to 14e3179)
No metric fixes found.

## Test result summary
total: 10598, pass: 8884, fail: 137, skip: 1577, xfail: 0

## Build Summary

## Test suites summary
* log-parser-boot
* log-parser-test
* ltp-cap_bounds
* ltp-commands
* ltp-containers
* ltp-controllers
* ltp-cpuhotplug
* ltp-crypto
* ltp-cve
* ltp-dio
* ltp-fcntl-locktests
* ltp-filecaps
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-fsx
* ltp-hugetlb
* ltp-io
* ltp-ipc
* ltp-math
* ltp-mm
* ltp-nptl
* ltp-pty
* ltp-sched
* ltp-securebits
* ltp-syscalls
* ltp-tracing

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
