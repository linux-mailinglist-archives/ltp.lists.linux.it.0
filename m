Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F1624943F
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 07:00:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC1E13C5840
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 07:00:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4C6AC3C2FC1
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 07:00:12 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5E0161A009B0
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 07:00:11 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id mw10so552889pjb.2
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 22:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iGJy1GUh1swRlERiS8BJx4URaOdninOSJ0G4O4YbJZI=;
 b=ls1jeUvk4U9ldwluEEZxIlg6Ww0qekK9CEp27KUOS18Qph51B3CtejFijYWFAF0SPO
 XUm88k6A8wpgRqRq81pLV847rDez3UkLp2lVrTWEFK/u1DbZBHsWS5qBjzlX3qmd32Fg
 GzJGatkPCgEatkSE9I+bNjsr7bgSpCbStf9jeRiBydGtsidzbwvc0pjL/bcbO0ybHE6P
 HDbebsF9X1ZF8mN2ZfIjHV/5KswTdY3yangOM3X6GIlnzHvNcrfESJIBsQa8YdwzcOm6
 MVqcUZPWfXBzkVKJEkuDuJt+hedzKjwFL2XrKe3DiYS/wGv+MAw82ZUH1xLAppnK8J55
 v2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iGJy1GUh1swRlERiS8BJx4URaOdninOSJ0G4O4YbJZI=;
 b=EEm5rkyqDfpZPaGCXyS0mOyYAduyZDaY03XLZRuA4A9uK0oaNI7z7na8/9/4i9yh5D
 /SIdQwk2rwG8dAF2r9NOKkmnNTZu6PRRMyX9B5jrc4n06c5pEqkJi2hjzqXzCRL0eMeg
 +RpeZeG2ptK5ydErtgeoe5u2h+wUiqfOBD8fzXRypchCuLMGlF1Q7bLXoGmtHed2OUil
 dEInUQRt7yX3nDJrft8sweY09HtyxeGRQX8e9KH7kM/m20vb4rbEhf0l7XyZyexlNFAs
 MuGH1ZTA3yvn3Zrd+cgFHFnQ6UVRwkz7nhr2i77RFUC/KVmgw7HxOiaYeQ1EBYQxKxLT
 X9nw==
X-Gm-Message-State: AOAM533r5pWlOpfATfHlgQ7+jkrqQoEwnxaN/mCvlVZHVGNj14uTKTCs
 RrhMkMWvb0ZVkrLwqGOWgDOsAQ==
X-Google-Smtp-Source: ABdhPJxDio45rD5PZT2QsQuuwGHpgTlcabyX4Bb/McV60JW7gtRDZVgO6dORuHPN4ly8ICF2P4PfQw==
X-Received: by 2002:a17:902:9b8d:: with SMTP id
 y13mr16823892plp.279.1597813206628; 
 Tue, 18 Aug 2020 22:00:06 -0700 (PDT)
Received: from localhost ([122.172.43.13])
 by smtp.gmail.com with ESMTPSA id u62sm26431861pfb.4.2020.08.18.22.00.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Aug 2020 22:00:05 -0700 (PDT)
Date: Wed, 19 Aug 2020 10:30:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200819050003.bvamzdr4avawzrce@vireshk-i7>
References: <8eefb21d278f0846024a16281c5e19b0e3936979.1596797812.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8eefb21d278f0846024a16281c5e19b0e3936979.1596797812.git.jstancek@redhat.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clone302: drop CLONE_CHILD_SETTID and
 CLONE_PARENT_SETTID
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
Cc: christian.brauner@ubuntu.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 07-08-20, 12:58, Jan Stancek wrote:
> Per https://lore.kernel.org/linux-m68k/20200627122332.ki2otaiw3v7wndbl@wittgenstein/T/#u
> EFAULT isn't propagated back to userspace so these will always appear
> to succeed. Also issue is that multiple flags are tested together
> and some arguments persisted between calls, because they were set
> only when argument != NULL.
> 
> Cc: Christian Brauner <christian.brauner@ubuntu.com>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/syscalls/clone3/clone302.c | 42 +++++++++++----------
>  1 file changed, 23 insertions(+), 19 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
