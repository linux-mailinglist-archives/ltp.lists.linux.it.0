Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E54F29C888
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 20:18:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 069A53C5601
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 20:18:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E37AE3C30F8
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 20:18:26 +0100 (CET)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9C2291A0010B
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 20:18:26 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id t3so200347wmi.3
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=mr4CxzbwxMeDr+rs+m8gZZkouH/Ws2YzjJaalfIWDBc=;
 b=Daem9ty/7OmWIuItRWUhquKwLDxukcVNyacjVun8UaZaprSbHeqflAldwunASaYVcy
 eMYIEEy3stGECR2G1rnW6OVBS7gdv8ZT4U+o/qdJTHa9ERMHUp9n9piU+yQ7J3cqlke0
 +3dIO1TnGhapK0orrYdFxaWbl2/yHHz+miF2PCZrOWNiRVOFQXF+Yla7alwa0HLy90mP
 QN6IAtSU6AeA2aNOoG3JHtEl5Yvj1HqTG5h2JVShuAq/BMmUn1++cjRQpTajEgl3FRal
 tnIbonRbI4h+5NYm4j/0FYY576Z3blomvrl5JwEd6xQR+NqiP3hvrhMq8He702UgaZ6J
 SfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=mr4CxzbwxMeDr+rs+m8gZZkouH/Ws2YzjJaalfIWDBc=;
 b=OwPvMkbdCGIk73BxiyjV30jkwe6G4Aw7vASSU0YynsbZj/UkDL8EPBHfj862+URAJ9
 zdtAXSut6frhmEoUDX68tZJ5D5jxjb7TtCqaYHnomBkb3dpXnZwhUKDFQh+5YCwtPkMl
 5C9T4DY640O15svcijccQpwpNGV3o2ZoD3RJCJTf4rIXTFyyhLd4/EZQAPSq5mUvhFUc
 GGIfN8n3m19k/GsMGaUdTr5zTimofJAtdS1IeUsPOw4ZQ3ADYEuXPaFttrvKwe+OjmPu
 gjq4i2zEGv20tTZgJj8szwqOL6SgN28i2Vfa8JRbBqTqJ6zRlMgzIIbLmdWKujvwrRvJ
 HWRg==
X-Gm-Message-State: AOAM5336GFD1Jbtj6ZQagmN95901MqzPJKL4tE/eaWa1q+Qw+9jlnGM9
 f+tHHGTIrFzWl02BF2Ok9qo=
X-Google-Smtp-Source: ABdhPJxB6QiB+eYzf/SyNHmizqmSkVOi7zCHNAxYj81KxyZ6f/za/5QOYh3ns3lkl3v5f3+J6QOXVQ==
X-Received: by 2002:a1c:307:: with SMTP id 7mr4398126wmd.165.1603826306203;
 Tue, 27 Oct 2020 12:18:26 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id b5sm3170334wrs.97.2020.10.27.12.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:18:25 -0700 (PDT)
Date: Tue, 27 Oct 2020 20:18:23 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201027191823.GB25803@dell5510>
References: <20201001231256.6930-1-petr.vorel@gmail.com>
 <20201014143317.GC13224@yuki.lan> <20201015190620.GA9408@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015190620.GA9408@dell5510>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] lapi: Add sysinfo.h to fix build with
 MUSL libc
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

Hi Cyril,

...
> I've added this patch already to buildroot, but if kernel patch get accepted,
> it'd be kept only temporarily (I think they don't have patches for musl based
> toolchains, otherwise they'd take Alpine's patch by now. But they instead drop
> support for these toolchains in packages which don't upstream the solution.

> > Apart from that it looks like the kernel patch has been ignored. I guess
> > that you should try to push it a bit more before we give up and apply
> > workarounds...
> Tried next version, let's see.
> https://lore.kernel.org/linux-api/20201015190013.8901-1-petr.vorel@gmail.com/

Patch has been included into next tree [1]. If not reverted, it would fix the
problem for newer kernel headers. Distros using MUSL (Buildroot and OpenEmbedded)
will have to keep this patch for older headers and update it as we might add
more <sys/sysinfo.h> in the future, but that's not that difficult.

Kind regards,
Petr

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20201027&id=92a5a1734a34380444dd9cace835525c5f51a9ed

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
