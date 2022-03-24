Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 359C14E6043
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Mar 2022 09:22:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5F923C97D6
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Mar 2022 09:22:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 364D63C1A87
 for <ltp@lists.linux.it>; Thu, 24 Mar 2022 09:22:52 +0100 (CET)
Received: from a48-34.smtp-out.amazonses.com (a48-34.smtp-out.amazonses.com
 [54.240.48.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1A59C1000D8F
 for <ltp@lists.linux.it>; Thu, 24 Mar 2022 09:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1648110170;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=DVI7X3Do0mpxotNkqfQr6U8scoz/5FER7YASjTVklys=;
 b=DKiPkXrCp4atIXuvbyqbQZcV1EyEjRdkS1L9MitOC2aTdQ5gwieUNnE46GAriqjb
 nH3ttI58C0bS1NAUcW9pA+Di5I572349b/yGJP6LOZYHCV/QkIjAxy037kzszpF/hA+
 CHo3mIjFY2lJo7T0nZsvA5aFlYGyk97S+YW/k5Aw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1648110170;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=DVI7X3Do0mpxotNkqfQr6U8scoz/5FER7YASjTVklys=;
 b=A4trXALiQPSM8Nj29MUDC1yespuGdLCuKi+0DsKuwbMkQT4aieyr4Wdp+JZJLblI
 U+IGDant0BjPN+FjYTcrX5kXYPhKK2GNgLg6oBjm6R2qFTP6BsZQWQuD9rTmgdLqzXr
 bcsfm2euGRWsxdOhXt+ldg7SyKws1FvHuDGWjKVU=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100017fbb057061-85a1a66b-cfbd-4b1c-a6b2-7b9703c60dcd-000000@email.amazonses.com>
Date: Thu, 24 Mar 2022 08:22:50 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.03.24-54.240.48.34
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 7ff14b9
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
* kernel: 5.16.17
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.16.y
* git commit: b90df4ec299a1dbb7f7164b0db27406643329597
* git describe: 7ff14b9
* test details: https://qa-reports.linaro.org/lkft/ltp/build/7ff14b9

## Test Regressions (compared to 7240b4f)
* qemu_x86_64, ltp-syscalls-tests
  - futex_cmp_requeue01


## Metric Regressions (compared to 7240b4f)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 7240b4f)
* bcm2711-rpi-4-b, ltp-fs-tests
  - read_all_proc

* qemu_arm64, ltp-controllers-tests
  - memcg_subgroup_charge


## Metric Fixes (compared to 7240b4f)
No metric fixes found.

## Test result summary
total: 12109, pass: 10138, fail: 48, skip: 1923, xfail: 0

## Build Summary

## Test suites summary
* linux-log-parser
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
