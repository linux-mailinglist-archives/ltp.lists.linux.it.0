Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF96263522
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:57:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E4683C2C26
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:57:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E9EEE3C262C
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:15 +0200 (CEST)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8FEA11400432
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:15 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id w5so3904364wrp.8
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OUWWqO4xZF9NiQI/KvapAzHebM2nBBQkIELRyXzUEHU=;
 b=OIti04hgbICgBTMnIZsqWEBuqAw6/gEo1hmtLEenIxKXv/ohpgFuZN8AVIFV+48sT/
 NHiYmSVWaQcakjFfAhNCKx5WJHd4W2cktWFkFcgo23E6TuuV6B8qktPz/7KwhKFtcq8X
 ZOa5XWAFfE6GPD7QXTHSQZeHE+9GclexD0pp7fDb6J3X9oo3xkdpJH/b0IzSIDl1tXtY
 5R22DWC5zF5VHINnyKYZmjWa3zYHzYIhNklwja5MXbRF8oXXpS1zZbEFKGJTJODgo9zt
 tJBBROv94n08SQSjc96kTmZm0uekmLYIm4DOpmFfF5hSbZQYjm0/W4/L4Ffor6wpDKUO
 6wPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OUWWqO4xZF9NiQI/KvapAzHebM2nBBQkIELRyXzUEHU=;
 b=NsT68qLjUJ0rVBhathrGi4tL8AG89m4QjLRbUbbzr+H5PLe+toOc2CyEl0imMSAVSb
 faB9iifYd2JUl9a5nRZFbBEIy1yji93RQywaYVD3+G5yEkt7PdlfNtqzC4f9deK8Umu3
 yjIUk4pPXtCdTiF+l9Ux4rpZ1dHh4NeHeFsrkPWaFzo+iSHkUJDRwuleM1OAfXcuHjdt
 tWt52vjaGQQzp020bL8pgTbuWZ5Zp9axKXMnqBBqKPxX7pTLEu2/tez4bbT+3xr/Yle/
 JGUWfylsph0fj1u7/sozqOZG9SgZdLpB2nPUlEdpnVNiqJvGKkfUT5lpR5fslpBM53sB
 Ngww==
X-Gm-Message-State: AOAM530P+wpc5BhDUhgB9hFn5c9EnI4ROYdN7IjFjH0vx67hcFgbqZVz
 bHtSME0vF0jkgU6NvoXVQYM=
X-Google-Smtp-Source: ABdhPJy68SUAYZ0bpLaP92GfB/pJTUnZSdqEDJSX08ka8I/8seYyspJxhxiKua38EfMe9YtemDlVTw==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr5074429wrs.19.1599674235124;
 Wed, 09 Sep 2020 10:57:15 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:14 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:56:57 +0300
Message-Id: <20200909175707.10670-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 00/10] Fanotify tests for v5.9
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Following are the tests that were used to develop the upcoming fanotify
features in v5.9.

The inotify/dnotify tests and fanotify09 test case are regression tests
for a mid series bug that has been fixed before the merge.

fanotify10 gets another set of test cases to catch yet another ignored
mask logic bug. The fix commit will be too hard to backport IMO, so
perhaps these test cases should go into a new test with .min_kver = "5.9".

Thanks,
Amir.

Amir Goldstein (10):
  syscalls/fanotify14: Test cases for FAN_REPORT_DFID_NAME
  syscalls/fanotify16: Adjust test to use FAN_REPORT_DFID_NAME
  syscalls/fanotify16: Test more event types with name
  syscalls/fanotify16: Add test cases more init flag combinations
  syscalls/fanotify16: Verify child fid info
  syscalls/fcntl: New test for F_NOTIFY (dnotify)
  syscalls/inotify: New test for watches on both parent and child
  syscalls/fanotify09: Add test case with parent and subdir marks
  syscalls/fanotify10: Test with group flag FAN_REPORT_NAME
  syscalls/fanotify10: Add test cases for merge with ignored mask on
    directory

 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/fanotify/fanotify.h |  29 +-
 .../kernel/syscalls/fanotify/fanotify09.c     |  57 ++--
 .../kernel/syscalls/fanotify/fanotify10.c     | 181 ++++++++---
 .../kernel/syscalls/fanotify/fanotify14.c     |  10 +-
 .../kernel/syscalls/fanotify/fanotify16.c     | 306 ++++++++++++++----
 testcases/kernel/syscalls/fcntl/fcntl38.c     |  96 ++++++
 testcases/kernel/syscalls/inotify/.gitignore  |   1 +
 testcases/kernel/syscalls/inotify/inotify10.c | 149 +++++++++
 9 files changed, 712 insertions(+), 120 deletions(-)
 create mode 100644 testcases/kernel/syscalls/fcntl/fcntl38.c
 create mode 100644 testcases/kernel/syscalls/inotify/inotify10.c

-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
