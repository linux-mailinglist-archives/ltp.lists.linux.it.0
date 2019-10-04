Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 253DFCBBC7
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 15:33:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D63153C2271
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 15:33:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D1EFF3C225E
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 15:33:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 82817140200C
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 15:33:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C249AB194;
 Fri,  4 Oct 2019 13:33:17 +0000 (UTC)
Date: Fri, 4 Oct 2019 15:33:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191004133313.GA7517@rei.lan>
References: <20190927092024.97928-1-lkml@jv-coder.de>
 <20191004103414.GE1231@rei>
 <635c345d-18f8-6f2e-e658-648251d32e65@jv-coder.de>
 <20191004105040.GF1231@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004105040.GF1231@rei>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > No, if no TST_SETUP is defined, the library will not call it.
> > See tst_test.sh:31:
> > if[ -n "$TST_SETUP_STARTED" -a -n "$TST_CLEANUP" -a \
> >  ?????? ???????? -z "$TST_NO_CLEANUP" ]; then
> >  ?????? $TST_CLEANUP
> > fi
> 
> That sounds like a bug in the test library, I will have a look at it
> later on.

I've created GitHub issue #586 so that we do not forget to deal with
this, see https://github.com/linux-test-project/ltp/issues/586

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
