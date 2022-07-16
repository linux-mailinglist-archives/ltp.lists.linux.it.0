Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D71F577004
	for <lists+linux-ltp@lfdr.de>; Sat, 16 Jul 2022 18:02:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74D553CA360
	for <lists+linux-ltp@lfdr.de>; Sat, 16 Jul 2022 18:02:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3DED53C97D2
 for <ltp@lists.linux.it>; Sat, 16 Jul 2022 18:02:09 +0200 (CEST)
Received: from a8-97.smtp-out.amazonses.com (a8-97.smtp-out.amazonses.com
 [54.240.8.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8F6EB6006E7
 for <ltp@lists.linux.it>; Sat, 16 Jul 2022 18:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1657987326;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=ArtLFjay28qt9isnmGRIs/guQae13BhzVijdCgtE7wg=;
 b=A4zf4YCm/h9tvdBjAZMYyIGhd6Z9I4D9Fdl+turjdCcqggwy3OXZNHY5eXGUoSq5
 PY7kzWXVNRQ8G3VuxqKTJcyIBcpi7scWTljB+zc6PZE9KJl/Gbdr8wWSXTLWFEwu8i/
 jnjNken9PztpBoKwBJq0gHuE/actPYI3icC7IJ1c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1657987326;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=ArtLFjay28qt9isnmGRIs/guQae13BhzVijdCgtE7wg=;
 b=jmnsKCuX3p/7k/0uOk4cdXqt7dwI+mf0nRzgmeLcIdwHtjmQNgX3VmJ+kWjfpfcx
 WSrSJ4CEjZdJl3vcRW4YIIb6R7MKPXdJT023hJMW8UkboD0d4QQIz1Qm8b8I4jGCKcr
 xlBiUWml+2t9Ntp9XNpmtZn5RbxA2YY021ytviok=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100018207bedf8d-734a7554-d70c-4b90-982e-7eb2d647dba4-000000@email.amazonses.com>
Date: Sat, 16 Jul 2022 16:02:05 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.07.16-54.240.8.97
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] lkft ltp for bda92ad
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
* kernel: ['5.18.10', '5.18.12']
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.18.y
* git commit: ['bc560cecaa8b2517932808fa939e36371ffa036e', 'c2e9702659dfc309dfda6116da48f200fe425aab']
* git describe: bda92ad
* test details: https://qa-reports.linaro.org/lkft/ltp/build/bda92ad

## Test Regressions (compared to 3866cf0)
No test regressions found.

## Metric Regressions (compared to 3866cf0)
No metric regressions found.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 3866cf0)
No test fixes found.

## Metric Fixes (compared to 3866cf0)
No metric fixes found.

## Test result summary
total: 2240, pass: 2240, fail: 0, skip: 0, xfail: 0

## Build Summary

## Test suites summary
* log-parser-boot
* log-parser-test

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
