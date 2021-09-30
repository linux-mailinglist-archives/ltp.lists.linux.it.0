Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1228641E132
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Sep 2021 20:31:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6B423C962E
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Sep 2021 20:31:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8D3613C8E9D
 for <ltp@lists.linux.it>; Thu, 30 Sep 2021 20:31:26 +0200 (CEST)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F144260115A
 for <ltp@lists.linux.it>; Thu, 30 Sep 2021 20:31:25 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so9212577wmb.3
 for <ltp@lists.linux.it>; Thu, 30 Sep 2021 11:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lqf3P5NXbHWNunzlAWuHxNqsTTLiD1OwbFaNvROLfL0=;
 b=q1Eu7w21AwSYXZxJn2lT2ZwzhdNyZRPOxnyL4N9/nd+7vJVVq74MzeFC/Z83iEV3ns
 K0J2RzEDxubgXq6cZddBJsfsoxq5nvf+sr/OGEn6kfBinQEYG+XNs4cHRaA+icWi0ru9
 ouLhqUYSLyRSx2MFfng3EhrM2zV/+3iZYaCDnyreAjbsTWHowf9RJ3lr054RT1q+pLV5
 PlyQ9xUWwfplu6NI4Ld0oK1pa8c6j6m5KWpEIPa7jvIL5ycNlii+6Xc+EwcFbVWVT4AJ
 WObYEywb2DnT6xAiiW2hITjWFPX5q+KzCID4PhqccGoAGkn0t7rT9bO3a4quKwVIizgd
 5Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lqf3P5NXbHWNunzlAWuHxNqsTTLiD1OwbFaNvROLfL0=;
 b=DzuktP17svlqcNyZrmjVSGQgxs8D0ue5gqnT6VR08Fx106yRSizgdFnUOimtS0ZYQl
 etM0FiUelxC+b1yEUblzSxXI3V9N3EBidZtoFsFKmOgH/RhCjJE+r0k3GBdVliL7cHDh
 XYpFegUMjJxCgECV/f5J4wB/ZkCKQGFw0GGg2036vcVR8xaqeh5ynx5N5Kv6OZgXtdkw
 gxTohiHANWYLmipmB2WrTMAMWTmjBlNreYe4Sm5VE50T7+lRLrCj24KFyTYOR3Qviu5W
 gmomJuUaZgWXF+lDKKvihio2y3/Wb2rsJ1DHtRxaHPRFUK1evz2vYTRDsMmME35fWaV9
 HiFg==
X-Gm-Message-State: AOAM530GpVz4rJBde6Kvvbz5q7dlDykXM4MLyY/Oz1Tb5s45tzrpSTE5
 5XRe0PS3zEA/A55wCb6wTN8T8WRYD5E=
X-Google-Smtp-Source: ABdhPJxyEOz2QhEHB+0DeigyWBMahyt4wCqx5/70GK3dLk4fDeTi6LJYZ8qdM7YgRaD/sl+72jzpKA==
X-Received: by 2002:a05:600c:a0b:: with SMTP id
 z11mr687984wmp.147.1633026685537; 
 Thu, 30 Sep 2021 11:31:25 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id c9sm5767996wmb.41.2021.09.30.11.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:31:24 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 30 Sep 2021 20:30:55 +0200
Message-Id: <20210930183058.5240-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 0/3] Fix old toolchain (< v3.14)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

NOTE: this fix (3rd commit) is needed obviously due very old toolchain
(sourcery-arm from Buildroot). I suppose it's still used, but can
anybody from Buildroot confirm this?

Kind regards,
Petr

changes v1->v2:
* fixing moving IFA_FLAGS from lapi/rtnetlink.h to lapi/if_addr.h
  (it was by accident done in 2 commits)
* new commit tst_netdevice.c: Drop redundant include

Petr Vorel (3):
  tst_netdevice.c: Drop redundant include
  lapi: Create if_addr.h and reuse it in rtnetlink.h
  lapi/if_addr.h: Define IFA_FLAGS

 include/lapi/if_addr.h            | 19 +++++++++++++++++++
 include/lapi/rtnetlink.h          |  5 +----
 lib/tst_netdevice.c               |  1 -
 testcases/cve/icmp_rate_limit01.c |  3 ++-
 4 files changed, 22 insertions(+), 6 deletions(-)
 create mode 100644 include/lapi/if_addr.h

-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
