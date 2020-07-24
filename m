Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD522C535
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 14:32:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 826243C4CFE
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 14:32:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E01FD3C13D8
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 14:32:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5C9011000A20
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 14:32:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D659CAF73;
 Fri, 24 Jul 2020 12:32:18 +0000 (UTC)
Date: Fri, 24 Jul 2020 14:32:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200724123235.GA3539@yuki.lan>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
 <a83166af3a2b432bb11a0876e18e15705479f32d.1595511710.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a83166af3a2b432bb11a0876e18e15705479f32d.1595511710.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] libs: sigwait: Get rid of REPORT_SUCCESS()
 macro
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  void test_empty_set(swi_func sigwaitinfo, int signo,
>  		    enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
>  {
> @@ -55,7 +22,15 @@ void test_empty_set(swi_func sigwaitinfo, int signo,
>  	child = create_sig_proc(signo, INT_MAX, 100000);
>  
>  	TEST(sigwaitinfo(&sigs, &si, NULL));
> -	REPORT_SUCCESS(-1, EINTR);
> +	if (TST_RET == -1) {
> +		if (TST_ERR == EINTR)
> +			tst_res(TPASS, "%s: Test passed", __func__);
> +		else
> +			tst_res(TFAIL | TTERRNO, "%s: Unexpected failure", __func__);

Can we please make the messages a bit more user friendly?

- the tst_res() already prints line and filename the __func__ is a bit
  redundant

- it also prints PASS/FAIL so we can omit the "Test passed" we can print
  something that describes the testcase instead e.g.
  "Wait interrupted by a signal"

- also in the "Unexpected failure" case we should print which error we
  expected with someting as: tst_res(TFAIL | TTERRNO, "Expected to return EINTER, got");

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
