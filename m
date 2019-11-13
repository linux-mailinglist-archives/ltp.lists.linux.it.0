Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A5F9FA3
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 01:56:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B40D3C24F5
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 01:56:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8E4F83C2453
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 01:56:41 +0100 (CET)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 638F81400DD0
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 01:56:37 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id c22so154257wmd.1
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 16:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+7vX38NEuBCCAWK7GpaUabfCK5XZAJy++POUY95BRs=;
 b=Sbx/gor+UNQsnStnij5C+K8q8/sFR3a7EH3SIuFUglIbyTyH/nzriQueFS6bMRNLjs
 DY+4Oy1VC1ruo9KyEH3GRSi4jLLogmfDYEUeP/PHBM0wrnF0Z48SadNqLQoncE8PJyW/
 L+9tCheXAjCP1gsfRqPPQX1CNlHdyspdNtzPlLUrWWtKargjDCkV4K7dL9IKoCCALuWL
 NQ4b+5XFWgGspa1AYmrCGHnLGyTogkNick3EWWHxV01gxQV1PUOz/QfRUSeCkabsrs7S
 eePgJ+6jSQu2kV8BuB/cXUJt3ouV5Vg17KKAwln5If6KbLzjHhRk07C4tFeK5p/ddTD4
 5Chw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+7vX38NEuBCCAWK7GpaUabfCK5XZAJy++POUY95BRs=;
 b=gKEZnirQ6jQIoxlYjxKY/L7wffSRCB84SLjSYrqWEFnaBly90Wul7BURIukcoz79vV
 ldBp50XQ27wwwVpqwcMS1zQgA0JDoosL22ahvASgo4GFToDkkln3o+pWZQDUMFYOfdvb
 c4QDTnQHBdXahukL8W4aUl5ktTgXVt+hud8GXP1io8esO0jhtQUz5vqMstDXUzxHSq7H
 ck0XHzleowLRt1Zno28RrZwnS0/xgwc0OFW5VCM0nF4kgzIuPquMUtVeUCiXaZAQSYTe
 YsoplIdrRLxO2d0re4g2Hg5QfOn71oD9OXZmAOVEnNQu4FUWyxCXWxeVfaOpwBjqPXHT
 wtCw==
X-Gm-Message-State: APjAAAXcyOxTs4Lev1Hv1lPLbO4pzQZjOGqLFYhGBr+rW579r5tfeynx
 Z/qvHpZTXSRgJWItp1/FHR7nMhlJ
X-Google-Smtp-Source: APXvYqyTzSRdiISO4DM3e+ZpfffRZ9SR6yOP4soFABPH2PMENKU5YiZfeiawiaiSkta5esHDNOxKGw==
X-Received: by 2002:a1c:610b:: with SMTP id v11mr248912wmb.156.1573606596465; 
 Tue, 12 Nov 2019 16:56:36 -0800 (PST)
Received: from x230.suse.cz ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id z4sm431546wmf.36.2019.11.12.16.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 16:56:35 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 13 Nov 2019 01:56:23 +0100
Message-Id: <20191113005626.19585-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/3] fanotify musl fixes
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
Cc: Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I generalized previous patch set a bit via autotools checks and also add
other cleanup (base decisions whether to define fallback definitions on
autotools checks).

BTW I tempted to use <linux/fanotify.h>, but not only we'd have to
define fanotify_mark(), but we'd also lost libc header testing.

https://travis-ci.org/pevik/ltp/builds/611138280
(openSUSE Tumbleweed failure is not related to this change)

Kind regards,
Petr

Petr Vorel (3):
  fanotify: Move __kernel_fsid_t definition to correct place
  fanotify: Rework checks for fallback definitions
  fanotify: Detect val vs. __val fanotify_event_info_fid.fsid member

 configure.ac                                  |  1 +
 m4/ltp-fanotify.m4                            |  8 +++++
 testcases/kernel/syscalls/fanotify/fanotify.h | 32 ++++++++++++-------
 .../kernel/syscalls/fanotify/fanotify13.c     |  8 ++---
 .../kernel/syscalls/fanotify/fanotify15.c     |  4 +--
 5 files changed, 35 insertions(+), 18 deletions(-)
 create mode 100644 m4/ltp-fanotify.m4

-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
