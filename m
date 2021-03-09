Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 112AE3321D2
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 10:22:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D51773C5547
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 10:22:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D31413C4BE6
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 10:22:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 695101400F39
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 10:22:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B515EACC6
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 09:22:24 +0000 (UTC)
Date: Tue, 9 Mar 2021 10:22:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YEc+T9Vx838EF7q2@pevik>
References: <20210308154421.2002-1-pvorel@suse.cz> <YEZTd+CT/Gag1ejK@yuki.lan>
 <YEZoCOqGeb4dVnpV@pevik> <YEZs/MTW0Pcyz6Ml@yuki.lan>
 <YEcPvIckAEbmMBi9@pevik> <YEcuh38X83GX1RPL@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEcuh38X83GX1RPL@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] splice02: Generate input in C
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > > That would not work, the pipe is supposed to be in the runtest file.
> > Do you want to test that runtest is working with pipe?

> Yes, that was the original idea behind adding the splice test there.

> > I considered anything but shell script with getopt parameters a bit strange and
> > thought it'd be removed in new shell runner. But obviously you want to keep it.

> We will have to keep the functionality for the time being.

> > But in case of failure script don't detect it. e.g.:

> > echo "SUCCESS" | cat /asdf
> > cat: /asdf: No such file or directory

> > => there is no TFAIL/TBROK/TCONF. Not sure if all users check exit status (which
> > they should now, because that is the only common thing so far).

> Well yes, I guess that we can do something as:

> echo "SUCCESS" | grep -q "SUCCESS"

> Which at least returns 1 if the grep fails.
Yep, that's better than using cat.

Although, IMHO it should be possible to do something like:

shell_test01 echo "SUCCESS" | shell_pipe01.sh

cat shell_pipe01.sh
...
do_test()
{
	tst_res TINFO "expecting SUCCESS string passed from stdin"

	read line
	EXPECT_PASS [ "$line" = "SUCCESS" ]
}

We'd use standard LTP interface with tst_test.sh. WDYT?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
