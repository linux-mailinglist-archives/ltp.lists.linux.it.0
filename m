Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFE3B98B9
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Sep 2019 23:00:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B52003C1C7B
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Sep 2019 23:00:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A00533C181E
 for <ltp@lists.linux.it>; Fri, 20 Sep 2019 23:00:30 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 64C2514011B7
 for <ltp@lists.linux.it>; Fri, 20 Sep 2019 23:00:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6E737AF3E;
 Fri, 20 Sep 2019 21:00:28 +0000 (UTC)
Message-ID: <1568987303.3024.7.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
In-Reply-To: <20190919135043.14359-1-pvorel@suse.cz>
References: <20190919135043.14359-1-pvorel@suse.cz>
Date: Fri, 20 Sep 2019 15:48:23 +0200
Mime-Version: 1.0
X-Mailer: Evolution 3.26.6 
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/3] shell: Introduce TST_TIMEOUT variable
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
Reply-To: cfamullaconrad@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Thu, 2019-09-19 at 15:50 +0200, Petr Vorel wrote:
> Hi,
> 
> changes v2->v3:
> * cast to int if awk is not available (Li) instead of TCONF
> * actually round variable (with 0.5) (Clemens)
> * fix variable description (Clemens)

Patchset looks good to me! Well done!

> * add 2 tests for TST_TIMEOUT (it'd be more useful to test
>   LTP_TIMEOUT_MUL, but I'd wait for Christian's shell test
>   patch [1] being merged)

lets place them in `lib/newlib_tests/shell/testcases` as Christian is
doing and add the `# output: ` tag so it might work then.
Or lets place them in a separate Patchset which we can merge after [1].


> [1] https://patchwork.ozlabs.org/patch/1151766/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
