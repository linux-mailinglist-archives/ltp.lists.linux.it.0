Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296F5B6B2E
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 11:51:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40B6F3CAAF2
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 11:51:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 053383CA900
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 11:51:06 +0200 (CEST)
Received: from a8-73.smtp-out.amazonses.com (a8-73.smtp-out.amazonses.com
 [54.240.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E3C011400DCA
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 11:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1663062664;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=76EXBAjOos01r1inAKkEDUtqRxlUanZsOMfk6bl5E4M=;
 b=fdJpF2BPFs8s/10vTwNBEozdyvZwbwTgLL2TEyI/KmWQaF2kyF5NnSFsq3Y70CCd
 dbDAZPEc7+ROMBR4YYeJeoH8krXvwnWWXETPOaGIqKvp8MFxzQQiqk5M8mKrHPg31fY
 AOhYYfFCil4IMonFOwMog/run+7iHyOjr0xCCI4U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1663062664;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=76EXBAjOos01r1inAKkEDUtqRxlUanZsOMfk6bl5E4M=;
 b=G8xJJHcIGCK8bmGdVG3IIdWMpJmc5ZmcaqyoTY/B/8EmKsiySHgeeOSBAic4Tg5f
 IU2XA8qiV/+0qIhZKs2fQ8On7frfZgMSFmY+Hvri4kWsV7YR50XEeRsaK4tJyd2yODb
 UCm2wP6hACNy4vPYIGyYf32VCI26argpc/LfGx4E=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <010001833642643f-00abe96f-9dd8-448d-a9af-8d15b16809bc-000000@email.amazonses.com>
Date: Tue, 13 Sep 2022 09:51:04 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.09.13-54.240.8.73
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 4d23b30
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
* git describe: 4d23b30
* test details: https://qa-reports.linaro.org/lkft/ltp/build/4d23b30

## Test Regressions (compared to 17763bb)
* qemu_arm, ltp-syscalls
  - epoll_pwait01

* qemu_arm64, ltp-controllers
  - cpuacct_100_100

* qemu_i386, ltp-controllers
  - cpuacct_100_100

* qemu_x86_64, ltp-controllers
  - cpuacct_100_100


## Metric Regressions (compared to 17763bb)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 17763bb)
No test fixes found.

## Metric Fixes (compared to 17763bb)
No metric fixes found.

## Test result summary
total: 12287, pass: 10433, fail: 159, skip: 1695, xfail: 0

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
