Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0C1310AE
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 11:38:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F3DB3C2496
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 11:38:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4C2433C243E
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 23:15:16 +0100 (CET)
Received: from mx2.yrkesakademin.fi (mx2.yrkesakademin.fi [85.134.45.195])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3A7C420004F
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 23:15:14 +0100 (CET)
To: Linus Torvalds <torvalds@linux-foundation.org>, Thomas Backlund
 <tmb@mageia.org>
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
 <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
 <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
 <20200103154518.GB1064304@kroah.com>
 <CAK8P3a00SpVfSE5oL8_F_8jHdg_8A5fyEKH_DWNyPToxack=zA@mail.gmail.com>
 <a2fc8b36-c512-b6dd-7349-dfb551e348b6@oracle.com>
 <8283b231-f6e8-876f-7094-d3265096ab9a@oracle.com>
 <CAHk-=wjvWTFn=C3mT5wA=mtOwXw44U+OHLVxk5DCe4v+7nOvKg@mail.gmail.com>
 <c5c3b8c8-1dfe-2433-630c-06dbfb3d318b@mageia.org>
 <CAHk-=wgV_YN9az2XBX=xr_DGQiUEqwjtMXkmj-w12j58NQxneQ@mail.gmail.com>
From: Thomas Backlund <tmb@mageia.org>
Message-ID: <9bc30fda-2c6d-d66e-018e-95bdd77a4df2@mageia.org>
Date: Sat, 4 Jan 2020 00:15:12 +0200
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgV_YN9az2XBX=xr_DGQiUEqwjtMXkmj-w12j58NQxneQ@mail.gmail.com>
Content-Language: en-US
X-WatchGuard-Spam-ID: str=0001.0A0C020D.5E0FBCF3.0024, ss=1, re=0.000,
 recu=0.000, reip=0.000, cl=1, cld=1, fgs=0
X-WatchGuard-Spam-Score: 0, clean; 0, virus threat unknown
X-WatchGuard-Mail-Client-IP: 85.134.45.195
X-WatchGuard-Mail-From: tmb@mageia.org
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 06 Jan 2020 11:37:49 +0100
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
 Ben Hutchings <ben.hutchings@codethink.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Den 03-01-2020 kl. 21:23, skrev Linus Torvalds:
> On Fri, Jan 3, 2020 at 11:11 AM Thomas Backlund <tmb@mageia.org> wrote:
>> Does not seem to exist in public git yet, maybe you forgot to push ?
> Not "forgot", but I've pulled a couple of other things, and done my
> usual build tests etc. I tend batch up the pulls and pushes a bit,
> sorry for not making that clear.


Ok.

> But I've pushed it all out now.
>
>             Linus


I got it, thanks

--

Thomas



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
