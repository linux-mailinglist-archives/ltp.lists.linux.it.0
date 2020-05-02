Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5B1C26F5
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 18:27:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D22A33C5909
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 18:27:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 070193C269D
 for <ltp@lists.linux.it>; Sat,  2 May 2020 18:27:51 +0200 (CEST)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5D8036008C5
 for <ltp@lists.linux.it>; Sat,  2 May 2020 18:27:51 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id x25so3445311wmc.0
 for <ltp@lists.linux.it>; Sat, 02 May 2020 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Blojy4cV75r2Su9/7OI5abW2oAoTVeTyofs0J0gJWXI=;
 b=uCrzNKyf0RLNaFlDJmYOM0p/kz3biGIL60sb6zplqua/jp1YO/ONwZObn12IZPoTbA
 A7HQaMABt9WZGGZenNZC+tCQD9zQWSLX4qxatB+98Z2wglIn/cFabmn0N9X0KANSN0lg
 cJdWa4lrmhBaKB4ECY2Y87C0a5+caredwZQy55U2qsTR27EY7BUPYAtgUud2Mr9PiS9T
 6IIhe2ODFdISN2fmZGtw7oq3rTOW2626BEbXTRmCDRz/VNS0CVl087yf/7AtvBFrC8aR
 8xhLkIQAbp9RBRAuObtU7855TaIngnCudfRVcDAYxignp7FYbNWEkXtxguOP8lXbdE8/
 SJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Blojy4cV75r2Su9/7OI5abW2oAoTVeTyofs0J0gJWXI=;
 b=bylWtLsQZGPR3bqnHX2FwDDrdGCtAN1EF0NGGrvrbi4z9k/KJDhq/pyTvndKLxs+rC
 +DpO9hkzb1AICJE1vFGsj6Wx0bYZUL7jvIznKlxZzhhvQ/CQE/qA7P/jqmBAA6OFl1v6
 7QufWigPgT1QEjcSyNNSqwVSWKHvCqDb2M4Xjv3axavOwV1KwGLI0KoiTVEFPRFdHPRN
 58YoEPB06oRuzQyh8vcyyeNJ3l19yD5zhDaYw29exBrthIMs9G6VFHBAv/X1h+5hcQg8
 WbyHF3lrfupHZ2Qq1yXMR+w1lxzIAln615CxKVe/L84H99otE+XRVG1gNhlD5+oyR+Mv
 j7wQ==
X-Gm-Message-State: AGi0PuYDND+DBb9MJZn1AA8HOoQ2GffwKO2KRyICn9M5PyJOsFTE/idq
 e+zHxGNug8mOlBaFC2vJU+Y=
X-Google-Smtp-Source: APiQypLF8atBTAsNMzIyAZMya08uX08Urf2rbUt7DMfH1nj/tArWLF3oejwrxc9F8WJeck0jyxYvLw==
X-Received: by 2002:a1c:bc02:: with SMTP id m2mr5209227wmf.60.1588436870923;
 Sat, 02 May 2020 09:27:50 -0700 (PDT)
Received: from localhost.localdomain ([141.226.12.123])
 by smtp.gmail.com with ESMTPSA id n6sm10683053wrs.81.2020.05.02.09.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 09:27:50 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Sat,  2 May 2020 19:27:40 +0300
Message-Id: <20200502162744.9589-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/4] fanotify ltp tests for v5.7-rc1
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Following patches test fanotify kernel code merged to v5.7-rc1.

Changes since v1:
- Patch to fanotify09 has already been merged
- Addressed comments by Petr, Cyril, Matthew and added reviewed-by
- Added patch to use new helper fanotify_save_fid by other tests

Patch 3 adds a new test for the new event type FAN_MODIFY_DIR, which
carries a new event format (parent fid + name).
The man page patches for FAN_MODIFY_DIR have already been merged.

Thanks all for the review,
Amir.

Amir Goldstein (4):
  syscalls/fanotify15: Minor corrections
  syscalls/fanotify15: Add a test case for inode marks
  syscalls/fanotify: New test for FAN_MODIFY_DIR
  syscalls/fanotify: Use fanotify_save_fid() helper

 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/fanotify/.gitignore |   1 +
 testcases/kernel/syscalls/fanotify/fanotify.h |  36 +-
 .../kernel/syscalls/fanotify/fanotify13.c     |  44 +-
 .../kernel/syscalls/fanotify/fanotify15.c     | 191 ++++++---
 .../kernel/syscalls/fanotify/fanotify16.c     | 403 ++++++++++++++++++
 6 files changed, 596 insertions(+), 80 deletions(-)
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify16.c

-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
