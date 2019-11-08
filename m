Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5D0F4E07
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Nov 2019 15:24:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87E533C23FB
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Nov 2019 15:24:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 460AD3C181B
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 15:24:38 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 02BB7616643
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 15:24:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9B6FDB391;
 Fri,  8 Nov 2019 14:24:35 +0000 (UTC)
Date: Fri, 8 Nov 2019 15:24:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191108142434.GA5913@rei>
References: <20191101084933.GA14639@dell5510>
 <1572613170-20757-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191107145416.GA25608@rei.lan>
 <3d882118-533e-f3a3-810b-b494f3f734d4@cn.fujitsu.com>
 <807018cc-88cb-eefd-594d-3940bab22765@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <807018cc-88cb-eefd-594d-3940bab22765@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/prctl02: add more error tests
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
> > Ok. I will do it as we usually do.
> 
>  ??I think about it again. The argument of prctl is all unsigned long type. Do we need to use
> pointers to pointers??? Or, move this code to setup function like above?

Just pointer to unsigned long and do the cast in the test setup as:

static unsigned long bad_addr;

static struct tcase = {
	...
	unsigned long *arg3;
	...
} tcases[] = {
	...
	{..., &bad_addr, ...},
	...
}

static void setup(void)
{
	invalid_addr = (unigned long)tst_get_bad_addr();
}

Then call it as prctl(..., *tc->arg3).

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
