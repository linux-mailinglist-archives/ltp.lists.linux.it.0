Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6493B8D4A
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:03:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 664413C8693
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:03:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1359B3C2A1C
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:03:23 +0200 (CEST)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A0F3E1401120
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:03:22 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id o5so8241155ejy.7
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 22:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g/6DI+6WEMGUS3GFqiI+UJHhR1LooMb4W5BFzYOK4Ko=;
 b=D6UXWVLpCS2PGN5f6MJA96gayy0CwJCsyEepHMdCO66KYSTdEtlgjSxdHO5o1xnSia
 +FBjXyQ4+2MP5i08rMi4i+B8iYEW3Rvv8RvJofaRkiXFFnD6ZCCf1+01IvkFtE4zo1lb
 M4Z3lfoaQICcnOAin3jtojLfJsASJGwACARulXDw5wvjSuHqRK9J91aOhVCcpgdyOscE
 XTDvczkFsw+4JzA0B3fog6hTHrAcXcA/lKqcEySgWHGqLs4Dj8OCW9pY2P8gJbmNYvTn
 bvi/7ViAjSPIBMxPwN+JpHkg/zj/CFOyEHT8UVVXwdFjHOJywY/1/mT6tvRS7EQgvAYL
 BajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g/6DI+6WEMGUS3GFqiI+UJHhR1LooMb4W5BFzYOK4Ko=;
 b=cfTGL48mVVlSzI57NHLrJotJd4cVw8TA7pXV8ulPSWZqo2n9Jj4mke0xpk1+082Wt5
 qVGeD1HZMUKBp/Ltx0Ir4Eo8DIUNTmcvWY34dZuJJjzNAEkeecSSArMEf7G+d/+ZfEkE
 jaK63cfu04E+iu44c9MkOQsuL+mENk5q4yyxAbF986uae/hqUVwj0lrU6lP8aJBkFwz5
 trlDQlOmw/4wSOUA5ncmQ6RQylIH9Tj5ajFxYzo3o/OTgZJebPIkOmDxNJveRyWwwqr0
 fR6MZNnqopf3k+LzOiEYYUzPtDoDo84wRiXi4WgU1ivj+wBElkJkfSLWG7WJw1riOemv
 sAjA==
X-Gm-Message-State: AOAM533VISIwKVVciR6QrvcQOKtXnLoDysvdt2UNZKGuCw6gC4ap97jW
 nzRdRR2ci4dwDNjLSoVN0VkKbKYdIbLlow==
X-Google-Smtp-Source: ABdhPJyJGfNjBPy9gL4lokR4GtSTwndGQGXnE1rd8w7nJ9WG0VBlVH2/MUclBFxeKBX3wOBCJvVhcw==
X-Received: by 2002:a17:906:2642:: with SMTP id
 i2mr21023327ejc.323.1625115802255; 
 Wed, 30 Jun 2021 22:03:22 -0700 (PDT)
Received: from localhost.localdomain (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id w24sm10319470ejk.58.2021.06.30.22.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 22:03:21 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu,  1 Jul 2021 07:03:12 +0200
Message-Id: <20210701050314.1005067-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] API tests cleanup
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Petr Vorel <pvorel@suse.cz>

Hi,

preparation for v4 test API cleanup.

Kind regards,
Petr

Petr Vorel (2):
  lib/tests: Rename test tst_print_result.c
  lib/tests: Rename test to tst_fuzzy_sync03.c

 lib/newlib_tests/.gitignore                       |  4 ++--
 lib/newlib_tests/Makefile                         |  4 ++--
 lib/newlib_tests/{test16.c => tst_fuzzy_sync03.c} |  0
 lib/newlib_tests/{test17.c => tst_print_result.c} | 10 ++++------
 4 files changed, 8 insertions(+), 10 deletions(-)
 rename lib/newlib_tests/{test16.c => tst_fuzzy_sync03.c} (100%)
 rename lib/newlib_tests/{test17.c => tst_print_result.c} (80%)

-- 
2.32.0.rc0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
