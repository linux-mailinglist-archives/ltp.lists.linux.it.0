Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A799CEF245
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 01:54:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39D4B3C250A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 01:54:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CD2B03C1CA4
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 01:53:55 +0100 (CET)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2FB8C1000412
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 01:53:55 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id 11so18859463wmk.0
 for <ltp@lists.linux.it>; Mon, 04 Nov 2019 16:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0hthbAxDtagGbn86y9oHROlaQkvvI0lQeOTYdK+Gjg0=;
 b=VLSZOMFf+0mAjYL1mDPaAnTALp6O1MhL+h0pGG50hBfgQbDnxDbhKShC8mSlqJHG3t
 FznOk9jPNOU6B7Rvi549pXOloIjSXn+bge8q8aGCdDgLRl5vjAGb5SXueEIMt3Ir9gTx
 +417QxNd+GTMDxuKf04GP1uG30H94GRLN0IhZHNepxRGQ3XN0vD6XhhpvRPsiDjNPbdq
 QdzdYtcrkM8Jd/6wf4OtKxW1xa0JkWoqReKXtXVJVFsTdz77ZG9Ijf3oVWWeHhSEJRsK
 1WEbf1c8wMdadni/8/DtSAUcj5pAVK49lj5v4jGMoQ4kHxVFxiERTN7/YTIiamwSQRj5
 qLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0hthbAxDtagGbn86y9oHROlaQkvvI0lQeOTYdK+Gjg0=;
 b=gN8KxbHWdxcsFusnj08EKv/NTX2BmWlSnognXRJr4g7buvq5JylFyByMZSSMN321vz
 OjgFPM91WpZ2pVyAumUk+w/EK1RkFVQrwAgkQibHH4rKblJWvrhsMZvcxVdqclSEDBi5
 s99NHBzxMaTpzV7O3RfIj6STnEV6LlcYhttVOuz+oAfbza7rNKvQCwVXxxhWSguV7xWF
 rLWpEwJw8pSsMUUytu0LPeU+qAEPvOlnQe4jC2B8D7kDc31v/h8j02eNfg2wl8jgsISw
 cw5KhfmO08vJl9Cshox4Pn49Hw4dYo4lceWgmUWHgmZqX9OE3NKJI7yBNWCQUug3mJIm
 8JZw==
X-Gm-Message-State: APjAAAWB/Pe3LNzDTwihrK9XVQKTskzImEfUZ21H87jw2LmhP/LqgeKe
 oFYqFgGZc0a0MKInHXqiQtmff75cwus=
X-Google-Smtp-Source: APXvYqzi4i5DVj/8OouomarHfD2KlKu9Ev6Nud5vYbx8CHrq6UUHVVMKunaPBa7EycCZRvfsNafu3A==
X-Received: by 2002:a05:600c:cd:: with SMTP id
 u13mr1578637wmm.133.1572915234451; 
 Mon, 04 Nov 2019 16:53:54 -0800 (PST)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id g69sm20002476wme.31.2019.11.04.16.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 16:53:53 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Tue,  5 Nov 2019 01:53:39 +0100
Message-Id: <20191105005341.19033-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0.rc2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] fanotify musl fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

2 fixes fanotify builds for musl. What I don't like on this solution is
mixing our lapi implementation with kernel and glibc sources.

Also, understand, if you don't want to put these workarounds just for
musl. Alternative would be to detect presence of
fanotify_event_info_fid.fsid.val with autotools and just TCONF with
TST_TEST_TCONF() if missing (+ revert b8aebc835).

https://travis-ci.org/pevik/ltp/builds/607410576

Kind regards,
Petr

Petr Vorel (2):
  fanotify: Move __kernel_fsid_t definition to correct place
  fanotify: Rename fanotify_event_info_fid struct

 testcases/kernel/syscalls/fanotify/fanotify.h | 22 +++++++++----------
 .../kernel/syscalls/fanotify/fanotify13.c     |  4 ++--
 .../kernel/syscalls/fanotify/fanotify15.c     |  4 ++--
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.24.0.rc2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
