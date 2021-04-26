Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CF336B58B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 17:15:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA5DA3C66F9
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 17:15:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E5EF93C27BB
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 17:15:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 79A44600835
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 17:15:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8272AB87;
 Mon, 26 Apr 2021 15:15:51 +0000 (UTC)
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-3-rpalethorpe@suse.com>
 <CAEemH2ejA9kY2P4HsYEds3g9AjzFQ4mDRuWiF2176istdOMtaA@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>, Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <CAEemH2ejA9kY2P4HsYEds3g9AjzFQ4mDRuWiF2176istdOMtaA@mail.gmail.com>
Date: Mon, 26 Apr 2021 16:15:51 +0100
Message-ID: <87o8e1m5zs.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/7] API: Add macro for the container_of trick
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
Reply-To: rpalethorpe@suse.de
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Li Wang <liwang@redhat.com> writes:

> Richard Palethorpe <rpalethorpe@suse.com> wrote:
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>>
> Reviewed-by: Li Wang <liwang@redhat.com>
>
>
>> ---
>>  include/tst_common.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/include/tst_common.h b/include/tst_common.h
>> index fd7a900d4..317925d1d 100644
>> --- a/include/tst_common.h
>> +++ b/include/tst_common.h
>> @@ -83,4 +83,9 @@
>>  #define TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(condition) \
>>         TST_BUILD_BUG_ON(condition)
>>
>> +#define tst_container_of(ptr, type, member) ({              \
>> +       const typeof( ((type *)0)->member ) *__mptr = (ptr); \
>> +       (type *)( (char *)__mptr - offsetof(type,member) );  \
>> +})
>>
>
> I'd suggest defining it as uppercase 'TST_CONTAINER_OF(...)' to respect
> other macro's naming policy in tst_common.h.

I don't mind either way. I suspect it is lower case to match offsetof
and maybe it is expected to become a compiler intrinsic. Perhaps we
should remove the tst_. WDYT Cyril??

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
