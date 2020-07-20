Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9D225C8B
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 12:19:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F24D93C0886
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 12:19:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 365383C0886
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 12:19:45 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9E8C42009D6
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 12:19:44 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id k71so10012526pje.0
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sx7ssW5NYFCtrFv2I5b+27qDXGufJMsNNHFTSAfCQOI=;
 b=NhR3E66F9zwPlkiXPSFR2s865YKYisSMKRoEWdWskProuAN8EDJAN/2TpXCJPeexhQ
 T4r2cVlY0R1TOLw6gYml9EZ39xLQAaTif857xL3pk0gR8kpEszVIeycMIXNyfpULG4bk
 kPmyZ07wdOUZc2DtIMlwJ/y55YIkjwpvLbl2rgeJCZHkdGkQMZcyvEjJ7PGG5cOFhEHO
 9wnf3QvJSkDRS8A/owlRz9l+xuxYLftrHkO3goCHiuQvoKA05FuN1Ea/PZlXoGMWDpbw
 tBKJ9+HXs5KVz15C+I27GY1WBOATYdxCwcyt2clDa3QhiC/0HKBhShZxe7bMhOohVQD/
 pO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sx7ssW5NYFCtrFv2I5b+27qDXGufJMsNNHFTSAfCQOI=;
 b=jv/XQpuGWuXu6k0z9k92qECwEwxb/37/i36h4ODHnMlrACI74sG3dQ/Mr6UUimMJoi
 lingF+itRahrSAJY7W3dNZ19O//FgTrfOITdfDYJFo8KDk/NZmXPu8Ko1wir3JQle8dw
 SexWBLCrvQKowX2d7vgLqe3dAOP3j/DGZtlaPmcy+6u7uwEJTS6JdL2Gpc4NVUegyYFQ
 c17/pZfG9ZqOM0auusMS2fd1KZEKveU4aoaJ/IXQYsd5Lt6GnD6jR8DzePZfzT/YyRtq
 mrWJxvWkZPCiJu/Ztcanb9wVapkql6ghW4nvoq2Iu2EqvSAtrz4Ov/XV5RmS7jnh9ygm
 r19A==
X-Gm-Message-State: AOAM531i6KLtQXREuTEOEt3JzZ5oyDtTwL4toLqsy4umFYQXzlTpJepW
 DBkaAwokTo3JJwij0EadRy7xGhAoUWk=
X-Google-Smtp-Source: ABdhPJyX/DkY6b0y2CCu84+1DtqLkB3ynXtHNvxGLbX1hKDEhjUxW0EYWgwGvD8seZe/wZqL7FLAsA==
X-Received: by 2002:a17:90a:b63:: with SMTP id
 90mr23880538pjq.47.1595240382802; 
 Mon, 20 Jul 2020 03:19:42 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id y6sm11698812pji.2.2020.07.20.03.19.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 03:19:41 -0700 (PDT)
Date: Mon, 20 Jul 2020 15:49:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Message-ID: <20200720101932.rw2uy3twdfftttem@vireshk-mac-ubuntu>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1593152309.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 00/19] Syscalls: Add support for time64 variants
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26-06-20, 11:52, Viresh Kumar wrote:
> Hi,
> 
> This updates the pending syscall tests that lacked the time64 updates.
> 
> V7:
> - Move all tst_timer.h changes to a single patch.
> - Provide more generic helpers for itimerspec and update the patches
>   accordingly.
> - Also include the y2038 patch in the series as that depends on the
>   first patch here.

Ping for a lot of patches from this series as well.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
