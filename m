Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5E111E732
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Dec 2019 16:58:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31C363C23AD
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Dec 2019 16:58:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1AF2C3C2399
 for <ltp@lists.linux.it>; Fri, 13 Dec 2019 16:58:48 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 075382009E2
 for <ltp@lists.linux.it>; Fri, 13 Dec 2019 16:58:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 58106AD76
 for <ltp@lists.linux.it>; Fri, 13 Dec 2019 15:58:47 +0000 (UTC)
Date: Fri, 13 Dec 2019 16:58:45 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20191213155845.GA13257@dell5510>
References: <20191126120241.5460-1-mdoucha@suse.cz>
 <20191126120241.5460-3-mdoucha@suse.cz>
 <20191213153933.GB8241@dell5510>
 <e896dee9-4a6d-e5e8-e98b-0fb59a81de77@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e896dee9-4a6d-e5e8-e98b-0fb59a81de77@suse.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] Port test_1_to_1_initmsg_connect (SCTP) to
 new API
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

Hi Martin,

> >> -	tst_resm(TPASS, "connect() with init timeout set to 0 - SUCCESS");
> >> +	if (TST_RET != msglen) {
> >> +		tst_res(TFAIL | TTERRNO, "recv() failed");
> >> +	} else {
> >> +		tst_res(TPASS, "connect() with init timeout set to 0 - SUCCESS");
> > If you don't mind, I'd remove " - SUCCESS" from the message before merge.

> Please do.

Thanks your patch!
Merged with this change and copyright in utils/sctp/func_tests/test_1_to_1_initmsg_connect.c

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
