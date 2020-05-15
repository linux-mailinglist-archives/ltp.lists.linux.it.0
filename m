Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FFB1D453B
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 07:29:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBC033C53C0
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 07:29:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3275E3C5396
 for <ltp@lists.linux.it>; Fri, 15 May 2020 07:29:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A2A141001848
 for <ltp@lists.linux.it>; Fri, 15 May 2020 07:29:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E44BAED9;
 Fri, 15 May 2020 05:29:41 +0000 (UTC)
Date: Fri, 15 May 2020 07:29:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200515052936.GA5117@dell5510>
References: <20200514172831.27854-1-vikas.kumar2@arm.com>
 <20200514172831.27854-2-vikas.kumar2@arm.com>
 <20200515040849.yu27rdihdih5wxc3@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515040849.yu27rdihdih5wxc3@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 1/1] syscall: Add io_uring test
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
Cc: Vikas Kumar <vikas.kumar2@arm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> On 14-05-20, 22:58, Vikas Kumar wrote:
> > Added Linux asynchronous I/O API Test for io_uring_setup(),
> > io_uring_register() and io_uring_enter().
> > This test will check io_uring api basic operation.

> > Signed-off-by: Vikas Kumar <vikas.kumar2@arm.com>
> > Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> Please don't do this unless someone gave you this explicitly.
+1. By this you say Cyril considered your patch ready, which is not true.
Just on a brief look I see there needed to be some changes.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
