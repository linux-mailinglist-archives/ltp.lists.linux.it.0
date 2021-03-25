Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6B034995D
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 19:19:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E39BC3C2817
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 19:19:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id BDC623C27EB
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:19:52 +0100 (CET)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7DC5D601BC6
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:19:52 +0100 (CET)
Received: by mail-pf1-x430.google.com with SMTP id h3so2879858pfr.12
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUQ7ScTZUxjcBvTgQSmBkCxQef2fmyGH8cjH/R7495E=;
 b=Ws6w0AIsc/XnDdJTwXINU+bZ2EoUI40EtTGbSxfqo27j9+M/8iITJOeVtQk29kqfew
 ynnlVJYBKVsBHNg1k2NSf4fnSYiH8KY21YIUrQ+WNseLPUlvu5OUismIh1BUMyGjRPw3
 Oof3NSplOqdkwg/QXVfRqnfbwjKSede8VeB2A16deHajbLVQZpurJM+cwGcFvNvjWhJj
 rRZce6XaIBbDT8BztM8eIgTx7rDby1+SReV4g9xOwrUXVviVDXbYTp2FuwpFwAiC5QF5
 y6M/j5kezvaVknejLafwbuHQsYog1WKSC2ssPSIibGVih1Zap8eA1EyDqYVHf9GPekcI
 Vp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUQ7ScTZUxjcBvTgQSmBkCxQef2fmyGH8cjH/R7495E=;
 b=HXgqzzYJxmkJUfbMfVdH3weSG34/xv99XkkQvUZKMfew1o25kcLynVuIiqhen+hqHR
 YSYMNpsFopRNm31TEe35+8GK6YaQ77IouJaixMxy7JK0T13RejGvMnZW9XeyEGiOTHTd
 DgNYb/gJhMPOHjpwYSrCH4GVqh/v7uZf6sab2IX0L0dz4eg21vvIdrdHXa5MSFNPf5Nc
 uPFIIVMFFoNlXcZM3xqF4iD+3/vj1ZrxoZLtvUWtwQCC91A1idVWZgfpqaLRDLdnjcSQ
 xEPuAGz0WOi87CX5+SL4XhDlsaKc1Qed3I+BdzoLAb+hcqGJ3I0idvMFjAjaAVJaicVM
 7yDA==
X-Gm-Message-State: AOAM5307JEGb6n2LMNfJ2E995bFtfnFG92Uw87xXaSV/MtGTP6gatQ1h
 ZtOTr62xWuSXcrr3l+wmVKNWWdVzDQQ=
X-Google-Smtp-Source: ABdhPJwcR0u4sUuxWqD340ZwsPvvxh/cabK4aHOeIi7U3tS3/vMS2TeqlO9NNJbW4pPLsvWAl51Jbw==
X-Received: by 2002:a17:902:ea0d:b029:e6:f01d:9db5 with SMTP id
 s13-20020a170902ea0db02900e6f01d9db5mr11000807plg.60.1616696390237; 
 Thu, 25 Mar 2021 11:19:50 -0700 (PDT)
Received: from localhost.localdomain (softbank126008192101.bbtec.net.
 [126.8.192.101])
 by smtp.gmail.com with ESMTPSA id i20sm5977597pgg.65.2021.03.25.11.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 11:19:49 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Fri, 26 Mar 2021 03:19:02 +0900
Message-Id: <20210325181906.40688-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] Convert swapon/swapon0{1..3} to the new API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: QI Fuli <qi.fuli@fujitsu.com>

Convert syscalls/swapon/swapon0{1..3} to the new API

QI Fuli (4):
  libs/libltpswap: Rename and Convert libs/libltpswapon to the new API
  syscalls/swapon/swapon01: Convert swapon01 to the new API
  syscalls/swapon/swapon02: Convert swapon02 to the new API
  syscalls/swapon/swapon03: Convert swapon03 to the new API

 include/libswap.h                           |  24 +++
 libs/libltpswap/Makefile                    |  12 ++
 libs/libltpswap/libswap.c                   |  63 ++++++
 testcases/kernel/syscalls/swapon/Makefile   |   4 +-
 testcases/kernel/syscalls/swapon/swapon01.c |  83 ++-----
 testcases/kernel/syscalls/swapon/swapon02.c | 145 +++++--------
 testcases/kernel/syscalls/swapon/swapon03.c | 227 ++++++++------------
 7 files changed, 258 insertions(+), 300 deletions(-)
 create mode 100644 include/libswap.h
 create mode 100644 libs/libltpswap/Makefile
 create mode 100644 libs/libltpswap/libswap.c

--
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
