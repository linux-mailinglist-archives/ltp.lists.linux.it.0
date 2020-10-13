Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E462B28C7CA
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Oct 2020 06:23:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F3E13C32F6
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Oct 2020 06:23:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C069D3C0596
 for <ltp@lists.linux.it>; Tue, 13 Oct 2020 06:23:11 +0200 (CEST)
Received: from mo-csw.securemx.jp (mo-csw1515.securemx.jp [210.130.202.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BB56B1A004B4
 for <ltp@lists.linux.it>; Tue, 13 Oct 2020 06:23:06 +0200 (CEST)
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 09D4N0jB003905;
 Tue, 13 Oct 2020 13:23:00 +0900
X-Iguazu-Qid: 34trXB0LGBuke2PBSs
X-Iguazu-QSIG: v=2; s=0; t=1602562980; q=34trXB0LGBuke2PBSs;
 m=EuIHIHuDIrZ6xFcAATDItoBC9aXqX1rBxqWIGX0Y7TU=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
 by relay.securemx.jp (mx-mr1512) id 09D4MxGF024543;
 Tue, 13 Oct 2020 13:22:59 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
 by imx12.toshiba.co.jp  with ESMTP id 09D4MxFu002169;
 Tue, 13 Oct 2020 13:22:59 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
 by enc02.toshiba.co.jp  with ESMTP id 09D4MwEj017483;
 Tue, 13 Oct 2020 13:22:59 +0900
From: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To: <ltp@lists.linux.it>
References: <20201005092029.3482531-1-punit1.agrawal@toshiba.co.jp>
Date: Tue, 13 Oct 2020 13:22:51 +0900
In-Reply-To: <20201005092029.3482531-1-punit1.agrawal@toshiba.co.jp> (Punit
 Agrawal's message of "Mon, 5 Oct 2020 18:20:29 +0900")
X-TSB-HOP: ON
Message-ID: <87d01mdaas.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

[ cc'ing Petr and Cyril ]

Punit Agrawal <punit1.agrawal@toshiba.co.jp> writes:

> When CONFIG_POSIX_MQUEUE is configured off, the mq_notify02 test
> erroneously reports a failure rather than a missing configuration.
>
> Update the test case to call this out separate to the failure case.
>
> Signed-off-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> ---
> Hi,
>
> Noticed the issue while analysing test report on a system with
> CONFIG_POSIX_MQUEUE turned off.
>
> Please cc me on comments as I'm not subscribed to the list.
>
> Thanks,
> Punit
>
>  testcases/kernel/syscalls/mq_notify/mq_notify02.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/mq_notify/mq_notify02.c b/testcases/kernel/syscalls/mq_notify/mq_notify02.c
> index fe59b5a11..e2269cd8e 100644
> --- a/testcases/kernel/syscalls/mq_notify/mq_notify02.c
> +++ b/testcases/kernel/syscalls/mq_notify/mq_notify02.c
> @@ -77,6 +77,8 @@ static void mq_notify_verify(struct test_case_t *test)
>  
>  	if (TEST_ERRNO == test->exp_errno) {
>  		tst_resm(TPASS | TTERRNO, "mq_notify failed as expected");
> +	} else if (TEST_ERRNO == ENOSYS) {
> +		tst_resm(TCONF | TTERRNO, "mq_notify not available (ENOSYS)");
>  	} else {
>  		tst_resm(TFAIL | TTERRNO,
>  			 "mq_notify failed unexpectedly; expected: %d - %s",

If there are no issues with the patch, it would be great to get this
patch merged.

Thanks,
Punit

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
