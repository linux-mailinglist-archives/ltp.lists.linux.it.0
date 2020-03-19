Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE4018B2DA
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 12:58:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD2763C5462
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 12:58:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 554A73C5453
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 12:58:50 +0100 (CET)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 200E31A00E7C
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 12:58:47 +0100 (CET)
Received: by mail-pj1-x1042.google.com with SMTP id l36so930012pjb.3
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 04:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fg0eRj74RPEEiXCtp7NJzURlIaDYaadpewlYt0e1YyY=;
 b=CIoGKus2p+q4r16VGJGPz8YvT8LC89SroRa8ZcqjVuqBLx2VRWyaglCqOgKMzSqDe1
 qWrCTc1jqLxmWUIFJVMzAPANf2AhIxnKs/12Smj4r2NKtg8SKKiEp7zL/MML3sL9U12i
 QixeBCamQ9Gby93tcvbQx7LSlXFiH1BKmAlOtZJBbA4ODQG9385F0FNJA+dk4/k8ZA1Y
 T0AQjzDkc9agNOBVkZ1Y0ST3dzUyCew/+99HEN4p3uMqQWt9rW4J0zOEdWPVwYRpI+7K
 4hiBs76rQ3Lf2Iw3IF97MR7tAe8m1koir63zi/CklKPeHYZST1Umh4Ftt0KEU+N6A2rt
 yzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fg0eRj74RPEEiXCtp7NJzURlIaDYaadpewlYt0e1YyY=;
 b=q38sZSYeI3+qfM/3Xby7Go6n6HJ6m1YVjElXDCxzfwUqanm4CtPUMSUV+drUNPwF7u
 pNkm4r+OTu4DVRkFeU8R7mk8LZl4B3ASJdkwDql8dJiXO+BE3bkpNjEW3PjNNsvFiiyv
 xsy8fii2W4/OfGJkklI2YyRuLPdtG9Z2UWjdK4zwsL4KTtSnoIog4iRRBB9SnZ0mM0K2
 mNsHvqT4NTI0XECU3ysw72ebzSKZEWl6Lp5ZAQM3fL9NpmIn4hNmfwV5SACZWc+s/DMK
 gGkeis1sL6sXaFfKiaPj415M2gtUkI+ixp2m4X5XBG6lcDsZae8nEYizYTAozbup02y5
 RznA==
X-Gm-Message-State: ANhLgQ3HP6fC73DXRGCzu1jdOF0yV9RsljlBI/I15Y2yRPNNAiXe66We
 ws/T6qGJoPyZXgbVV4DUfmyljYTqQBo=
X-Google-Smtp-Source: ADFU+vujmu/xc7L2qNyInUYTirzDq39iNIyZQ6eQjzQ9fbLV7iBawXyIHJhRLRjMSYN5N7fz4sFFxA==
X-Received: by 2002:a17:90a:c385:: with SMTP id
 h5mr3378753pjt.131.1584619125238; 
 Thu, 19 Mar 2020 04:58:45 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id a127sm2378299pfa.111.2020.03.19.04.58.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 04:58:44 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 19 Mar 2020 17:28:37 +0530
Message-Id: <cover.1584618969.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 0/2] syscalls/clone3: New tests
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
 .../lapi}/pidfd_send_signal.h                 |   8 +-
 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/clone3/.gitignore   |   2 +
 testcases/kernel/syscalls/clone3/Makefile     |   7 +
 testcases/kernel/syscalls/clone3/clone301.c   | 152 ++++++++++++++++++
 testcases/kernel/syscalls/clone3/clone302.c   | 101 ++++++++++++
 .../pidfd_send_signal/pidfd_send_signal01.c   |   2 +-
 .../pidfd_send_signal/pidfd_send_signal02.c   |   2 +-
 .../pidfd_send_signal/pidfd_send_signal03.c   |   2 +-
 11 files changed, 320 insertions(+), 9 deletions(-)
 create mode 100644 include/lapi/clone.h
 rename {testcases/kernel/syscalls/pidfd_send_signal => include/lapi}/pidfd_send_signal.h (73%)
 create mode 100644 testcases/kernel/syscalls/clone3/.gitignore
 create mode 100644 testcases/kernel/syscalls/clone3/Makefile
 create mode 100644 testcases/kernel/syscalls/clone3/clone301.c
 create mode 100644 testcases/kernel/syscalls/clone3/clone302.c

-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
