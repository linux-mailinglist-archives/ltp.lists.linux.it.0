Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 719C3E03E0
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 14:31:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB8013C22B0
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 14:31:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1B0A83C181B
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 14:31:47 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 88DEE1401739
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 14:31:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EEC78B2DE;
 Tue, 22 Oct 2019 12:31:44 +0000 (UTC)
Message-ID: <1571747504.24936.2.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Tue, 22 Oct 2019 14:31:44 +0200
In-Reply-To: <20191022080830.GA17235@dell5510>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-5-cfamullaconrad@suse.de>
 <20191022080830.GA17235@dell5510>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/5] Add newlib shell test for
 tst_multiply_timeout()
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
Reply-To: cfamullaconrad@suse.com
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 2019-10-22 at 10:08 +0200, Petr Vorel wrote:
> Hi,
> 
> > +do_test()
> > +{
> > +	LTP_TIMEOUT_MUL=2
> > +	local sec=1
> > +
> > +	call_it 'tst_multiply_timeout sec' 'sec' 2
> 
> still some issue with this patchset. Making the function private
> (_tst_multiply_timeout), we obviously get warning:
> test_timeout_mul 1 TWARN: Private variable or function
> _tst_multiply_timeout used!
> 
> Unless we want to to add some special variable for library tests
> (i.e. TST_IGNORE_WARN), the function cannot be used directly
> 
> I suggest to push the patchset change to use float (not to be
> postponed even
> more), but without this patchset. Tests should be later added.

+1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
