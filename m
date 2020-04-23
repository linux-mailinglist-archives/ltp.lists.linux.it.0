Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F11B5E9E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 17:06:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A0CA3C2952
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 17:06:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8A6113C2922
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 17:06:29 +0200 (CEST)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 450CC60125C
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 17:06:26 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id d17so7220601wrg.11
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xwgHtncJcfNpwYVeXehk8cY4YAGKlFQhhnE93Njxw2s=;
 b=tcrAQAWvVjbkcM2cOGJVSRCH55sY8lBPtQXPUccR/yHw2ysL1AGg26ndoTT2UkLefp
 98/JPmvNmSCuGLHGQpORe9P+TvjkpXZOJMlIlnaZtzbm4+2uTBIoz9n7IEthh1SUoN5D
 XL9QJnobk3isqsIeHGpXXrPjU6yQ3D34KzztBg7y5px3n5Dht/Gn9tU9CnCOEXP1EKXp
 yq3rKYqzbX23qZJv0XsFugYhSW4cZK9cXHSLSg3URl5ZLRZJkl96MYMvNKWZ47WRTsop
 fORjMNt3qjOWqP9zzjVtncEXmROywQzWRzJAT9WIBPRjLqMlNMJ+i7Y1Wjm6s3wBeUJC
 4Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xwgHtncJcfNpwYVeXehk8cY4YAGKlFQhhnE93Njxw2s=;
 b=Z0GoO9KjEvgrXYyZnl17wtYbyHq3B3RCdAmKX/JMSkqp2rskR/hBlFd6uadSYgAyz0
 MQbLVjw+GSZq2jzFVaB7yJFyZDXdQWoiE6ZYgEptdGaEN7vLBZoulMbLiHZP0pxro9WJ
 fJ1ZnwIbkPG6TIdT7AMo0ZNHINUnVHuYuXVnoyet3iH8q+EEqnLczufpzHM+6/rmVN43
 Nchy/5v87EWt52k7JKZx0zzOYt+6OCVC+j1COfA//HB3BRA7yfiUp8FGhThftSxXD7SD
 Z2+O+ueY0cwo3IhaqJGx46L73X83X7nlSnOf293hZ1LEnaiilPmawxWGGxghJQulyYDR
 /kPA==
X-Gm-Message-State: AGi0PuZp7iIA43wq6XuZN3S/lb4X2NIFE5Ra1qox1zU9xTVpdkH+7/3Z
 1495GneIHbITU84Y8joi/liVnCCJ/zs=
X-Google-Smtp-Source: APiQypJfQJU+QLZgy8IgHju5PJLLB88MepuHERPQAsWIqMEPzLTzeAJ0Snonl1y+AAnLt+Oq9Btk5A==
X-Received: by 2002:a5d:544f:: with SMTP id w15mr5738620wrv.77.1587654388442; 
 Thu, 23 Apr 2020 08:06:28 -0700 (PDT)
Received: from localhost.localdomain ([87.116.179.159])
 by smtp.gmail.com with ESMTPSA id d133sm4663678wmc.27.2020.04.23.08.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 08:06:27 -0700 (PDT)
From: Filip Bozuta <fbozuta1@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 23 Apr 2020 17:06:23 +0200
Message-Id: <20200423150626.12672-1-fbozuta1@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/3] Add tests for a group of real time clock ioctls
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

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

v2:
    * changed patches so that they are not sent as attachments but
      as "inline" mails

    * changed structure initialization style in first and second test
      to designated initialization

    * corrected the first and second test to avoid corruption of /dev/rtc
      device driver file (RTC time and alarm are set back to current values
      at the end of the test)

Filip Bozuta (3):
  testcases/kernel/syscalls/ioctl: Add test for RTC ioctls used to read
    and set RTC time
  testcases/kernel/syscalls/ioctl: Add test for RTC ioctls used to read
    and set RTC alarm time
  testcases/kernel/syscalls/ioctl: Add test for RTC ioctls used to turn
    on/off RTC interrupts

 runtest/syscalls                              |   4 +
 testcases/kernel/syscalls/ioctl/.gitignore    |   3 +
 testcases/kernel/syscalls/ioctl/ioctl_rtc01.c | 121 ++++++++++++++++++
 testcases/kernel/syscalls/ioctl/ioctl_rtc02.c | 115 +++++++++++++++++
 testcases/kernel/syscalls/ioctl/ioctl_rtc03.c |  86 +++++++++++++
 5 files changed, 329 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc01.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc02.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc03.c

-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
