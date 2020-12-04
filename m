Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B82CEB82
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 10:59:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 623F83C58EB
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 10:59:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A0A883C2B71
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:34 +0100 (CET)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EC341600708
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:33 +0100 (CET)
Received: by mail-ej1-x641.google.com with SMTP id ce23so4047870ejb.8
 for <ltp@lists.linux.it>; Fri, 04 Dec 2020 01:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cDFb2HS+Tf8BLH41MN9xo1TPs2Ty1mu7Nm37nwKGwsE=;
 b=uq0wiqM7ZrBj/aubyUKQA/i/8tGdAuDIHzNUvoD/ovBPSEyHFXpCpQNkusM1ASoB5f
 bBKzoMarEWvIhTjPq9GxubLZjvmFxkMsDlrCmL5BnnKdTGKvS9MF/Qb0/RNNYSswFeJs
 9kClSfURhDNfKdvIaTXlHJkzL5o0P8k5ct8/QNnMb3erzJ5QiXIjCOjsDgNqmew2QTQj
 JKbmQDO2Rsg5du1nKLj/sBhR1OPmhLH65yEpZzSWCeTBmPNxLURt5WXcZTEYmRSM2uBa
 PtLozp4epjWoFdqNjcgBTDUytZO1loY1LAJKvD2r6hk+t2+EgUogCsM833FLD2mG7y4N
 +rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cDFb2HS+Tf8BLH41MN9xo1TPs2Ty1mu7Nm37nwKGwsE=;
 b=rwAundKLLCJCfaNJMueXHiBLwN9wKtFjT1na95zrAs6l90YesMKq7I4rMP4CryT5Uv
 f6CyPuxVnjrB9mLH5Whe1jAhfOCO1zEuWzaLfgrCAHTkQKYlUc8zVlahT8z04sFTbQKJ
 gWhjp1yJzH+7C1MTEUKmhUWw+/sWJLns+ci3s+ZHKtz1QmWf8cd7XySCPguEXTFmFUGK
 6Rt/I0Mj8NRbNbubrbB6n8/4u03D4EEqiH+NkFoTRm+wovvpLVbr+65kjQ4PJkwlnkOU
 sUD2qH1BTsXZiGh72O3IKjQv45ZXOJoRXJdKuWMq7o5qCyrlupV0MSZbWIyFvkc7yPOV
 DqKw==
X-Gm-Message-State: AOAM531XJhQkrzY4trmPU0Z4DGKfPFtOR1j8ygE7Ra8fOhO5KK9h5ei5
 ownrWqsKnd7wFSGep/mjE04=
X-Google-Smtp-Source: ABdhPJxWmicpwRzr3zR75JqAoS5GjadLg1k8IFm08iyT/U933Rnsw4fsnWBy7R5OPeKG2fTdTHVZaw==
X-Received: by 2002:a17:906:ae41:: with SMTP id
 lf1mr6455195ejb.369.1607075973601; 
 Fri, 04 Dec 2020 01:59:33 -0800 (PST)
Received: from localhost.localdomain ([31.210.181.203])
 by smtp.gmail.com with ESMTPSA id qp16sm2701811ejb.74.2020.12.04.01.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:59:32 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri,  4 Dec 2020 11:59:25 +0200
Message-Id: <20201204095930.866421-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/5] Fanotify cleanup and test for v5.9 regression
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Here are my followup patches to your great cleanup and
a new test for a bug fix that is already included in v5.9.y.

Note that I resurrected the helper from your V5 patches that
you turned into a macro following Cyril's comment.
I hope you both find the result satisfying.

There are no direct calls to fanotify_init() after those
cleanups (except for the intended use in fanotify14).

FYI, I have another test (inotify) for another v5.9 regression.
The fix is queued for upstream, but did reach upstream yet, so
I will post that test later.

Thanks,
Amir.

Amir Goldstein (5):
  syscalls/fanotify: Generalize check for FAN_REPORT_FID support
  syscalls/fanotify: Use generic checks for fanotify_init flags
  syscalls/fanotify09: Read variable length events
  syscalls/fanotify09: Add test case with two non-dir children
  syscalls/fanotify09: Add test case for events with filename info

 testcases/kernel/syscalls/fanotify/fanotify.h |  46 +++--
 .../kernel/syscalls/fanotify/fanotify01.c     |   4 +-
 .../kernel/syscalls/fanotify/fanotify09.c     | 167 +++++++++++++-----
 .../kernel/syscalls/fanotify/fanotify10.c     |  26 ++-
 .../kernel/syscalls/fanotify/fanotify11.c     |  21 +--
 .../kernel/syscalls/fanotify/fanotify13.c     |   2 +-
 .../kernel/syscalls/fanotify/fanotify15.c     |   2 +-
 .../kernel/syscalls/fanotify/fanotify16.c     |  14 +-
 8 files changed, 180 insertions(+), 102 deletions(-)

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
