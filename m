Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D042D255435
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 08:06:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7CFC23C2E49
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 08:06:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D315A3C2218
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 08:05:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4E19B1401204
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 08:05:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB44BAD6F;
 Fri, 28 Aug 2020 06:06:28 +0000 (UTC)
Date: Fri, 28 Aug 2020 08:05:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200828060554.GB15251@dell5510>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-5-pvorel@suse.cz>
 <b58057275ecdc06bb512d39ea46118197f33c33f.camel@linux.ibm.com>
 <20200827132354.GA20439@dell5510> <20200827135503.GA11990@dell5510>
 <b72657042d13f9b8f30d5bdea7e2d06835e4a1d1.camel@linux.ibm.com>
 <20200827225417.GA29921@dell5510>
 <d6087ee43d18605ee6cdc6b80450b0024af14fb6.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6087ee43d18605ee6cdc6b80450b0024af14fb6.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUSPICIOUS_RECIPS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [LTP v4 4/5] IMA: Add a test to verify measurement of
 certificate imported into a keyring
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi,

> Thanks, Petr.  This works properly.  To remove the "hack", would
> require running the test from "ima", not "ima/tests", but that would
> require fixing how ima_setup.sh is called.   It also would still
> require setting TST_DATAROOT to TST_DATAROOT/$TST_ID.
Let's keep it and suppose people run tests from ima/tests.
This needs to be fixed on LTP side, I have it on my TODO list.

Anything else?
After that I'll work on ima_tpm.sh and after on policy automatic loading.
BTW there are also plans for reboot support [1] [2], that could be used as
workaround for configuration without CONFIG_IMA_READ_POLICY=y and
CONFIG_IMA_WRITE_POLICY=y.

[1] http://lists.linux.it/pipermail/ltp/2020-August/018636.html
[2] http://lists.linux.it/pipermail/ltp/2020-August/018658.html

> Mimi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
