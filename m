Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF9814687A
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 13:56:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAF873C24C7
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 13:56:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 53D4A3C249A
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:56:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CEBDA6012A0
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:56:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D5B35B24C;
 Thu, 23 Jan 2020 12:56:32 +0000 (UTC)
Date: Thu, 23 Jan 2020 13:56:32 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <20200123125600.GA6762@rei.lan>
References: <20200121151342.GD6337@rei>
 <1579670796-21233-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200123111347.GE27845@rei>
 <0b715eaf-cb87-8604-a305-5443f4741c9f@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b715eaf-cb87-8604-a305-5443f4741c9f@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/add_key01: test the length of payload
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
> I don't run this test under an unpriviledged user. Seeing keyrings 
> manpages, it said "
> /proc/sys/kernel/keys/maxbytes (since Linux 2.6.26)
> This  is  the  maximum  number of bytes of data that a 	nonroot user can 
> hold in the payloads of the keys owned by theuser.
> The default value in this file is 20,000.

Hmm, that means that we should write a test for this limit as well.

> I perfer to add .needs_root in this flag and check this in a new case.
> What do you think about it?

Sounds good, I was thinking the same. So I will fix this and a few minor
things as well and push this patch.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
