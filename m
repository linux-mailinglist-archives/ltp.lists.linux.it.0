Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B3CB8A6
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 12:50:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81FE03C2216
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 12:50:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 973163C2152
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 12:50:42 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 816F8200AE1
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 12:50:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D32BBB198;
 Fri,  4 Oct 2019 10:50:40 +0000 (UTC)
Date: Fri, 4 Oct 2019 12:50:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191004105040.GF1231@rei>
References: <20190927092024.97928-1-lkml@jv-coder.de>
 <20191004103414.GE1231@rei>
 <635c345d-18f8-6f2e-e658-648251d32e65@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <635c345d-18f8-6f2e-e658-648251d32e65@jv-coder.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lsmod01: Add kernel module
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > If you define the cleanup in TST_CLEANUP the library will call it for
> > you, do not call it yourself here.
> 
> No, if no TST_SETUP is defined, the library will not call it.
> See tst_test.sh:31:
> if[ -n "$TST_SETUP_STARTED" -a -n "$TST_CLEANUP" -a \
>  ?????? ???????? -z "$TST_NO_CLEANUP" ]; then
>  ?????? $TST_CLEANUP
> fi

That sounds like a bug in the test library, I will have a look at it
later on.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
