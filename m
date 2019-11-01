Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B3AEBFEF
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 09:49:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 271103C249A
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 09:49:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C5BEA3C246C
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 09:49:38 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3ADB910009F5
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 09:49:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C58FB237;
 Fri,  1 Nov 2019 08:49:36 +0000 (UTC)
Date: Fri, 1 Nov 2019 09:49:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191101084933.GA14639@dell5510>
References: <1572007183-13661-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1572512347-30116-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572512347-30116-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/prctl02: add more error tests
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

Hi Xu,

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

>  static struct tst_test test = {
>  	.tcnt = ARRAY_SIZE(tcases),
>  	.test = verify_prctl,
> +	.caps = (struct tst_cap []) {
> +		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
> +		TST_CAP(TST_CAP_DROP, CAP_SETPCAP),
This fails on some old distros (Debian stable [1], CentOS 6 [2]),
but also on new (Fedora latest [3]):

undeclared identifier 'CAP_SETPCAP'

Could you please setup travis for your LTP fork and validate builds before
posting to ML?

BTW it'd be nice to have this feature in our patchwork [4], but not sure if this
is available and configurable on our patchwork instance (we don't host it).

Kind regards,
Petr

[1] https://travis-ci.org/pevik/ltp/jobs/605881703
[2] https://travis-ci.org/pevik/ltp/jobs/605881705
[3] https://travis-ci.org/pevik/ltp/jobs/605881704
[4] https://github.com/linux-test-project/ltp/issues/599

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
