Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B30518C667
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:24:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8902D3C549C
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:24:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id BBD363C5458
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:24:15 +0100 (CET)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF405200744
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:24:12 +0100 (CET)
Received: by mail-pj1-x1041.google.com with SMTP id dw20so3001427pjb.0
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 21:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E4cW28Wr5+JuuPANlVZMtLMbfcnZ8MqE72J1ByBpHHQ=;
 b=goe62jnuPI4dsExYcb0mYFMAptxkz+8eXP2UODeFVhULZCslNUzHkyC/iyP/55n8Gi
 gqF5CMNqHZHwgqNZmL7Ah3C18NZvADBzdI+HosP3IFcGdch5evx8/hEjAhN6sXLhJPUQ
 9SQ03MjnvQoijEQpY8T/0/MfsjJbHeU5WOV7rIrB7Dcs6/P3CGTmJUrJvyQHLEct+v3W
 GguRsVkaKaKAhbR5vMjfReroVT0ji56GipJjgJ/dSt8RM5GlY7LgH+FWMPZzCcx0ARgY
 d8S2ysQQ0Nz81tWtIJ8RKZVrH9zWSHNSBUfy0tRGOPDayWkbrLfHm2FsIFtgTVSm0xeg
 6+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E4cW28Wr5+JuuPANlVZMtLMbfcnZ8MqE72J1ByBpHHQ=;
 b=C34OKnQLUn1So9LyzI5uXV338c6HcUT7/qHEdKRfBIaJzkiI+98+q+tVxhxqmH3hrz
 cdvRGh8aCtia03Vxa1/ie4IELjNoYnTRPLNzvkVpjfehE55RfQKtcKvdwPOa8M3vpLMU
 pMYaXUA0qlYKxhnTNN9ulTEB240s+CZhGmbmcGqnCfTr3OYasT+IZcARCOTgaAT7hxnb
 vjNmqXqAKFEV0kTL8MzSilgFLPmR83mb7YNUi5Y7UVc3idKcJUWJU75y+8l0ToXSe0Cs
 buW5LvEtxTn+fVSG5mBQUy9udIvlzQ8yKG4wV5npGarppp6U5jQc04T5Cgdevr8nSXaI
 lb0g==
X-Gm-Message-State: ANhLgQ3jGmCzQ2UPooxSwdk5qsIWWgy75zQOyckFUxg3zvMh3tZIJ4Xe
 t05tO4feJoMxXxcFq2StCqFq9OWKU5s=
X-Google-Smtp-Source: ADFU+vsI+bvUzbD/luN9OYB8xoSawVk91TQSosapePvUC2fKfTms+Qqk9f6/Fb4pOFvvZyLI2e7lWA==
X-Received: by 2002:a17:90b:3601:: with SMTP id
 ml1mr6596463pjb.104.1584678250882; 
 Thu, 19 Mar 2020 21:24:10 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id e30sm3797614pga.6.2020.03.19.21.24.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 21:24:10 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 20 Mar 2020 09:54:00 +0530
Message-Id: <cover.1584677993.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V3 0/2] syscalls/clone3: New tests
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Here is the second attempt at adding clone3() related tests.

--
viresh

V2->V3:
- Rename check_syscall_support() and make it a routine.
- Don't print messages from signal handlers.
- Don't allocate structures at runtime unnecessarily.
- Initialize invalid_args to an invalid address instead of NULL.

V1->V2:
- Relocated pidfd_send_signal.h, as clone3() needs to use the syscall.
- clone301.c is now sending and verifying signals between parent/child
  processes.
- More failure tests to validate remaining fields.

Viresh Kumar (2):
  syscalls/pidfd_send_signal: Move pidfd_send_signal.h to include/lapi/
  syscalls/clone3: New tests

 configure.ac                                  |   1 +
 include/lapi/clone.h                          |  49 ++++++
 .../lapi}/pidfd_send_signal.h                 |   3 +-
 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/clone3/.gitignore   |   2 +
 testcases/kernel/syscalls/clone3/Makefile     |   7 +
 testcases/kernel/syscalls/clone3/clone301.c   | 150 ++++++++++++++++++
 testcases/kernel/syscalls/clone3/clone302.c   | 102 ++++++++++++
 .../pidfd_send_signal/pidfd_send_signal01.c   |   4 +-
 .../pidfd_send_signal/pidfd_send_signal02.c   |   4 +-
 .../pidfd_send_signal/pidfd_send_signal03.c   |   4 +-
 11 files changed, 321 insertions(+), 8 deletions(-)
 create mode 100644 include/lapi/clone.h
 rename {testcases/kernel/syscalls/pidfd_send_signal => include/lapi}/pidfd_send_signal.h (85%)
 create mode 100644 testcases/kernel/syscalls/clone3/.gitignore
 create mode 100644 testcases/kernel/syscalls/clone3/Makefile
 create mode 100644 testcases/kernel/syscalls/clone3/clone301.c
 create mode 100644 testcases/kernel/syscalls/clone3/clone302.c

-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
