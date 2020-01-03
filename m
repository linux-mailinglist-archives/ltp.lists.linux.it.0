Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFD912FA11
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:56:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A7653C2457
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:56:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 008273C2446
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:56:50 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 480C01A013C3
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:56:50 +0100 (CET)
Received: from mail-qv1-f49.google.com ([209.85.219.49]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MQ6C0-1j9M1J2FXc-00M6Zs for <ltp@lists.linux.it>; Fri, 03 Jan 2020
 16:56:49 +0100
Received: by mail-qv1-f49.google.com with SMTP id u1so15546165qvk.13
 for <ltp@lists.linux.it>; Fri, 03 Jan 2020 07:56:49 -0800 (PST)
X-Gm-Message-State: APjAAAWNH2WiY9n7kT7DAXEXIRYnFafYfoYcShiu0JnloaArWfAP7QB3
 mIbP0BlEUt3zj5siMVKKa0DBrvp+EnRdubY/wHs=
X-Google-Smtp-Source: APXvYqwAZtlDU9yS/thCGFJhNrhvQGPNxuoWiizEZDxJ5nrJCe1L3kDS/UikuNsEdYJa8Y3FeqWFHQmLu8XM2ZS7NUQ=
X-Received: by 2002:a0c:e7c7:: with SMTP id c7mr68933990qvo.222.1578067008436; 
 Fri, 03 Jan 2020 07:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
 <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
 <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
 <20200103154518.GB1064304@kroah.com>
In-Reply-To: <20200103154518.GB1064304@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 3 Jan 2020 16:56:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a00SpVfSE5oL8_F_8jHdg_8A5fyEKH_DWNyPToxack=zA@mail.gmail.com>
Message-ID: <CAK8P3a00SpVfSE5oL8_F_8jHdg_8A5fyEKH_DWNyPToxack=zA@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Provags-ID: V03:K1:XZfkfjzMYSkwmtPFwrHN3e+WDPA8uXQZN1+owzGX4OVysPgOJDj
 zma4J2DxkHlLrG2JE442ZL5f8u7NqA4VYglCPr1Ws18ENT/b3y6UYOxWnq4JgdBFnOnJlQQ
 HeZA65V/HIb8yxD/Mzcss+q+EAiwLo5NN+DmzgSFYCIxack92TxpiNVJP1pJfKRqbvS0OYG
 kuz6mKX6c/TL2SAXN4Fbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W0eOupHCOGE=:c6ZpwrZ2XV+bw/K/kANxv7
 YsHmqM1gWTvavIrwDuT8PzxTYWEh4OXJvXt8pLCyJV7WRG1kwtlIAulp4kXoWMK1tJDo5UtYm
 O8KAt0V8pCNpSdnIV0Vd30D3FXkdrKI6DtzaFQNZH0Afh9IoyqgRvETukBuAxtfMRfTNZvvTx
 w0cRL9m4Mv+r9Dqp0xtcRcZrwgf6PWWfPWi18uNpIuRv/WZ2V8BcDilFwkUwTaQaJni35dO/3
 fx/STn6iQ2of1yBUGRNOCPiCcJa9y3ul9QNENO3vExVFVf6pfaFQZ/bm5S5ksLMhUE4tK4Tpa
 /tRyJ7DS+s8fDxQOLcv3QVLY1/HhpJLFSc/I5Sc3GHCuZGA2+76DX1lGrkxwl4u19rKv57Qns
 L4U+6x/Q3AkElePNpZ25yDpy+iLvhC6zUjYmx+S8i7cOez49tSlzlHwyx6rHlGI/SQlIrhFzs
 1r3YbBMWh7Ib1/nboDH2DTQWA4ie9kDnrYK4R9eq88L/bv7obV9N+uRIQRQOKTvcstQOlGLpf
 9kIDz3Q5k2LZIr25JLoALAtuYBjeAhGKVHBEDFy+sxKyqoeyb4KAGKEAM6PW0loA35VpADi6z
 p4uK4XQzSaynNK8dZuiNE2kktfFCA/vzxDjjNB5sHEDN1t38XDOt0OaEkRQb1/94Gow7UPLvV
 ySJCPSY2/H4HEgcoe5aSq3eATfgcEp/VFYcDrzSkGk2EIRxG8qAaTV2mZI6fxYXrVi/56APy3
 5Ri33OcmdIMTU65OwLOH21PlMeicW0/3WMJ/uxNusRo5ZEGLtzfhaT4YZeToxxmx252o6YCGT
 bOc5jlhCLifVcCnpxr6TbViQL2h1zOVWNNefEck6JEEd6zA07/zCwS8CYUfQgmtIYEcIIKsLe
 qO+8hRiQJaQ97uokwsaQ==
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.4 000/191] 5.4.8-stable review
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
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>, Sasha Levin <sashal@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jan 3, 2020 at 4:45 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Jan 03, 2020 at 04:29:56PM +0100, Arnd Bergmann wrote:
> > On Fri, Jan 3, 2020 at 4:25 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Fri, Jan 3, 2020 at 4:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > > On Fri, 3 Jan 2020 at 03:42, Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > >
> > > -ENOENT is what you get when hugetlbfs is not mounted, so this hints to
> > >
> > > 8fc312b32b2  mm/hugetlbfs: fix error handling when setting up mounts
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?h=linux-5.4.y&id=3f549fb42a39bea3b29c0fc12afee53c4a01bec9
> >
> > I see that Mike Kravetz suggested not putting this patch into stable in
> >
> > https://lore.kernel.org/lkml/befca227-cb8a-8f47-617d-e3bf9972bfec@oracle.com/
> >
> > but it was picked through the autosel mechanism later.
>
> So does that mean that Linus's tree shows this LTP failure as well?

Yes, according to
https://qa-reports.linaro.org/lkft/linux-mainline-oe/tests/ltp-syscalls-tests/memfd_create04
mainline has the same testcase failure, it started happening between
v5.4-10135-gc3bfc5dd73c6 and v5.4-10271-g596cf45cbf6e, when the patch
was originally merged into 5.5-rc1.

> This does seem to fix a real issue, as shown by the LTP test noticing
> it, so should the error code value be fixed in Linus's tree?

No idea what to conclude from the testcase failure, let's see if Mike has
any suggestions.

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
