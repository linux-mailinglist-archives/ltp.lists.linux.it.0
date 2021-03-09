Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E07833204B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 09:13:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DE5C3C5537
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 09:13:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A2B743C3236
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 09:13:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D893D6002A7
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 09:13:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2699AAC1F;
 Tue,  9 Mar 2021 08:13:21 +0000 (UTC)
Date: Tue, 9 Mar 2021 09:15:03 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YEcuh38X83GX1RPL@yuki.lan>
References: <20210308154421.2002-1-pvorel@suse.cz> <YEZTd+CT/Gag1ejK@yuki.lan>
 <YEZoCOqGeb4dVnpV@pevik> <YEZs/MTW0Pcyz6Ml@yuki.lan>
 <YEcPvIckAEbmMBi9@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEcPvIckAEbmMBi9@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: Martin Loviska <mloviska@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > That would not work, the pipe is supposed to be in the runtest file.
> Do you want to test that runtest is working with pipe?

Yes, that was the original idea behind adding the splice test there.

> I considered anything but shell script with getopt parameters a bit strange and
> thought it'd be removed in new shell runner. But obviously you want to keep it.

We will have to keep the functionality for the time being.

> But in case of failure script don't detect it. e.g.:
> 
> echo "SUCCESS" | cat /asdf
> cat: /asdf: No such file or directory
> 
> => there is no TFAIL/TBROK/TCONF. Not sure if all users check exit status (which
> they should now, because that is the only common thing so far).

Well yes, I guess that we can do something as:

echo "SUCCESS" | grep -q "SUCCESS"

Which at least returns 1 if the grep fails.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
