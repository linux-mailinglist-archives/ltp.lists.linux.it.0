Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B9354D6F
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 09:10:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E1FA3C1E0A
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 09:10:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 518F63C0E13
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 09:09:46 +0200 (CEST)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C5E0A1400752
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 09:09:45 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id g38so15084901ybi.12
 for <ltp@lists.linux.it>; Tue, 06 Apr 2021 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EptXV3n38qfCxuftfWu1eyuZks7dyBErMRQJNfNJOIw=;
 b=dPBeKzjaL6iXdjo55INdmRSg9kvQ096LpOmKKUeEuzcxP71MuVcXXRbdmYZ+gLq3L1
 EXBrkKBx0uTq9E0wsGlCLBkPX3bQS6RK//EixYEx1qy46wxknBiF5d0SLEioTtQlgt6a
 klR+DwWy34vOfVO784TsMf6rrb55v7DK9DBsfpuD+PdQhz012dkvKkLeGTunkvzbVg7b
 3xDYTRofrPUZhWUfybCdLOppYZowUV7koNxI8b0CPU3QnOQxWtXQSXS6WN6SOhEny7K4
 eoyTVWh86S5oYn6XRBuUWuAFLUlncsbt68Gqi6Eq5llCLOvrxaAFz/pGsj4qE25vO1wT
 JmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EptXV3n38qfCxuftfWu1eyuZks7dyBErMRQJNfNJOIw=;
 b=WAdcr8TKwwpHVHPj5iRwHknxphAY3twuQh1BYiunuHOnQGlQM3DzP4KoeKuIlB2guS
 yk0efdOWOqkKKXY7jc1YcEV/qtCj596JJShJtRF99aoy4Wj3mFyUtwnSJXqOlHVO1MkY
 yzMINWWc+EnklsNJXHmb2Ab9ujkJlCQ+YtPaK1LJRHf/f1QrIgD+w4HMVYmj9mY3ptGe
 TfzLwbyw8ciHm/NgtSgTyooQ55OJvZ9EvExSgk/4Np5T/YaB5aFgUIUi+OViCI+Hh6b9
 DJmlmrLFKCMvcHAlZYMDIH3XxotoFcDK0u0pb827dxqGlwHxglxFAIIhgsUGUYEkIWbC
 Nt+g==
X-Gm-Message-State: AOAM532IYHinSIuww0CaY6K0Ay4YIiV7B7t02dV+i1RAqwQb3HQK6+/5
 zsTpjO8Nbaqk6N2cTRaLGh8dYO1G9c43alLCa9Vbx/nNai+plQ==
X-Google-Smtp-Source: ABdhPJzYX8sAQaI3s4+gY2nPfHhx42OGH7m3I/dWejrqnQ/WakzWPT4gGfS08jVcXX36GEIwnBR1g9q8Et80+5Ufa4E=
X-Received: by 2002:a05:6902:4d2:: with SMTP id
 v18mr28480009ybs.303.1617692984148; 
 Tue, 06 Apr 2021 00:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210406063924.GC7352@xsang-OptiPlex-9020>
In-Reply-To: <20210406063924.GC7352@xsang-OptiPlex-9020>
Date: Tue, 6 Apr 2021 09:09:32 +0200
Message-ID: <CANn89iL+Df9hDAkt7fPH3Dc-2CDvuLWdUAOuZB77QMNWYu_yMw@mail.gmail.com>
To: kernel test robot <oliver.sang@intel.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 06 Apr 2021 09:10:10 +0200
Subject: Re: [LTP] [tcp] 4ecc1baf36: ltp.proc01.fail
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
From: Eric Dumazet via ltp <ltp@lists.linux.it>
Reply-To: Eric Dumazet <edumazet@google.com>
Cc: kbuild test robot <lkp@intel.com>, lkp@lists.01.org,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "David S. Miller" <davem@davemloft.net>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Apr 6, 2021 at 8:41 AM kernel test robot <oliver.sang@intel.com> wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 4ecc1baf362c5df2dcabe242511e38ee28486545 ("tcp: convert elligible sysctls to u8")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>

I think this has been fixed with commit
d24f511b04b8b159b705ec32a3b8782667d1b06a ("tcp: fix tcp_min_tso_segs sysctl")

Thanks

>
> proc01      0  TINFO  :  /proc/sys/fs/binfmt_misc/register: is write-only.
> proc01      1  TFAIL  :  proc01.c:402: read failed: /proc/sys/net/ipv4/tcp_min_tso_segs: errno=EINVAL(22): Invalid argument

...

> proc01      2  TFAIL  :  proc01.c:471: readproc() failed with 1 errors.
> <<<execution_status>>>
> initiation_status="ok"
> duration=2 termination_type=exited termination_id=1 corefile=no
> cutime=13 cstime=233
> Oliver Sang
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
