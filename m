Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E4B28D7A0
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 02:44:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC4403C5835
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 02:44:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A69C03C2594
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 02:44:18 +0200 (CEST)
Received: from mo-csw.securemx.jp (mo-csw1515.securemx.jp [210.130.202.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 21F141400189
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 02:44:13 +0200 (CEST)
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 09E0i8h6028696;
 Wed, 14 Oct 2020 09:44:08 +0900
X-Iguazu-Qid: 34trXB0LGDM6pLRGbo
X-Iguazu-QSIG: v=2; s=0; t=1602636248; q=34trXB0LGDM6pLRGbo;
 m=YyOYmMr9bnSPpxDwJQuaNWLTxX/fnvYUgzg8kIJAZyw=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1510) id 09E0i7bd036769;
 Wed, 14 Oct 2020 09:44:07 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 09E0i7vb013856;
 Wed, 14 Oct 2020 09:44:07 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.toshiba.co.jp  with ESMTP id 09E0i6Va030488;
 Wed, 14 Oct 2020 09:44:06 +0900
From: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To: Cyril Hrubis <chrubis@suse.cz>
References: <20201005092029.3482531-1-punit1.agrawal@toshiba.co.jp>
 <20201013122555.GC29925@yuki.lan>
Date: Wed, 14 Oct 2020 09:44:05 +0900
In-Reply-To: <20201013122555.GC29925@yuki.lan> (Cyril Hrubis's message of
 "Tue, 13 Oct 2020 14:25:55 +0200")
X-TSB-HOP: ON
Message-ID: <871ri1d4bu.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mq_notify: Don't fail if mq_notify is
 not supported
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

Hi Cyril,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> +	} else if (TEST_ERRNO == ENOSYS) {
>> +		tst_resm(TCONF | TTERRNO, "mq_notify not available (ENOSYS)");
>
> Pushed with a minor change, removed the ENOSYS from the string since it
> will be printed because of the TTERRNO flag, thanks.

I see the committed patch. Thanks for fixing it up.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
