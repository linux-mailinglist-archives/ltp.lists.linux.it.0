Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B4A2E17C8
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 04:35:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 639DB3C5710
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 04:35:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0762F3C299A
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 04:35:39 +0100 (CET)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AC0EE200BD1
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 04:35:39 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id y8so8444689plp.8
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 19:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXIZdiNBDZPB0WFkBKq7+WhYmx4XMhwo6J4/01nYv44=;
 b=fKUD2hL+MGCrffr6DucttM2dsfBbT6vC7Sn8l/eJpyQvR8PkfbsZHC2SiZOJ/IASMt
 DTBZesJbijO6sDE8YrHiRv1kzATfqoj/sjylH46BXQQnQdSG9uFtGQVYBavlCAE9dnE4
 iqC1wSnXgqd5yXIOQCqQaxetiyljhxa6JwvezihmvpLBpo6thuPh47y7I2jGJW32k19u
 UgiTMUSyQUaLov6GziDDSfkX3byBNH9GNeNemRtNyZAAN+YvwdqU8VZxMjZNLnHUg93O
 uJkjw2WfgNo66eKMHbqCnSSMOtYURAJvUmyWA7HGDY4GpZoZclRm6oHUbk3u0oIrqri3
 bsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXIZdiNBDZPB0WFkBKq7+WhYmx4XMhwo6J4/01nYv44=;
 b=BKbJ5h+zss3nrOFqoMYgKd/SNy6mFHfDJRtAB8RYMrNc77bIiwkgybC49nYyRs8lcS
 ABhJ96mWWCmAqstyyRepTimRkyAOlWKCrEAX2ck6eDFgu8X7BVB9Q/fyZF752z8AVleJ
 IXS02FRZ8pCC9gZV1HkU8iKQYmXmdxPJhAjS1DfAucqFdgF68PBDeH6fNaipB8hoSrx+
 zfd5u+Yryq66013VfWvHEzFdOnCVMeKCQgatJ35hN/Ny5xmp4o1batTt5DxpnJJHrn7z
 fnSaJyCK2fCs9C78cBfn1IMw50OKzAc62iiuCCagVKM+tzN5ts3kQhe5aU7U49O8k0o1
 yhBw==
X-Gm-Message-State: AOAM533JkcgFrHlJaKib9yiuXJ3WscslNFWR2SRbsgbPi99IT5BvyPnD
 f7QUxg07GQj2xQth35r0kaSIs1qKqE8+oC8Z
X-Google-Smtp-Source: ABdhPJzf9o7BjZ7//JnpgXK7GmnYYHB5WYcBgFmxGRDLfNaMU2/Ixi8WpRWAK/Fu5PZj/b2zMxh1MQ==
X-Received: by 2002:a17:90a:3989:: with SMTP id
 z9mr25010904pjb.198.1608694537877; 
 Tue, 22 Dec 2020 19:35:37 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id n1sm22809020pfu.28.2020.12.22.19.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 19:35:37 -0800 (PST)
From: gengcixi@gmail.com
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz
Date: Wed, 23 Dec 2020 11:35:14 +0800
Message-Id: <20201223033517.1464263-1-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] add rtctime libs and rtc02 case
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
Cc: orsonzhai@gmail.com, Cixi Geng <cixi.geng1@unisoc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <cixi.geng1@unisoc.com>

This file is a implementation for rtc test function
in tst_rtctime lib, support tst_rtc_gettime and tst_rtc_settime;
at the same file, also add rtctime and time_t convert functions.
in tst_wallclock.s, add tst_rtc_save and tst_rtc_restore for testcase
used in SETUP and CLEANUP.

the rtc02 testcase is verify set rtctime a exact timestamp.

Cixi Geng (3):
  lib: add tst_rtctime* for rtc test
  lib: implement rtctime_save and rtctime_restore function
  rtc02: add rtc set time verify case

 include/tst_rtctime.h                         |  15 ++
 include/tst_wallclock.h                       |   4 +
 lib/tst_rtctime.c                             | 161 ++++++++++++++++++
 lib/tst_wallclock.c                           |  42 +++++
 runtest/kernel_misc                           |   1 +
 .../kernel/device-drivers/rtc/.gitignore      |   1 +
 testcases/kernel/device-drivers/rtc/rtc02.c   | 108 ++++++++++++
 7 files changed, 332 insertions(+)
 create mode 100644 include/tst_rtctime.h
 create mode 100644 lib/tst_rtctime.c
 create mode 100644 testcases/kernel/device-drivers/rtc/rtc02.c

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
