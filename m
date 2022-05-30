Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D88F538704
	for <lists+linux-ltp@lfdr.de>; Mon, 30 May 2022 20:05:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6183D3C24A4
	for <lists+linux-ltp@lfdr.de>; Mon, 30 May 2022 20:05:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 974EC3C0215
 for <ltp@lists.linux.it>; Mon, 30 May 2022 20:05:25 +0200 (CEST)
Received: from a8-35.smtp-out.amazonses.com (a8-35.smtp-out.amazonses.com
 [54.240.8.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A715C14000BA
 for <ltp@lists.linux.it>; Mon, 30 May 2022 20:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1653933923;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=Uq8wSeNEbu2hJUm/h1/1LH2k9oD7ZXEa2vMvcvXjOxw=;
 b=SpBLM5wx25qccCfO3pUwEslmZ+golypM+cE4smT6rFkj5xgMkRRUE3LLcOTU8pnZ
 UuYajnbZ+jKHcZ8YQTAfZec3wlTTeiBIqVUDWATFH51Z6UaZaXUSgNrSHP3etRRvg0n
 0AMl+AHZEfUfzrk1Bo3xkg3zMEIsBRaMWhiTe3Y8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1653933923;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=Uq8wSeNEbu2hJUm/h1/1LH2k9oD7ZXEa2vMvcvXjOxw=;
 b=CtCv8GrbNWVa23H1kAY4vpKEiciw2e5lcqyPM2lBXUCZOCEjAMLMqNg1ckjLTmsh
 G0z9SM3wDCeSK1WgzUlFavpouVgilRCfHPWpAbjxN2b6/uuVw8KVZJg5oAm6B03nQNL
 VvSDqiU0aT2Mzyf8HPlN9ZS5DFVN86pVwLz7ZnPA=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <010001811624d9ca-6ed94cbf-a99f-457e-b151-bc01962337ed-000000@email.amazonses.com>
Date: Mon, 30 May 2022 18:05:22 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.05.30-54.240.8.35
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 20220527-7-gb924b21
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
* git describe: 20220527-7-gb924b21
* test details: https://qa-reports.linaro.org/lkft/ltp/build/20220527-7-gb924b21

## Test Regressions (compared to 20220527-6-g26ab74b)
* qemu_arm64, ltp-cve-tests
  - cve-2019-8912

* qemu_arm64, ltp-fs-tests
  - read_all_proc


## Metric Regressions (compared to 20220527-6-g26ab74b)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 20220527-6-g26ab74b)
* qemu_x86_64, ltp-syscalls-tests
  - futex_waitv02


## Metric Fixes (compared to 20220527-6-g26ab74b)
No metric fixes found.

## Test result summary
total: 12639, pass: 10637, fail: 61, skip: 1941, xfail: 0

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
