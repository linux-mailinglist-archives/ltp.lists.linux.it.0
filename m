Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3E7DB829
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 22:16:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29FB03C22D2
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 22:16:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2591C3C2297
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 22:16:15 +0200 (CEST)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 403D5600C27
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 22:16:15 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id n124so159397wmf.0
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 13:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=X/nfNXr9XwnWZuVGTJxv8oePtIWNTSiGuJTC1USgFWg=;
 b=cwKnHDWGNWEoWnQRUwUDlPz9toEeyjSrPcYQFnZYpnH0eXJupoUa1i/ydHlW7Pmoam
 Uu+RyKA+6kSz45PREWhj5l9tCfXNnDWLtAkKEbcfXS+Xi+n/l+YA+RDeL9ox/AF9Ii6E
 7imqzy+7m+zrqn6fdZ1t7zPWfN1tvKyX0xPzaKS+VZ8U8BY9W0WUDXhO0b/GV/Q34hWl
 bSSRqSlPNCRr2STD11TjPwbZ4x9JRj5hhu+gqc/S6h9n7ZNYyM0GMGY7Zsq4OhgCaOK1
 jz53OdFcsG9ZFZe+gMh6lOtWtaePgmuoTAbXxqfSEROB0tCAs5fK4pEO3fI0QcDRz7M0
 pgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=X/nfNXr9XwnWZuVGTJxv8oePtIWNTSiGuJTC1USgFWg=;
 b=MolJT+xvF++GteAKQsEcXU3kf9kgR4ATQ2e5t5frJTBngfB8GMOCbEiE+J804wWclb
 bQfgl8d+r7j7yn3uJLQ4zfXbGOBRGW8HSvGhVPBS1Dzu85GPhpqwI64nFnQTctYia5yt
 7QiDpdW4ECZlVVqoOwYz9xAqDF4D7wiVvNJsx5UUvrXezK4gA/T2vp7BuOd2bA0BrGs+
 bVQ40g0opaY7AFNzamp0mKw6+N/vaPXbduH8DaqPQ9qvncXYzl3jnxc5ajBDHCwrS9F1
 d0Vc23DaHoIkCUsLebbNi/ovqci/zh8isxWMgZ40zScfycZbcj8+8/hLtKMJRyZPkX9i
 c5cQ==
X-Gm-Message-State: APjAAAVDvLLOABoIpjNDaItTiAp+6U03BHh5e5tHEfJi6Guf54u/Px4Z
 OBfOHXcdTGYhEfpiUtG5Njo=
X-Google-Smtp-Source: APXvYqz6fuSRi31cSVgVk00webKlKmRb6Rr5VnPa2Sl4y49dSdnRO6QID6C/Q1C2l5KrDE6D3fDqaA==
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr4485183wml.8.1571343374909;
 Thu, 17 Oct 2019 13:16:14 -0700 (PDT)
Received: from x230 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id o70sm3753576wme.29.2019.10.17.13.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 13:16:14 -0700 (PDT)
Date: Thu, 17 Oct 2019 22:16:12 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>
Message-ID: <20191017201611.GA4840@x230>
References: <20191016213001.23047-1-petr.vorel@gmail.com>
 <20191017091533.GA20152@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017091533.GA20152@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] setxattr03: define _GNU_SOURCE to fix build
 on musl
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Jan,

> Hi!
> > musl defines loff_t in <fcntl.h> (already included) and guard it under _GNU_SOURCE.
> > NOTE: glibc and others define it in <sys/types.h>

> I would say that this is obvious enough to go in without a review, acked
> nevertheless.

Thanks for review, pushed.
Sorry for taking your time with obvious fix, next time I'll push it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
