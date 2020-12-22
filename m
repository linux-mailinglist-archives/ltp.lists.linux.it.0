Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E92E05D4
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 06:49:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1A983C2998
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 06:49:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 153933C25D9
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 06:49:18 +0100 (CET)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DD22B200C7C
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 06:49:17 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id lj6so738301pjb.0
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 21:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=klQo68XAK+45uUn+o27qnV+eWqW/PbitHxvSGgxsS1E=;
 b=EwIXkBksT+hhR1RqmAWvY28Ye0QmFCKRlQf7YeXO89rh+EA8YX7qdQCnwwNI2i7HPM
 RXIrdRS4FiluWzsEfj1JMKcihwOrcjrLkvv6ElyfoSLguLVhXHzfKfkH2YhjSgYi6abQ
 8kt1+RSU1bEoZE7s7Nw1vM4IA1ojXjQowb7i/cAzvSEnj4Q5L6zOnTvYUlAGy1CYFa1Q
 qgrLWGvB8ZiIqRTtMpomkxb7PsW9z/Pe3e78p1DXfXmJBUODjtFrWzV7O5qMgqCV4LUr
 B9yR7JVbflcHOsF1okYxDV0Yf4u1yFE9NJJFnF7RWUNecrC+x5hmP5M+LNn31OhF5aEz
 F2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=klQo68XAK+45uUn+o27qnV+eWqW/PbitHxvSGgxsS1E=;
 b=Tzp9kt/gNSRkQOAzJLy9DXxrr/CUzVtHpNHP1vzKl9VvWBuLCt8Gb7BxlHVtyv1viz
 r/xde9BmzUMMcDCb+d5Y/2IIuj4GTwX1V1DIaZsFjEHlsPvqCZlN3dEmTKzA2tVCEYTC
 2fyndBl4qhon0g65PCVyrT7HQR0rSvqst9id9aYoAEROKcsd+YFllXf12A5oOGM3MZ/m
 p1T1l0qZ1Hd2IEriGJSSyiM+z/xYBITrWdZ4746wn7MHNO8/jb7LWQMsd1y6voMRyT9J
 2J1IC84uaubmEU1ygJWqfS28pQBkQDq+c9GQZ13c3RzR7pux0qRSl1R4lYjaKkaB/z7G
 XGdg==
X-Gm-Message-State: AOAM533n/dpHdmd8/rybAeAOZeFu+/c9h65Y9nAUx2NsJqRnqMUiJcPC
 1AbgoVP2Zgq6xCBTw5kb/1FLcXgh1mHcfQ==
X-Google-Smtp-Source: ABdhPJzVO5pQLhUa3O6OC2ps03Cg3N/mY5uSgDkSm8jkMcDfOKd2BVQDolmFGhEnx4qpQiZyx6qVLQ==
X-Received: by 2002:a17:90b:1945:: with SMTP id
 nk5mr20363304pjb.30.1608616156273; 
 Mon, 21 Dec 2020 21:49:16 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id t22sm18201068pgm.18.2020.12.21.21.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 21:49:15 -0800 (PST)
From: gengcixi@gmail.com
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz
Date: Tue, 22 Dec 2020 13:48:37 +0800
Message-Id: <20201222054841.736529-1-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] add compiled_module_files into gitignore
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
Cc: orsonzhai@gmail.com, Cixi Geng <cixi.geng1@unisoc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <cixi.geng1@unisoc.com>

*** BLURB HERE ***
Use Out-of-build-tree build ltp, When compile kernel module 
under these directories, some module-build-file wil generated.
add these files into .gitinore

Cixi Geng (4):
  delete_module: add gitignore file
  init_module: add gitignore file
  insmod:add gitignore files
  lsmod: add gitignore files

 testcases/commands/insmod/.gitignore               |  9 +++++++++
 testcases/commands/lsmod/.gitignore                |  9 +++++++++
 testcases/kernel/syscalls/delete_module/.gitignore | 11 +++++++++--
 testcases/kernel/syscalls/init_module/.gitignore   |  8 ++++++++
 4 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 testcases/commands/insmod/.gitignore
 create mode 100644 testcases/commands/lsmod/.gitignore

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
