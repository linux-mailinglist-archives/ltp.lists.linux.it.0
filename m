Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A47E1D0AC1
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 10:23:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89BA93C54E6
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 10:23:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6E8923C2219
 for <ltp@lists.linux.it>; Wed, 13 May 2020 10:23:00 +0200 (CEST)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 261EB200AE0
 for <ltp@lists.linux.it>; Wed, 13 May 2020 10:23:00 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id f18so16743649lja.13
 for <ltp@lists.linux.it>; Wed, 13 May 2020 01:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7ADgcZTARO/qg323XzJ4/DK+SQ6Wu4si+2R77Da5wwQ=;
 b=KNVJcSsci8DEePTEjokjsJSKBC/Z02mirNG2MJcf3X59ZQAwXN/Df3TdaPASGHnbgm
 B/WLfsejso+gqFze/zoMsOEZsfsZGZCy2rLT/nDvI0rwaPr0KnDYyHJ7JmKpzjJjZMQ2
 oZX0fs0AaCrnVDaHE2iihlHaLqcsKrRpNl1I5iKmIgClxCjB+b2BobUDchPIsyBjWl8c
 7ysgURQPt1e2FkfbwDVTzZ+4cppCwA6Mr5jSMQkd0ph05g5kuJ9mwTKsXXv4iMY5B5Ts
 ye6lxZTrM+8LXONeTa7+jpM7nUSiFSDDTzgLYV4En2aVrlxMZvITG22516lTiZnTSeht
 FAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7ADgcZTARO/qg323XzJ4/DK+SQ6Wu4si+2R77Da5wwQ=;
 b=Jm2sYX6I8XVyfBwm3uUuZ2K5tyi7L+FAfEruAwzU0qTE2YXlh9YaVO6MmJJh2E3sM5
 CYneejARrNhjc1RfyeBmfbENx1nnfgzMKEdYYtjS7V7X1SVMZUSblGt3yHawyyT3hrlI
 2guvkv1Dl16de+P6Eghq5ZFR7N1Nwx0H/wbcBbk5E9MTvki9+L6GCcnrF6X3wPn+2mRu
 ehFbLBy6NHvIEXyhykiBp03rKWMxzkT2aXPmNfUjg7ZEGAL/NwKTRMMXW5oyRfTi3aWv
 AIQsaT6j67hm57X3BTG+7LjICjUVomCfXmVtvHAvEw/c8eobMp21WVP++ePDzfWpEIxN
 BApA==
X-Gm-Message-State: AOAM531mzFOVhyVtmSKDApsbJN15m9OygLSxhtTVj+ZlF/T9jGMQGkSM
 hA1unGLu3j44IyE9fNg4BBRWjETZdG5DTkEUsh1fjQ==
X-Google-Smtp-Source: ABdhPJxaEzC1BLrAsRIpU07Xo/t5C9EJPBnmYtVW4AD9Srl6I4WVpzPZerdEbudIkFAqZh7yMETj9w/Fn6NhufaO79A=
X-Received: by 2002:a2e:9455:: with SMTP id o21mr16636059ljh.245.1589358179342; 
 Wed, 13 May 2020 01:22:59 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 13 May 2020 13:52:47 +0530
Message-ID: <CA+G9fYsRUp8U_gMMjFD=6zHQZOHREvq+a9kj=6VK4LD1xHpMJA@mail.gmail.com>
To: Amir Goldstein <amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] LTP: fanotify09
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
Cc: LTP List <ltp@lists.linux.it>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test running fanotify09 resubmitted job
https://lkft.validation.linaro.org/scheduler/job/1428062
https://lkft.validation.linaro.org/scheduler/job/1428657

https://qa-reports.linaro.org/lkft/linux-stable-rc-4.4-oe/tests/ltp-syscalls-tests/fanotify09

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
