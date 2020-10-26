Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD51C298712
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 07:46:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6CB023C312B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 07:46:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 735F73C257F
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 07:46:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EBA811A008BF
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 07:46:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5FE0ACA3;
 Mon, 26 Oct 2020 06:46:26 +0000 (UTC)
Date: Mon, 26 Oct 2020 07:46:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201026064625.GB21306@dell5510>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
 <20201015122056.20715-2-alexey.kodanev@oracle.com>
 <20201020143940.GB23197@dell5510>
 <711809cc-28c3-a51d-72a2-6d3f64db0a1c@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <711809cc-28c3-a51d-72a2-6d3f64db0a1c@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] lib/tst_net: calc mean in tst_netload()
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

Hi Alexey,

...
> >> +	if [ "$run_cnt" -lt 2 ]; then
> > maybe: if [ "$run_cnt" -lt 1 ]; then

> > BTW we should also check all numeric variables (TST_NETLOAD_CLN_REQUESTS, ...)
> > with tst_is_int (but don't bother with it now).

> >> +		run_cnt=1
> >> +		was_failure=1
> > Hm, $was_failure set before loop. Shouldn't it be inside for i in $(seq 1
> > $run_cnt); do loop? And updated on each failure (be a error counter, not boolean)?


> It is set to 1 for the special case, i.e. when run_cnt is 1, in that case
> we should tbrok the test at once. I don't see how the error counter will be
> better?

I'm sorry, I just misinterpret the code, please ignore my comment.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
