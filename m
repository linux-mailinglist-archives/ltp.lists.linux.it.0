Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5014A146928
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 14:33:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05CFB3C24D7
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 14:33:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4CDFA3C2495
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 14:33:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B7C7C1A017BB
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 14:33:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1C7A5AC92;
 Thu, 23 Jan 2020 13:33:40 +0000 (UTC)
Date: Thu, 23 Jan 2020 14:33:39 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <20200123133339.GC6762@rei.lan>
References: <20200122134239.28844-1-jcronenberg@suse.de>
 <a8618b2e-067c-9a66-02e7-3feceec1ff9c@cn.fujitsu.com>
 <2cfda6ff-b02f-00c4-b256-eeded0d3edda@suse.de>
 <7946b1f4-a005-63ee-505f-f7b31d0893f9@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7946b1f4-a005-63ee-505f-f7b31d0893f9@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add timeout to TST_PROCESS_STATE_WAIT
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
> >> We have tst_process_state_wait2 since commit dbf270c5 ("lib: Add
> >> tst_process_state_wait2()"), this api has same functions as
> >> tst_process_state_wait but only return error instead of TBROK.
> >>
> >> I think using TST_PROCESS_STATE_WAIT2 is confused and we can only expand
> >> tst_process_state_wait make it support sleep specifying in milliseconds.
> >>
> >> Best Regards
> >> Yang Xu
> > 
> > I don't think I quite understand what you mean. I can see that using
> > TST_PROCESS_STATE_WAIT2 is confusing. But I didn't want to touch the
> > existing TST_PROCESS_STATE_WAIT to ensure all older tests still run the
> > same. Are you saying i should go through all tests that use
> > TST_PROCESS_STATE_WAIT and specify that they use a timeout of 0(which
> > according to a git grep doesn't seem too many, so it wouldn't be too
> > much effort) and then change TST_PROCESS_STATE_WAIT to include a timeout
> Yes.
> > or should I just rename TST_PROCESS_STATE_WAIT2 to something that
> > seperates it more from tst_process_state_wait2?
> Also, I am fine with the second way. Let we listen cyril's advise.
> @Cyril What do you think about it?

Well that function is only supposed to be used from the old API while
the macro is defined for the new API so they are never exported at the
same time.

On the other hand we can change these few testcases quite easily, so we
may as well do that.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
