Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A54E54B1
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Mar 2022 15:59:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 848003C97AA
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Mar 2022 15:59:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7355A3C1A87
 for <ltp@lists.linux.it>; Wed, 23 Mar 2022 15:59:07 +0100 (CET)
Received: from a8-81.smtp-out.amazonses.com (a8-81.smtp-out.amazonses.com
 [54.240.8.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 76E66200C11
 for <ltp@lists.linux.it>; Wed, 23 Mar 2022 15:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1648047544;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=cN9hIOrzO8XcJkfOkY0v8733VRFjRwdWrfP7koylnQQ=;
 b=eUXA7zr/PBD2anu8D554pUlfCXeK1QuwHqPqZTTT43DBIf0qtvZXiyMmPTc6mLfj
 gy7Ev3irdUdkn7YkLHxmIYAO+8genzAFgH6fAewpY2RGqynb3lvnJCZfjwWZ9U+j5nq
 dM8kmXjx4DDYz6SQr+Vh3SQoqV6wnVafMBqhdp/0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1648047544;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=cN9hIOrzO8XcJkfOkY0v8733VRFjRwdWrfP7koylnQQ=;
 b=ZTSsBBPrZvFSak16Y3rADTCeV0KIhbRuNBoHtO1PCdQ+aEcN/1hjSMI8Ncvk9y3N
 GBPcrPHEc4j2mQnReuezyU6D9fjhaK4Cfb6JU4BPn1ZUl5UQh06DFRobp+2I+idjx4B
 s4/ip4OUqoWirNUo9KRx5nVMBqtRXycNOmxOdqd0=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100017fb749d8a0-d0f0ffc4-a7b3-4e24-bf2f-c552480d1c39-000000@email.amazonses.com>
Date: Wed, 23 Mar 2022 14:59:04 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.03.23-54.240.8.81
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 7ff52f0
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
* kernel: 5.16.16
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.16.y
* git commit: 9aed648340400df7f403d41d8558244afd6d69d3
* git describe: 7ff52f0
* test details: https://qa-reports.linaro.org/lkft/ltp/build/7ff52f0

## Test Regressions (compared to 5b9db1a)
* qemu_arm, ltp-controllers-tests
  - memcg_limit_in_bytes

* qemu_arm, ltp-syscalls-tests
  - accept02

* qemu_i386, ltp-syscalls-tests
  - futex_wait_bitset01


## Metric Regressions (compared to 5b9db1a)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 5b9db1a)
* bcm2711-rpi-4-b, ltp-syscalls-tests
  - inotify11

* qemu_x86_64, ltp-controllers-tests
  - memcg_subgroup_charge


## Metric Fixes (compared to 5b9db1a)
No metric fixes found.

## Test result summary
total: 12109, pass: 10133, fail: 50, skip: 1926, xfail: 0

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
