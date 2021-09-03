Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6983FFA6E
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 08:33:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C10FB3C939A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 08:33:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 619F63C2841
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 08:33:40 +0200 (CEST)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B333C20091F
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 08:33:39 +0200 (CEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so5527900otf.2
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 23:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CZmquEey+ivmWQfqvVXAMOxIVHySftmMJu0eH7KpBsM=;
 b=lALXYT8/wD0vptBeYjL//9mEV79ZLkaV4OgqkyFyEuoC30kDYXeCfhck4KTAJAfGzc
 Wlu9a2rcP5tCGwpXd0X1ursyNRspNQ1wtAznXLf3511vyMInP9De/axC+b7pqtzg+0W9
 LCesnm+s/n/piKJooElCANbwZhbLaBJTifqnfOkcgexQ7hT5CLDgB6mmSL2xxve53jiR
 rUxzZ7O5gAZl5dpPOceFiE1f6YeZ7zsDKRLMjSH3hJItsCo0BNfgkwXswDyO9D+HDITn
 Nq3ziaqHT0BavZtHa547XuCsXjf6jp8fybEqN5PROSha8wYjJlA+PscKBvsLqCHt37Uf
 3PXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CZmquEey+ivmWQfqvVXAMOxIVHySftmMJu0eH7KpBsM=;
 b=gIPdJ0g7udWRHoANeP5ft25evtlh6/YxkLx61laJ2eMKCC5LIq68EnO8AHZJFZDuVR
 L/43rFuJqt3HmtH/jQRdAPIo66E/i9ja0dIOMYqWSAdouVO/+b/VCOGLKoAMZgNxorz2
 KyYwkKs389jXECYDYRsvFbHc2jEGOlTt1uNZ5gspp2qhl8N04sRwOaIE7OZOpylScyTX
 dIBuRS10cZejTM8wgyIBR5bpgRY1n7ws4VLfGyVErS3PXhMDyh1atg+VHPXkXN6dotEv
 BTXEMDCRGal6xSy3akq/tAli1f1B6VByTVdK1B/hEKCNFh7cdfVBMRi0/niAHZDZPPV4
 ZlqQ==
X-Gm-Message-State: AOAM530F7loQEbSWkYs/rtGgend+RQPSKUZ3avNUgF/s6PMSljEykLxb
 coe0umNh86PKK5z0lY0tGg/RFhzNk6j+CeYPPJghyxZKYi92YLE+
X-Google-Smtp-Source: ABdhPJyaKSI1sKDikz0mxgYSFanocRpjqa0bxU5TCjMhbna+Gdn1zcz5wXEMALVQM78TvxrvwxCmH1NnRkSxFqi8mfA=
X-Received: by 2002:a05:6830:2143:: with SMTP id
 r3mr1775965otd.266.1630650817524; 
 Thu, 02 Sep 2021 23:33:37 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 3 Sep 2021 12:03:26 +0530
Message-ID: <CA+G9fYtJYK4C4q7v2VBgyHe1EdOeZ=auEytoKJr0gYThj8gS5w@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] LTP: smoketest: route4-change-dst fails intermittently
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

LTP smoketest  "route4-change-dst" fails intermittently on various
devices and qemu.
We do not want any intermittent failures on LTP smoketest.
Shall i send a patch to delete this test case from runtest/smoketest ?

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
