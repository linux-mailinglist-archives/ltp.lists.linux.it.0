Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B807308D32
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:21:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3973E3C7808
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:21:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 671D03C015C
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:21:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CA13D601D1F
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:21:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21A54B0D0;
 Fri, 29 Jan 2021 19:21:35 +0000 (UTC)
Date: Fri, 29 Jan 2021 20:21:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YBRgPVveeXKelvWb@pevik>
References: <20210129121817.12563-1-pvorel@suse.cz>
 <20210129121817.12563-4-pvorel@suse.cz> <YBQzlEoPLUAT3NFi@yuki.lan>
 <YBRM7w0dNypJm2tD@pevik> <YBRVIRfgCPD+GA4b@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBRVIRfgCPD+GA4b@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] zram01.sh: Check properly mkfs.* dependencies
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

> Hi!
> > > Also I'm confused how this is supposed to work, we do limit the dev_num
> > > but the zram_filesystems is untouched? That isn't going to work right.
> > It actually works due this check in functions it uses:
> > [ $i -eq $dev_num ] && break
> > (maybe more readable to use -ge ).

> So if we have ext3 unsupported we will loop over ext3, ext4 and xfs
> there and break just before btrfs?
Well, sending rewritten implementation.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
