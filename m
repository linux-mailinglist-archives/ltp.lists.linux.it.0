Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A87F1E1DAC
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 10:54:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BEBE3C3270
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 10:54:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 315033C02C2
 for <ltp@lists.linux.it>; Tue, 26 May 2020 10:54:21 +0200 (CEST)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 866121400521
 for <ltp@lists.linux.it>; Tue, 26 May 2020 10:54:20 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id q11so7436612wrp.3
 for <ltp@lists.linux.it>; Tue, 26 May 2020 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=YXl5da3zQus/ytyzlrnSUA1nYkeQGrBGe+DyxWixDiM=;
 b=cQ3L1r2mybHZwkhCK2s7p+GDEUeG/3D7y1QtBZkrqqyoZ4YMq30ihuxCKOIszPhvjx
 OCrtAmKOqy5X29KjMU1bKR5uXpnrws42KeScq7V9gA6B8BawHhk6X0aMvvyfrPeboWCm
 yBX7fLZKDSq3DGSJXqMMTz3NQYxu05LHDLYCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=YXl5da3zQus/ytyzlrnSUA1nYkeQGrBGe+DyxWixDiM=;
 b=FkXhPEZtDKz3S9JrmTZ2AAj6ltH5POyYn2YHdTxticeHlTNXjYpcMSx1KBUHodPWeL
 i/2pTGBEitAqP1Ok+Nsa1mO1dQL4zukNeSHPMkOjoub6CyJPlBGE4dvVUH+wbMP8dzI3
 +tGROCU2smC54z2gBPhHQvi3JyBVJ2gD8HaoCVHy/rnCGoa4izNPPIvn0PrByGYJmu6D
 nYOvrZLbWiFAazQHv/gZV/ryeAxVNI9gXIbh4MaBSUunnMl4wD8qSUpGXCRp7VScf+dS
 +CqO3LMvdUMr0uU1lrKBzG5Djc24Ou76lxFaJkTtmd2HUK37kNMbVpbpQ0zL5/hEi7Qs
 lwoA==
X-Gm-Message-State: AOAM532Ff1bwAvE04Shp7zj5wfo8NkigQy0u6ts/fZXQj7iTKrKF+zQY
 y5g+XGijH3VUtPto0xglNQw1n+v0WUE=
X-Google-Smtp-Source: ABdhPJy1pUBPc1LJ8rqiHVZCGdF0Hp8ATkwolXdphI+tBtpssU9dbVnYIR0UgVhuQ1mOJm5IauuO9g==
X-Received: by 2002:adf:db46:: with SMTP id f6mr19267637wrj.80.1590483259600; 
 Tue, 26 May 2020 01:54:19 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
 by smtp.gmail.com with ESMTPSA id n17sm20410188wrr.42.2020.05.26.01.54.18
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 01:54:18 -0700 (PDT)
Message-ID: <64a5e1c5c8041679e3024b564f2c67ace779c110.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ltp@lists.linux.it
Date: Tue, 26 May 2020 09:54:17 +0100
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] Memory requirements for ltp
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

I work on the Yocto Project and we run ltp tests as part of our testing
infrastructure. We're having problems where the tests hang during
execution and are trying to figure out why as this is disruptive.

It appears to be the controllers tests which hang. Its also clear we
are running the tests on a system with too little memory (512MB) as
there is OOM killer activity all over the logs (as well as errors from
missing tools like nice, bc, gdb, ifconfig and others).

I did dump all the logs and output I could find into a bug for tracking
purposes, https://bugzilla.yoctoproject.org/show_bug.cgi?id=13802

Petr tells me SUSE use 4GB for QEMU, does anyone have any other
boundaries on what works/doesn't work?

Other questions that come to mind:

Could/should ltp test for the tools it uses up front?
Are there any particular tests we should avoid as they are known to be
unreliable?

The ones we're currently running are:

"math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty",
"containers", "controllers", 
"filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands",
"net.ipv6_lib", "input",
"fs_perms_simple", "fs", "fsx", "fs_bind"

someone suggested I should just remove controllers but I'm not sure
that is the best way forward.

I will test with more memory (not sure how much yet) but I'd welcome
more data if anyone has any.

Cheers,

Richard


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
