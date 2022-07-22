Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4EA57E240
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jul 2022 15:21:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F3983CA0F0
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jul 2022 15:21:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 03DDB3C9EA3
 for <ltp@lists.linux.it>; Fri, 22 Jul 2022 15:21:03 +0200 (CEST)
Received: from a48-37.smtp-out.amazonses.com (a48-37.smtp-out.amazonses.com
 [54.240.48.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8E2D3601141
 for <ltp@lists.linux.it>; Fri, 22 Jul 2022 15:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1658496061;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=LuiZS485OIv06CfsU8FtH4q+gDl8UGtcXRMtDiVi0uo=;
 b=dHxSILg3PzMXOGZcn9Qn8raXbUEhTdUvKI5q7dBJ7e9QxSfaOzlg/Od1tihmaK4U
 eWjMTXf/aY4aQDPTeLcmHeiucfhg/ESCtHnLTNzVjvVb9Ijkv5pgrVirS6LWUwOsIfR
 MlN1/6WKryp0ptCV9i0mJ1QJ7OWpcjGt2PhiKR7M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1658496061;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=LuiZS485OIv06CfsU8FtH4q+gDl8UGtcXRMtDiVi0uo=;
 b=cVjE6mmJ4EUQ8vicNv/FoREoLanzUJ6ReBtzAYOavSGW2mGfeqmLvK2WH3LwrNAO
 YLl4Yw3p1Rnc8bVZ1Cz/79QO1JL6obxi9mtmORGLhniPiIRtOB5N5y2kzc/Do47RLgH
 i1VQ5A3Xft7l2ul9cNPt77gWFBVwm2lodBQdSr3I=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100018226118d1a-2717c52f-ec2e-437c-9c61-26ab9efc26a7-000000@email.amazonses.com>
Date: Fri, 22 Jul 2022 13:21:00 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.07.22-54.240.48.37
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] lkft ltp for d18e2bf
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
* kernel: 5.18.13
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.18.y
* git commit: 0283cbd1473380d3ae46f653eac128aebb288423
* git describe: d18e2bf
* test details: https://qa-reports.linaro.org/lkft/ltp/build/d18e2bf

## Test Regressions (compared to bda92ad)
No test regressions found.

## Metric Regressions (compared to bda92ad)
No metric regressions found.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to bda92ad)
No test fixes found.

## Metric Fixes (compared to bda92ad)
No metric fixes found.

## Test result summary
total: 1120, pass: 1120, fail: 0, skip: 0, xfail: 0

## Build Summary

## Test suites summary
* log-parser-boot
* log-parser-test

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
