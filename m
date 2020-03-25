Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 929E1192CFF
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 16:40:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 570983C4BB2
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 16:40:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9A76C3C2312
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 16:40:51 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C8581601252
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 16:40:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15F69AC65;
 Wed, 25 Mar 2020 15:40:50 +0000 (UTC)
Date: Wed, 25 Mar 2020 16:40:48 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200325154048.GB21800@dell5510>
References: <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
 <20200323160415.GC15673@dell5510> <20200324235150.GC4521@yuki.lan>
 <20200324172102.GA1307@dell5510> <20200325015324.GA15127@yuki.lan>
 <CAEemH2doL4m4-TLBBWTHygTRPSTa68dkoAFjZJrDmzrkmgUrSQ@mail.gmail.com>
 <20200325170739.GA2461@yuki.lan> <20200325093427.GA23023@dell5510>
 <20200325100350.GB5404@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325100350.GB5404@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> > > Indeed, there are couple of solutions for that, one of them would have
> > > all the arrays doubled and one of them would list hard requirement while
> > > the other soft requirements. Then we will end up with something as
> > > "need_cmds" and "wants_cmds". The second one would be more or less
> > > informative, the test may print a message "Missing foo command test
> > > coverage will be limited".
> > I was thinking about it and thought that would be too rich API (given there is
> > not that much external dependencies for C tests). But ok, sounds reasonable.

> Well yes, the matrix of options would explode exponentially if we do not
> keep it reasonable, hence we should keep it as simple as possible. So
> unless there is a real need for the wants_cmds I wouldn't add it now.
+1.

> > Also similar use case from shell tests: mostly $TST_NEEDS_CMDS is used,
> > which stop whole testing. But rarely (only in 3 tests and tst_net.sh) is used
> > tst_require_cmds() directly - it's a hard requirement, but it tries to run some
> > test before (or require it only when it's needed - tst_net.sh).
> > But that's bad from metadata point of view (you concentrate on metadata in C,
> > but sooner or later we'll need to handle shell as well).

> Unfortunatelly the whole problem is more complex than set of flags. The
> dependencies are often modified by the system properties, test command
> lline options, etc. Complete solution would need to be a set of
> conditionals or a domain language that would be able to express all
> dependencies. The main problem is that this would soon get too complex
> to a point where people would struggle to write the dependency rules.
OK, I don't know the details for metadata project. I thought that you're
planning to parse struct tst_test to get metadata for C. So my assumption was
that parsing TST_* would be equivalent for shell.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
