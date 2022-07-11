Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C67775706C6
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jul 2022 17:15:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64B363CA775
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jul 2022 17:15:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6121B3C9725
 for <ltp@lists.linux.it>; Mon, 11 Jul 2022 17:15:13 +0200 (CEST)
Received: from a8-29.smtp-out.amazonses.com (a8-29.smtp-out.amazonses.com
 [54.240.8.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 45AD0100064B
 for <ltp@lists.linux.it>; Mon, 11 Jul 2022 17:15:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1657552510;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=foWIlRoW7Aaiy1Ho4CdWrpKe3UU0uyFrVOhbsoyCI4Q=;
 b=K0DDeG5r8GbQfKRUzy2h89c7Grbu6bh5ab/O9DhIfHnYajJD8GD+3MFbXmblZ1Ls
 SH/hV+zxs2nFyQBZ31sfPbxxHRZnTCQsOTUGF0BuxsCL60MCzT78VTUvd4NPoK8Gq+I
 psqDhvsfh4g6eVptG5XRUGKYyrhgA08tEKmSbPVs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1657552510;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=foWIlRoW7Aaiy1Ho4CdWrpKe3UU0uyFrVOhbsoyCI4Q=;
 b=TzaDS1FcfRWY8xr8t3+Nga/d4LEvuyUV9w9mCN2g2u4Zz71nYrc2UmxdFM75hzFL
 brPY/tGros3RcqIEL2bfE5d/KLKypLmkJ8pDMCJXOCPcWWSAxLPuSnvqENWqjYbaRPg
 ve+7qi+8I8ACg2Kp8GQNrf3fDDh90Br6DYdF6HEk=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <01000181edd41db5-5224ef92-f2c0-4d9d-929d-f5ec2aacc9bd-000000@email.amazonses.com>
Date: Mon, 11 Jul 2022 15:15:10 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.07.11-54.240.8.29
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 9ed8ba0
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
* kernel: 5.17.15
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.17.y
* git commit: eed68052d2016d9f96d6656435099762608120e3
* git describe: 9ed8ba0
* test details: https://qa-reports.linaro.org/lkft/ltp/build/9ed8ba0

## Test Regressions (compared to 17d354e)
* qemu_arm, ltp-syscalls
  - accept02

* qemu_x86_64, ltp-cve
  - cve-2018-1000204


## Metric Regressions (compared to 17d354e)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 17d354e)
* qemu_arm64, ltp-cve
  - cve-2019-8912


## Metric Fixes (compared to 17d354e)
No metric fixes found.

## Test result summary
total: 12643, pass: 10649, fail: 62, skip: 1932, xfail: 0

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
