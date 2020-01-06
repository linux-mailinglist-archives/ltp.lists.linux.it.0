Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A548131437
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 15:58:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B384D3C24C2
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 15:58:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3A5F43C2467
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 15:57:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 440D8600F42
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 15:57:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4357BAD5B
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 14:57:57 +0000 (UTC)
Date: Mon, 6 Jan 2020 15:57:55 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200106145755.GA26880@rei.lan>
References: <20191213125435.GB20795@rei.lan>
 <88bb51a8-731c-8532-130d-8a4e88654e04@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88bb51a8-731c-8532-130d-8a4e88654e04@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] LTP Release plans
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
> > As usuall if there are any patches that should included in the release,
> > just reply to this mail and I will try to review them once I'm back.
> 
> I'd like to include the fix for SCTP test_1_to_1_initmsg_connect (mostly
> a simple API port with minor additions).

This has been handled already.

> I also need some feedback for my proposal to change the test scenario in
> fallocate05 (from anyone). I'll need a few days to submit a new patch so
> the sooner the better. I'd really like to get the final fallocate05
> patch into the new release.

Acked by Jan, I will have a look ASAP.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
