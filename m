Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1B133256E
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 13:24:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19A4A3C6A91
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 13:24:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 200473C4C02
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 13:24:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9B8C914010E0
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 13:24:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF582ACBF
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 12:24:27 +0000 (UTC)
Date: Tue, 9 Mar 2021 13:26:10 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YEdpYimUgk2j+ICb@yuki.lan>
References: <20210308154421.2002-1-pvorel@suse.cz> <YEZTd+CT/Gag1ejK@yuki.lan>
 <YEZoCOqGeb4dVnpV@pevik> <YEZs/MTW0Pcyz6Ml@yuki.lan>
 <YEcPvIckAEbmMBi9@pevik> <YEcuh38X83GX1RPL@yuki.lan>
 <YEc+T9Vx838EF7q2@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEc+T9Vx838EF7q2@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Well yes, I guess that we can do something as:
> 
> > echo "SUCCESS" | grep -q "SUCCESS"
> 
> > Which at least returns 1 if the grep fails.
> Yep, that's better than using cat.
> 
> Although, IMHO it should be possible to do something like:
> 
> shell_test01 echo "SUCCESS" | shell_pipe01.sh
> 
> cat shell_pipe01.sh
> ...
> do_test()
> {
> 	tst_res TINFO "expecting SUCCESS string passed from stdin"
> 
> 	read line
> 	EXPECT_PASS [ "$line" = "SUCCESS" ]
> }
> 
> We'd use standard LTP interface with tst_test.sh. WDYT?

Well we have to figure out where to put the dummy test, but other than
that no complaints. Also please put that change in a separate commit.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
