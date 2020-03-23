Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D9119017E
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 00:03:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97F193C4E54
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 00:03:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D45F23C0796
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 00:03:09 +0100 (CET)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D6702600A49
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 00:03:08 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id b2so19228478wrj.10
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 16:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=KI+HwN4pYozCPAUAZAlH+FrSwEyrI4hnz9Jdb0y+/W0=;
 b=U2HkoDg4Q/f+MdRleJK7DM5b8M9dHQjkCfsdIaht6IuH9BkAJYubKQg+rl4ypE3s5t
 1nSrlW4k/Q64XMGdG2l5i3HT6tze9FIAvcznNHPpD/0vCE4YwBSsssetcjdLbWzjjjRv
 vPxISf01KcouP6xfE+ynOoeC4p34KoMd7hq3hkEjbgYjHg1PAbezoeYN9/tRZf0tWrI+
 i83mPdCNC2O6pVbdLd16NUnUYYt8iOSneyS8+xFpJrlOPhU1DNs2qEO6tzoBqRuscQRt
 lnYQSGKFMyh/PWeBeQII6eOQdPuNtZx/q4z1ZsVT7Aq/KJFRnip0KGeHJ/atBMdpyYXy
 rpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=KI+HwN4pYozCPAUAZAlH+FrSwEyrI4hnz9Jdb0y+/W0=;
 b=I/HzVZYnQ1Ke3d71uj7+Xm18jMhAhKQLKTLpYiUP7k1WFjfxMjs3kptG/z6za/dORl
 jaELxtpGP6pOQJtLPf7y6q1Zju7MwwOVmLn1sQQscmx2PaKLwW5A8omlQRKadCVa5I2B
 AvsGkX/UcMPBgf0TL8zCJaaPEn7ylymeJFcxR823I/21BA7x8LuYqhyCQh/mJMjjaBOw
 nLF+xJbgxo2FKZn0SbYDKcr2xIS8sqxz5Hlw0iF/kuTi9crp5t8yWRfaQrZTl3Vq1CTf
 ara4GK5K+GWQeTTWNDnTTYK4o+fQyuhiN8MYP96KSOhu9FMW4+JkG6ulQBNIAGMvaqgX
 2LwQ==
X-Gm-Message-State: ANhLgQ2gBVKuTYJuEUXwi5SM+cESIYrrc8uZE6vLhp8OIL/PjhkX37j5
 852BAhSXzuJmYpw+hM9P0Nu63Q2p
X-Google-Smtp-Source: ADFU+vvlRqhSDYxouxRrm1DS2ZauXAcat34KWgi4QH9DPbo4hAsRDq9Eg5f1Qm19417OhHzcnLXv9w==
X-Received: by 2002:adf:fc8a:: with SMTP id g10mr32109980wrr.82.1585004588115; 
 Mon, 23 Mar 2020 16:03:08 -0700 (PDT)
Received: from x230 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id c7sm26592712wro.75.2020.03.23.16.03.07
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:03:07 -0700 (PDT)
Date: Tue, 24 Mar 2020 00:03:05 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Message-ID: <20200323230305.GA2696136@x230>
References: <20200323224933.2613658-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323224933.2613658-1-petr.vorel@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] accept4: Use tst_variant
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> I guess __NR_socketcall is for x86 and other old architectures,
> but we still want to use it, right?

Maybe I should have kept just 2 variants (libc implementation and only one
syscall implementation) and chose the correct syscall implementation with
#ifdef SYS_ACCEPT4

Or is there arch which supports both syscall variants?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
