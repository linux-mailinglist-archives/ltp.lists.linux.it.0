Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D72EF1B4B4E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 19:08:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8944C3C296A
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 19:08:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E368C3C2961
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 17:28:43 +0200 (CEST)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 407A310007CA
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 17:28:43 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id s10so2940473wrr.0
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=YKrOtFC0z1WPYK1XjVM6SuHJUfrHbueyyHIs4MWYSL0=;
 b=Sd7r5WNn/4ac0ZN+MZDywhV3CRFIhp2PPFH43a+Aa3ws9KzmloZdvSDUX9jFvFoipQ
 v23dbewd4J52AeBQnCZ5zHusYq1yzSiorxW2QXAagyT1xHgRH1rFIXJpA/l8xrQnC37y
 yYUF0suWIDc1SEn4VWwOgjyPpPIgyxL6GmeCQjNY3u92QIkKU0M/oek7545Th+F16Vla
 0un/YLl5RtvOsyNjsebwkB/QnAm1iJqdGKh2xDqe9TVU6nxiwN3EvapJtYAV0vFdSFtS
 kzQVMy9zbY3I5yWknZsxto/RvmtAKRsEr/1HJk7gP9LoPlM2Zl597cZdu4QwwCj8RGUy
 Mrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=YKrOtFC0z1WPYK1XjVM6SuHJUfrHbueyyHIs4MWYSL0=;
 b=tQ/nbo08XX8TV+RGaaeuEs7SkJUqEWJS7nXSPrV+VRkLYe1YGunwMBww+UP0sY1cVd
 Q0ubjMNx1Meh8f9lsZLChMMGiXmXrOfmCJvgzfqYSFakf6tkXtu1lVZtERlYwWDY08aT
 eIUoNpwhp8gO535QCRdYR/bSenmAF940OZc9OK3dVSqQAtOjgrgzGCEww4Msyln81vFg
 3ObkXIXFqBp4DoQYDicDx63qmyMVH2qi6++mVpuvm8IYC/ATKiJbDM3T4deI+IiFVfc2
 bihuPLPjHcEBMaTCF0PWfhp15glSk9pag9BktmzIsZikIOXWmT1pYQeBGL8RN1CPITcO
 h8VQ==
X-Gm-Message-State: AGi0PuYiRN/0pRyO0vevfOXpnNDSQCqb+QHSzvHY/qGJakH/0unmhA5c
 8vMB32JjGp+XOhS4c96lIMSjiGvD8yw=
X-Google-Smtp-Source: APiQypLZRi3ktNlVDX+zfDVFGkTcDSLRf/imHe3sgVkjDZ0/Ro+vlt0f6h/a++GgZ9x0dIlrEzlGYA==
X-Received: by 2002:adf:c109:: with SMTP id r9mr30141878wre.265.1587569322609; 
 Wed, 22 Apr 2020 08:28:42 -0700 (PDT)
Received: from localhost.localdomain ([87.116.179.159])
 by smtp.gmail.com with ESMTPSA id s14sm7963872wmh.18.2020.04.22.08.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 08:28:42 -0700 (PDT)
From: Filip Bozuta <fbozuta1@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 17:28:38 +0200
Message-Id: <20200422152841.13432-1-fbozuta1@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.17.1"
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 22 Apr 2020 19:07:52 +0200
Subject: [LTP] [PATCH 0/3] Add tests for a group of real time clock ioctls
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
Cc: Aleksandar.Markovic@rt-rk.com, laurent@vivier.eu
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--------------2.17.1
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit


This series covers tests for following RTC ioctls:

    *RTC_RD_TIME    *RTC_UIE_ON
    *RTC_SET_TIME   *RTC_UIE_OFF
    *RTC_ALM_READ   *RTC_PIE_ON
    *RTC_ALM_SET    *RTC_PIE_OFF
    *RTC_AIE_ON     *RTC_WIE_ON
    *RTC_AIE_OFF    *RTC_WIE_OFF

The functionalities of individual ioctls were described in this series
patch commit messages.

The testing method for these ioctls is described in the upper comment
sections of test programs.

Filip Bozuta (3):
  testcases/kernel/syscalls/ioctl: Add test for RTC ioctls used to read
    and set RTC time
  testcases/kernel/syscalls/ioctl: Add test for RTC ioctls used to read
    and set RTC alarm time
  testcases/kernel/syscalls/ioctl: Add test for RTC ioctls used to turn
    on/off RTC interrupts

 runtest/syscalls                              |   4 +
 testcases/kernel/syscalls/ioctl/.gitignore    |   3 +
 testcases/kernel/syscalls/ioctl/ioctl_rtc01.c | 112 ++++++++++++++++++
 testcases/kernel/syscalls/ioctl/ioctl_rtc02.c | 107 +++++++++++++++++
 testcases/kernel/syscalls/ioctl/ioctl_rtc03.c |  88 ++++++++++++++
 5 files changed, 314 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc01.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc02.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc03.c

-- 
2.17.1

--------------2.17.1
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--------------2.17.1--
