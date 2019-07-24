Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA37C7367D
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 20:24:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 204E13C1D0C
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 20:24:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E653C3C13D8
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 20:23:56 +0200 (CEST)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 67E9C600A4D
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 20:23:56 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id z1so47979220wru.13
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8v6vcPSs5+bMoShur69VDemvcoZ58MoKcocF2F72s1A=;
 b=cEs3K/c47iOCV+rF5RhFK55A9wZCsTWgDoHfJj5rZzlErMULRozFWGBVGOZJzm1Ouk
 m2DCKNnbc7BeCmVuSuUB+Br/RaE89cYYOSepGC/05vIMnDniU3l2ajwVP9R7SGLXbJQW
 qXubmpUvSJ0rJ8rSgsbvzt9hCohTTjvWsGLDKpMYygByPnmEg1C502cnS71+1tBxP7bp
 ciR9riNLWIIuUALn7tb5ZFNbcCf5b8uyLJ6QkhWaxkmM7Lpqe7vdxM0KFeS53cC16uW8
 4U38CPWPOzpYsXUcO03J7lIcELi0g80MfN0NXajEp83ZM6zqFIYXDjlIMouPsRxS9YGc
 BBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8v6vcPSs5+bMoShur69VDemvcoZ58MoKcocF2F72s1A=;
 b=j3ysrAnn9ZgPLaX4rapnm9+4NikIVLIRfB76dDHolJtsCkh/XCzqpBxVrCxZSCdItS
 NQ0n0LZJ3g8N3ctHYlGmtDQnwN7tWHckkzSVS70H+BpE70pb17Uq7G8+le4R5Rgy4hMv
 nOdj4USkrNLrhZVTJydYjClao6pRRCP9SG7DrjMBWus7N2+LpF4q++YZv1HiBAqpEvXs
 2qw1tRGVj/2VXZF729hSp4Nz5BrgMYgMpBRSwjG8TwuFp9uxW6kVTr2ngHS4UPx34zi0
 m8inB90tmElWKSc5r9drQooHduZtP/FtPQ0rrGbrsZlFuIt8RdAoq5I1pQXdciHyTwD/
 6mQg==
X-Gm-Message-State: APjAAAWivfG1B+7U7EnQj5f67+/g7Ke4tTKi+iLY7BFH3frMTTcLomgV
 5DeMH01qzf6tAJWuCxxYSB/XQde0
X-Google-Smtp-Source: APXvYqwFcN8jH3lYkg4PpWTeWVuO1sjrgr8bOF17hfEg/FzKOkyRBXn1iyGSFyNxzuxX7v+Y7AWkOg==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr51856726wrw.178.1563992635843; 
 Wed, 24 Jul 2019 11:23:55 -0700 (PDT)
Received: from localhost.localdomain (static-46-238-236-44.awacom.net.
 [46.238.236.44])
 by smtp.gmail.com with ESMTPSA id o6sm90944429wra.27.2019.07.24.11.23.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 Jul 2019 11:23:55 -0700 (PDT)
From: Piotr Gawel <piotr.krzysztof.gawel@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 24 Jul 2019 20:23:42 +0200
Message-Id: <1563992624-4968-1-git-send-email-piotr.krzysztof.gawel@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_timer fixes
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
Cc: piotr.krzysztof.gawel@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello LTP community,

As requested, I've split my previous patch into two and resigned
from third change (hardening).
Please review these patches and add them to main stream.

Kind regards,
Piotr

Piotr Gawel (2):
  tst_timer: fix qsort comparison function
  tst_timer: fix verification of execution time

 lib/tst_timer_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
