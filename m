Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F081193F36
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 13:48:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 090523C4ADD
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 13:48:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F04F43C3367
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 13:48:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 84B702013E5
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 13:48:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC0B9AC50
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 12:48:23 +0000 (UTC)
Date: Thu, 26 Mar 2020 13:48:22 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200326124822.GA27616@dell5510>
References: <20200319162114.3967-1-mdoucha@suse.cz>
 <20200326055639.GA5206@dell5510> <20200326063638.GB5206@dell5510>
 <117b0eb0-984b-eb95-b65e-e92c9a206a95@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <117b0eb0-984b-eb95-b65e-e92c9a206a95@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add test for CVE 2018-1000199
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

> > On some machines I got TBROK, but we probably cannot avoid it. 
> > ptrace08.c:119: BROK: Received unexpected event from child

> Hmm, could you apply the following patch and send me the output from
> those machines?
Sure. On TBROK child received SIGKILL signal (whereas SIGTRAP on TPASS).

NOTE: if I include <sys/wait.h> to get WCOREDUMP obviously it's not
WCOREDUMP(status).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
