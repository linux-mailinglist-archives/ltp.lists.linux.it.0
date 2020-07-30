Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ACB232F7C
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 11:27:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B31373C2617
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 11:27:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0EA703C093E
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 11:27:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8E9E21A023A3
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 11:27:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E23AAC20;
 Thu, 30 Jul 2020 09:27:54 +0000 (UTC)
Date: Thu, 30 Jul 2020 11:28:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200730092802.GA3457@yuki.lan>
References: <20200722125946.GA22573@yuki.lan>
 <1595556357-29932-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595556357-29932-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200729113946.GB7152@yuki.lan>
 <924c3fc1-c56c-a752-0720-bb12d6cf8ec0@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <924c3fc1-c56c-a752-0720-bb12d6cf8ec0@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] syscalls/ioctl_loop05: Using
 LOOP_CONFIGURE to set direct io
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
> > So I guess that we will have to write a parser that reads that
> > information line by line after all.
> I doubt how machies will have more or zero fields in (7). But I think 
> you are right,

Well that's what I do have here.

> How about using the (3) field and second to last field. Then we can 
> avoid zero or more filed in (7). the code as below??

Actually looking into util-linux code it says that th the optional
fields are terminated with " - ", see:

https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/libmount/src/tab_parse.c#n177

So I guess the safest option would be:

* Match the line by major:minor as you do
* Then strstr() for " - " should land us directly to field (8)

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
