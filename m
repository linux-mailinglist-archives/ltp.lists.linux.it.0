Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E48EC1CA513
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 09:21:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88B7E3C25E3
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 09:21:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 13A483C23F2
 for <ltp@lists.linux.it>; Fri,  8 May 2020 09:21:33 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 12B13201340
 for <ltp@lists.linux.it>; Fri,  8 May 2020 09:21:33 +0200 (CEST)
Received: from mail-qv1-f46.google.com ([209.85.219.46]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N8XkP-1j28qr1w0H-014RPE for <ltp@lists.linux.it>; Fri, 08 May 2020
 09:21:32 +0200
Received: by mail-qv1-f46.google.com with SMTP id ep1so326586qvb.0
 for <ltp@lists.linux.it>; Fri, 08 May 2020 00:21:32 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ5OIedKPNOmHPgvPz/nwgZ24vDShmjsUSQM7YNu9Ofv0MBQ5M+
 gIiNCKfSoDc+arr9ExbHnfDDeNjzy5PC+2a1Xm8=
X-Google-Smtp-Source: APiQypLeRERoKP8PluNvAV+1M3IY362q+Bf7n16YQOmpAYr2X5t3y1qmgc24U6Y6ps4HjV5q9KRq0nQhYXHHR+vKd7s=
X-Received: by 2002:a0c:eb11:: with SMTP id j17mr1402363qvp.197.1588922491388; 
 Fri, 08 May 2020 00:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <614763566d03f6d88fa0d60d15a719bbbc467cd0.1588911607.git.viresh.kumar@linaro.org>
In-Reply-To: <614763566d03f6d88fa0d60d15a719bbbc467cd0.1588911607.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 May 2020 09:21:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ccSTeo4twSFRTfG9+HxLthrPDP-GHi3v9bmLKym5n2Q@mail.gmail.com>
Message-ID: <CAK8P3a0ccSTeo4twSFRTfG9+HxLthrPDP-GHi3v9bmLKym5n2Q@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:22msBm48HjtbDGKoHclAPB5CNQEOEgS2iNPlci7FqHOiNQkrorK
 SQW1MgWaQpJb6qsnMLAN6KFOyPku0O+TJnEiLPoM4NOzbKr2CyRIVnSasVDjYajcr3sceLz
 LlfU/7nrwewgOZAK4LfO1AUYK82Uu9gxmzmOOQG4xQnHSb1eJWR4qsc6XBPzCMyR53KaCIi
 kifJSwmImCR5oaFpRTqXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s/FmrGWiJjU=:27t9vPAblPCNb0yNC68e9Z
 wtpWcZkleDXIxb6sf7bPb+mEj9Ms33TrUl3DoCYF/eSQxAA67Wv0zTbj+XucF4N7EJpOAJhFK
 moHcs/X1MnHR7DvVH36PpU/HrV8Aa9EOaRiprU4fP/QhzdJQwM9xxfg9ExZAE4Oyd+9ssmDoi
 aDrmbRVBLunXEAVYlpVTUulpAzqHsjc135nVxL9iizoAJmqml+2ZRzDMtMJKwUONmdH0Ti5U0
 MdpYEjy//AOkXD0DOl/N6Pbn1XeR61is97Svjww8zA/XD1RL1S9DGsKO+Bbcn06x/huTaBJBu
 e6NJZdkyPA9RMzK38iZgYzM82djpxvBe/r/8915syy7ZNgqqyrjNpWBOQiPMvGIDk2cWHZUAC
 k/nOv1733ujBlcBBntd6kgLVB9bt+Wi6R274IWOCsFYxZrKp4Y3UNBJfRk4acTvlznNYw5/b0
 poPn7Z5/9276fXm+PlzAMVCj8JBm681gIPYBgXk06j6D+oVCWfOcXmppAcQ5Uvi5myb/VU0+m
 YVCABJlayuxRxyRwHb23eg9KE9w1wBekW5S5oDJLasFZ2ak2aF4zppJ7X3vKk/FXMavfrqsV0
 0ZY01N1000+NuI7k2UNH72SH7cxuVoZjP6Ce6SxJ7+5Kb0MJ6vg6iPlhAHaHzg/tXMrXWlkM4
 OgLXwp3tTOylW/IbBx8AhokAhIoT4GwCYKlZ5iHYEHWzzenxiQ/YqEeq08MuyHSfRWkBxQvaR
 Z062/gUIoOcdjwytLBVV3d/EgEctkS4Qo+jbr/xsaQgZ5U+olZph5t+xrzDfoKj2PVl317Gae
 HvbwDXSUPceC8uXw537PC6Qfiwh9u1KwvlP1tb/yBVLDXs6i50=
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 13/17] syscalls/select6: Add support for time64
 tests
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

On Fri, May 8, 2020 at 6:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> +               };
> +#if defined(TST_ABI64)
> +               ret = tst_syscall(__NR_pselect6, nfds, readfds, writefds, exceptfds, &ts, NULL);

Again, this is not the actual ABI: __NR_pselect6 should be called with
a __kernel_old_timespec when the macro is defined, but it may not be defined
on new 32-bit architectures.

       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
