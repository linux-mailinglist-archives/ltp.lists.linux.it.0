Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9601F7502
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 10:04:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF94F3C2DC7
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 10:04:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CC92D3C22CA
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 10:04:52 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A2C141A0174A
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 10:04:51 +0200 (CEST)
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N17l4-1ilt7I3UhW-012VYt for <ltp@lists.linux.it>; Fri, 12 Jun 2020
 10:04:51 +0200
Received: by mail-qt1-f174.google.com with SMTP id i16so6506417qtr.7
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 01:04:50 -0700 (PDT)
X-Gm-Message-State: AOAM532Dlbzqqf3nP6QLRDgd/Zk2CKQWx7FN7q+SpWEz5RElf12OaxJv
 mWdoK+i00D/cgSzV2G6Ur6StqHCj4Lcm/GvUsgU=
X-Google-Smtp-Source: ABdhPJxBHY1VqiddQJhO/8E3dDHB2/wbJ6r2IgehnNg/UT+8C/skYRobdzGgK+i0Zd/YBBA0MNESETZ5WpGtX7CCUeA=
X-Received: by 2002:ac8:2b98:: with SMTP id m24mr1836179qtm.7.1591949089669;
 Fri, 12 Jun 2020 01:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <0f1cc05d6d79238ed94b93417f300e9a026a2063.1591864369.git.viresh.kumar@linaro.org>
 <cc75beb4074b62e94b8ac92cba17af41b8f5fbdc.1591864369.git.viresh.kumar@linaro.org>
 <CAK8P3a1VEj=QhvmeSpzA1GKLhg9isM106yW1trntNVTqP5UZQw@mail.gmail.com>
 <20200612074009.t5ccj36nf7pd25sz@vireshk-i7>
In-Reply-To: <20200612074009.t5ccj36nf7pd25sz@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 12 Jun 2020 10:04:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1aYf+jEEWbfjW0wv55U0UUv45occvxViMAu52J+OP_bQ@mail.gmail.com>
Message-ID: <CAK8P3a1aYf+jEEWbfjW0wv55U0UUv45occvxViMAu52J+OP_bQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:B1nVh/dI6cWVDsKo0nkMOb60Oll4fPhDSxwuxCM8jBLL1WeOzcT
 TBLPJtfvfz5100fyz+h30aUBbXTeLvlVBQOe8wtaZbVB3TJTgp7Q0VlEOKso/WVM5RKTCb1
 VNINSiL4SilBz0WNc7c79ZtYzJPYEtaIUZ79U0u1vO7JvaLnVcx9bQmGnijK9bGxgZExu2+
 asOUr/hF2vathxaDecpvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UVDQUadUrus=:CX9NjdSwVsXuEYoUXSGw9Q
 bmfuVFYlwQwbCyXnAnjJhAqzXMDMF59Fk8f7ewPktTwRj5Ecocxnr6xQB9oCPpAllTm9s/j/4
 BPyrquT1vdVoV2IzdXR3SRQBgEdfbSN+ntx/2TpJCABbYP0OyeX9g8yDpHo9TZW/H0Oz7Nn9i
 4jlFYMAzwm/uCeXv6Kh2ie+zbq7eZ0FIrq5A+seqdoqfhoBKHrP56NKT8lcOrqrpbLUCTxfl3
 uaFcAPNVExL9FVg1VCey0j6xAeUitTnsrGLOAbVAVAbbPcIuKnO9IZ2lxX5bJSCZPcCsi6Dll
 lFtdeEEWaKpd330WHxRUzFQ+WO6I//fDUdV17mrHr9JD6wHzYoVY7yRChGuGNDUUEq8ZQL5Ce
 o1UrjSZ+8PMtyLTxV8g2YLQ9KD0WGHwLVFTqaDFb32r5l52H9k0lCdYAqLFJUkR4NBMrxpRnP
 JBG2yxaUl8ibkUd+Fhkuo7SiGrnuzwMXHayH1coR8PuogR1hF27P4dUH7Blru7eMv9ZMzYN2K
 PvtsKtQ9mAX0YiyiBMGYMRZYavBU3CCguzuxPl7MhVA5mcsg22qNmNTBSiXcW8RysmghamXBf
 UmghbEiLj99mSMpsumBfrylulsSChZKd/kfJe355rdSeSk8FbaLzUgAFI//HgNoTwQ3jEr4RG
 SdCKk/6An7122qwBkrELNQGW/XXnZwovBsbHr0GtbfFpsMuG2jM4H82xPoREi60GacOe6sh2u
 rZ3+P15s/rSSVkikFK7Pn+1lXWy92TL6oo4Kc3IqoxV//s/Wr/+8nY5iculBH4B2x6AU0aiMr
 WPd5Cil+ZUpwX8SwFYBgv2Ge5M8iMLj78jAjLOO5kFcUNZZeUg=
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/2] syscalls/clock_gettime: Add test to check
 bug during successive readings
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

On Fri, Jun 12, 2020 at 9:40 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 11-06-20, 15:05, Arnd Bergmann wrote:


> > When any of the variants (in particular vdso_clock_gettime64) don't
> > exist, I think you just need to continue without printing anything.
>
> That is exactly why we are looking for ENOSYS here. The other code
> (which you removed) explicitly sets the error to ENOSYS if
> clock_gettime64() or clock_gettime() vdso isn't available. And so we
> won't print an error here. Though the setup routine will print only
> once if the vdso wasn't available, as general information.

Ok, got it, I misread the != ENOSYS check for ==ENOSYS.

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
