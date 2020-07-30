Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D8423396D
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 21:59:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA1973C4C90
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 21:58:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2ACF53C059F
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 21:58:56 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8215360196E
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 21:57:31 +0200 (CEST)
Received: from localhost.localdomain
 (pool-96-246-152-186.nycmny.fios.verizon.net [96.246.152.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91B6C20656;
 Thu, 30 Jul 2020 19:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596139133;
 bh=x5Z5Lcy+lf5VlE+mnhIdU70vykDcR9T41o85m5TGRC4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=d5K8FZnF+X3fFCVHtPjw/TcDLxsBZkNTAvWve/b1YLOaZrm/SKsWT3wYbzTuJT/91
 a9V+SS+PhWAoqFWD0OW9AJ82V+nZFUGksmmtGAezpAQoRLQvuM8czrXGeo7UM8TXZd
 BILb2kAJd5dwdCvsLiIpDCoZuDTrwQFnFhQugC7E=
Message-ID: <1596139131.25003.14.camel@kernel.org>
From: Mimi Zohar <zohar@kernel.org>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Thu, 30 Jul 2020 15:58:51 -0400
In-Reply-To: <20200728001301.31121-1-pvorel@suse.cz>
References: <20200728001301.31121-1-pvorel@suse.cz>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 4/4] IMA: Add test for kexec cmdline measurement
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 2020-07-28 at 02:13 +0200, Petr Vorel wrote:
> From: Lachlan Sneff <t-josne@linux.microsoft.com>
> 
> IMA policy can be set to measure the command line passed in the kexec
> system call. Add a testcase that verifies that the IMA subsystem
> correctly measure the cmdline specified during a kexec.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
> [ pvorel: improved setup, various LTP API cleanup ]
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Thanks, really nice.

Missing is a short comment explaining the reason for the multiple
tests.

> +test()
> +{
> +	case $1 in
> +	1) kexec_test '--reuse-cmdline';;
> +	2) kexec_test '--append' 'foo';;
> +	3) kexec_test '--command-line' 'bar';;
> +	esac
> +}
> +
> +tst_run


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
