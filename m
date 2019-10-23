Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E3E174E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 12:05:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9308C3C22BF
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 12:05:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5A3693C224D
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 12:05:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 268AE14016F7
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 12:05:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4280BB49E;
 Wed, 23 Oct 2019 10:05:35 +0000 (UTC)
Date: Wed, 23 Oct 2019 12:05:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiang Li <lixian@qti.qualcomm.com>
Message-ID: <20191023100534.GA17426@rei.lan>
References: <0641c15377874db893088e4f65102ec6@aptaiexm02f.ap.qualcomm.com>
 <20191022121222.GA15798@rei>
 <382857de8dca46e996b06ceb482cb911@apsanexr02f.ap.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <382857de8dca46e996b06ceb482cb911@apsanexr02f.ap.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Bug report in read_all.c
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Thanks for Richard's suggestion. I've put it in the patch.
> Please check the attached patch file for review. 

Pushed.

I've adjusted the commit message and got rid of the trailing whitespaces
in the patch as well.

Also as Ritchie said, patches are usually send inline and not as
attached, and this could be done with git send-email.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
