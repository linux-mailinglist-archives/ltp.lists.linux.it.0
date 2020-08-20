Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D6324B7DA
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 13:05:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 560743C2FA2
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 13:05:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7DB913C26C8
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 13:05:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2087060055D
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 13:05:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 906A5B14D;
 Thu, 20 Aug 2020 11:06:19 +0000 (UTC)
Date: Thu, 20 Aug 2020 13:05:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200820110550.GA20024@dell5510>
References: <20200820100238.15925-1-pvorel@suse.cz>
 <20200820104623.GB9000@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820104623.GB9000@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_kvcmp: Fix parsing format for
 /etc/os-release
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Po-Hsu,

> >  	if (access(OSRELEASE_PATH, F_OK) != -1) {
> > -		SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=%s", distname);
> > +		SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=\"%[^\"]\"",
> > +				      distname);

> I guess like opensuse is the only one that uses double quotes there.
> Does this actually work on, for example debian, that has ID=debian in
> the /etc/os-release?
No, sorry for overlooking that.

> I guess that it may be actually easier to optionaly strip the double
> quotes after the scanf().
+1, I'll send v2.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
