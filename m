Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 19884536A82
	for <lists+linux-ltp@lfdr.de>; Sat, 28 May 2022 06:14:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6F8C3C1BDC
	for <lists+linux-ltp@lfdr.de>; Sat, 28 May 2022 06:14:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 848593C0B90
 for <ltp@lists.linux.it>; Sat, 28 May 2022 06:14:19 +0200 (CEST)
Received: from a8-35.smtp-out.amazonses.com (a8-35.smtp-out.amazonses.com
 [54.240.8.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 61CE160138A
 for <ltp@lists.linux.it>; Sat, 28 May 2022 06:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1653711256;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=jJxzQo5FFwP3ss9uZl6BKeoFx6kw8p562q7dNfJvvdc=;
 b=glCWViYhScanWE5FsV8m6whUJOSL60reyIiNm9+o3vXv+bqVy1y4+U3EzF/3PPNK
 ZEXQnzsjLtUVnZTIR61BG2G/SkUzgPi3fZKHlkqkfVderL90jnfuz6+nTO3X4iC0NP5
 yY4wZWxVJc24IIuD/ZapK6BLZnN+pqsxEPq+NWjM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1653711256;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=jJxzQo5FFwP3ss9uZl6BKeoFx6kw8p562q7dNfJvvdc=;
 b=deSjYMP98lDgYT2fGusXDM6C87Hj0KIfqQ8/bvunSv/eES2WHLP5UIYp62xBP/YL
 Qw4r8DVRvokA5llhDRi5KBV0AFhF0+T6ziM5ChwDf5l+wBAVrfS9WXHSkLTVjFPzO8O
 N0POQlFE/hvOfcovyysPFeiub7Vy/I0Du+snzm5c=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100018108df3bca-0392866a-b3ec-46ec-ba04-196fc7a38bc1-000000@email.amazonses.com>
Date: Sat, 28 May 2022 04:14:16 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.05.28-54.240.8.35
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 20220527-1-ge0c6fbe
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
* kernel: 5.17.11
* git: 
* git branch: linux-5.17.y
* git commit: e960d734930b58bd6ce00c631ea117af0764473c
* git describe: 20220527-1-ge0c6fbe
* test details: https://qa-reports.linaro.org/lkft/ltp/build/20220527-1-ge0c6fbe

## Test Regressions (compared to 20220527)
* qemu_arm64, ltp-cve-tests
  - cve-2019-8912

* qemu_x86_64, ltp-cve-tests
  - cve-2018-1000204


## Metric Regressions (compared to 20220527)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 20220527)
* bcm2711-rpi-4-b, ltp-fs-tests
  - read_all_proc

* qemu_arm64, ltp-crypto-tests
  - af_alg07

* qemu_i386, ltp-cve-tests
  - cve-2018-1000204


## Metric Fixes (compared to 20220527)
No metric fixes found.

## Test result summary
total: 10917, pass: 9191, fail: 47, skip: 1679, xfail: 0

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
