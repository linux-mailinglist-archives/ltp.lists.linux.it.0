Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAB626D960
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 12:45:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF4153C2B3E
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 12:45:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5C5433C13D9
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 12:45:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C1940600850
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 12:45:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2A36ABAD
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 10:46:20 +0000 (UTC)
References: <CY4PR13MB117565A7BA2A8371A3B94ED9FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
 <20200916071106.GB1433@dell5510> <20200916085405.GB4464@yuki.lan>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20200916085405.GB4464@yuki.lan>
Date: Thu, 17 Sep 2020 11:45:45 +0100
Message-ID: <87sgbgy946.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] TPASS in new test lib
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> Although leaving this to Cyril (although having T prefix or not is quite
>> cosmetic, he had a reason to omit it).  Also there is ongoing rewrite of tests
>> still using legacy API to use new API, thus the inconsistency will disappear in
>> the long term.
>> 
>> IMHO: don't care that much about legacy API, but synchronize new C and shell
>> API.
>
> I do not care that much here, but I do not think that we should expect
> exact test output unless we have specified it somewhere.
>
> -- 
> Cyril Hrubis
> chrubis@suse.cz

It would be possible to output something like TAP and allow it to be set
at compile time.

Infact it should be possible to print JSON, xUnit or whatever
snippets. We could also print the meta data for each test at the
begining which would work quite well with structured formats.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
