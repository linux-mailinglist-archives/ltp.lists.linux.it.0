Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5006264825
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 16:43:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7CE233C527D
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 16:43:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1A1C93C2BFD
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 16:43:29 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A76606006D9
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 16:43:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D4EDB33A;
 Thu, 10 Sep 2020 14:43:43 +0000 (UTC)
Date: Thu, 10 Sep 2020 16:43:57 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200910144357.GA10114@yuki.lan>
References: <20200909175707.10670-1-amir73il@gmail.com>
 <20200910112730.GA7194@dell5510>
 <CAOQ4uxjAwQcmSnsJ5=O88bi2zxAzAe8uXCgg4+5mF6qOmSBfGQ@mail.gmail.com>
 <CAOQ4uxi3fv-ONsJoXYwTh2iP5fM2Ssj7GgcrzcEGRtsEbYgNLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxi3fv-ONsJoXYwTh2iP5fM2Ssj7GgcrzcEGRtsEbYgNLw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/10] Fanotify tests for v5.9
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Sure I did not know about tst_parse_kver() I will send a patch.
> >
> > BTW, sorry for the wrong commit id in the test.
> > Your fix missed removing the old commit from comment:
> >
> >   * Test cases #17-#23 are regression tests for commit:
> >   *
> >   *     497b0c5a7c06 fsnotify: send event to parent and child with single...
> >   *     eca4784cbb18 fsnotify: send event to parent and child with single...
> >   */
> >
> 
> Actually, I don't see any examples of tests that use tst_kvcmp()

It's tst_kvercmp() the tst_kvcmp() is internal library function that
shouldn't be used in testcases.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
