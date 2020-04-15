Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFEA1A9F10
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 14:07:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91BE33C64E0
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 14:07:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 195AD3C0878
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 14:07:49 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BBCFE601012
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 14:07:48 +0200 (CEST)
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MhClw-1ikOGM1nzG-00eOch for <ltp@lists.linux.it>; Wed, 15 Apr 2020
 14:07:48 +0200
Received: by mail-qt1-f179.google.com with SMTP id 71so12893072qtc.12
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 05:07:48 -0700 (PDT)
X-Gm-Message-State: AGi0PuYSLbvxkLqQlWSo/oSizBmqweFO5uuLpj91JIcdAt+lSeQrWRrP
 OC0TibviQ+b1Ojj/2knFa7wPPqEz5OtX8k83cYM=
X-Google-Smtp-Source: APiQypJx+wpbInwc7xfjneJjp86hu4fsE1nVOLl44wls+2VRuC7HqkpbtZX7R8FeV5z8WV+Wo7HESlPeeEkOFEqLr4k=
X-Received: by 2002:ac8:6757:: with SMTP id n23mr7877384qtp.304.1586952467328; 
 Wed, 15 Apr 2020 05:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586861885.git.viresh.kumar@linaro.org>
 <0b30a19ac2938561f6e5e8e3264528aad6e42a76.1586861885.git.viresh.kumar@linaro.org>
 <20200415115234.GD12705@rei.lan>
In-Reply-To: <20200415115234.GD12705@rei.lan>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Apr 2020 14:07:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2cwb1Lh5nJ4DRdDF4ADnON5axRkxUR+g4impceqbHABw@mail.gmail.com>
Message-ID: <CAK8P3a2cwb1Lh5nJ4DRdDF4ADnON5axRkxUR+g4impceqbHABw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Provags-ID: V03:K1:KkBIZghzDteNTJrtcFf21OnSmEOJvaWm1LFU/mTF/d7mJ7NEdn9
 29KFSNDl95hfNeW5ysXqXER1Gi3S5JkwVf6HnNiQ06VQzwFnfp7W1kpoQ8gZ1Lo085v3Ysy
 yC550QW/BAfQJBF8Tns4hL3J20bqF4RFxc6zMhshWFqaJS3mUqFVFsk8e/v7SjBXv6whQtc
 dgGzLWDuFI+WKQ+UhfeRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aDVTFwQJGdE=:gq1g1wXRB5j7fJ+L+ofNxI
 sHHjN18eENUmKHe9pty18n9Np9fyqanmj2ojVIuAOL4lylIn4Cy0F1WcHXV7JE0byU1aprF0O
 psyGNSRBqjO5yyBCLnH9r27NgHII8+gJA6vhavkd8mxBGV4iVby5gAAqvtf/M+yzwiKNPO/8a
 xytwHrrCP27BwAhr+tEI1/MIM3nverWUDCAgLxp0DW55eXhWuM/5EX5DKxkoJUb7iFqgX5p86
 zp7vlbqdXSbyE5c58rel5QHPUcObAeUH4tHJYuCXVQ/hxV+zgiAUgEWxT6+ifoYm33bE/Ks1V
 fWpH35vA5vPQlUC9LcWNCWHFPEiGLP40reTbr+03R76DbkgGwVvPC+rKEps/6DR8PfUu49jtW
 XqOFQkTvNDmPVPpTczjm20VcknqrY1NrRvJLVGauiiRKCUqGS19r8pFdC/G8mVbISpfEOEsvS
 QX3OqPfNmxex8W/FHr6C+n5mvBTxx67Sm5WdOzErUvmFjQs9vCljRzB4gvg4uBUA8M41kuFq5
 /Rw6MjtycDwtzraIbcLMT5tvwzR8fDgjVZgCh2cw//aMheB9I6JuthGwkXQgl1M7iSpJ7uwMa
 FElhFaRNBIYNi8KCGc7+PFcaCMzMBFD4AcTSqp9dvwbR7gkthXGdCNz5gTSQSEh78PaW1HZow
 3I00fB7Z/ve8322BxiTBWv77zBPKRCTjKfhKYLSXbGUBEoWsN7nmA04UYuFMr9P8/dscE913k
 JiUtW8IZ+94Bq76T6CXJSjA1NgZyheu7+6o4RYMv7EW1v+BFv/9XQ/MdBwarZ9Tovz4LZadg/
 78lkrbFD2GC37pLZydwx+utHmmEKU4c7hrY82DTqHp04EiCa90=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 1/2] tst_timer: Add time64 related helpers
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Apr 15, 2020 at 1:52 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > This introduces a new set of helpers to handle the time64 related
> > timespec. Instead of duplicating the code, this moves the existing code
> > into a macro and then defines timespec and time64 related helpers using
> > it.
>
> I'm not sure that adding a macro that spans over ~150 lines is a good
> idea. Unfortunately there is not so much options for a C language that
> lacks generics.
>
> Maybe it would be slightly better to write a shell script that would
> generate these defintions into a separate header that would be included
> in the tst_timer.h. That way we can run it manually to regenerate the
> header if needed. At least we would get saner error message from
> compiler that way.

How about having a shared .c file that is built multiple times with different
sets of -DBUILD_FOO options set from the Makefile, and a small
number of #ifdefs inside that file?

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
