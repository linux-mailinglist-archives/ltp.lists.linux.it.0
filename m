Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B3173280
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 09:14:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D8283C6ABE
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 09:14:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 101FE3C1F2A
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 09:14:36 +0100 (CET)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 568F16008C8
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 09:14:36 +0100 (CET)
Received: by mail-io1-xd36.google.com with SMTP id e7so2455401ioe.13
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 00:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6TrnLMEZR6nSzMWh3xmvrbZgzuUWXyI2RhMioFvb4j8=;
 b=YuJFIKxKcT2Hos8u8cSXAhuGppcSeK8Ktno94iy2i3EAFvKsLlOTMGFEfjzO++JJTe
 mxYDscKHzOgIZgBBnVoyQvaEoATIYEFJjCcGLvgN6R1ku8ahqPg++JKsKZhWqlReUJQd
 2Y/pFEz1YawDrpdbf0yKgVBYW1RczOyeDiyA6b2iXqB27NbY8x5aVjgAPOqRay6XqVSA
 dAAbAT462BxA8WHYrRXB6UgKeGDWsud7YypRbPWbvp/xZk8nQKde5xfjZBPrfN3azgYJ
 Sv/VR3oFqgjkIaBKxi/AbgacTUo6GT9I2UWkGKD3QdyKWNP5POT7UupuRSPb0K9e08Xm
 j/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6TrnLMEZR6nSzMWh3xmvrbZgzuUWXyI2RhMioFvb4j8=;
 b=WCHEmWnx8/MiBTwqfqfg07v6QV6HqjesQlyA91Ugd99kgbXZLzcCplXgOs6+/Farne
 8Kbb7AEN9vOtWWF3+u/puJYbFUj4VJBzwsq6vuYqt1zggfqCodeWgs28nv/vUjLmvp9m
 1nbrPLRQ3K9ql0cZ4k2tkxaTPuovQQmOAdUYp7BPQtrz/XpZfrUUuMNIQX7WG+NwGWvq
 fwQleHUKO2pdw8hd5qBRHq0e8dryrskUMdEMN9GsozoQaPsAXPrfQrDeHrGA9hYvCDwS
 i7ckb0gskbLmNHXKDITEECjU9uX9I9gbKZXGygc0ykzr6NXPVWV+NNzv8EggXXFJjCwD
 IlxQ==
X-Gm-Message-State: APjAAAUj1m6wn102NBluO53kLd/otYGxqw9pRoDKI9GqYiNJ54lQlvwE
 7jlrAwEkIBV2dx5b26PJRUvN4JQ+cCNZc8PsoVTK7Q==
X-Google-Smtp-Source: APXvYqwkNI0+5NbXJBsVN+cOzFYyfZpbD4XK6lDOL93yrrJzUVhyy6h+hPIugybWEmIrVGP0Ff6m0YXZc69xEpVISBY=
X-Received: by 2002:a6b:7310:: with SMTP id e16mr2717291ioh.107.1582877675092; 
 Fri, 28 Feb 2020 00:14:35 -0800 (PST)
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 28 Feb 2020 13:44:24 +0530
Message-ID: <CAKohponuu3zpsQCv0v1_Yqb_tmqy5yyUejMoS1_M_UFf5FU2Mw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] Query: Adding support for clone3()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hey guys,

I was looking to start implementation of clone3() syscall in LTP
and am a bit confused here and need your help in doing the same.

LTP abstracts the call to clone() syscall in lib/cloner.c and the current
prototype of it looks like this.

       int clone(int (*fn)(void *), void *stack, int flags, void *arg, ...
                 /* pid_t *parent_tid, void *tls, pid_t *child_tid */ );

One of the challenges with the implementation of clone3() is that
there is no glibc wrapper available. And in case of clone() glibc
wrapper isn't ordinary as it takes care of calling fn() and handling
few stack related things, apart from calling the real syscall.

I am confused now on how should I write support for clone3().

Any suggestions will be appreciated. Thanks.

--
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
