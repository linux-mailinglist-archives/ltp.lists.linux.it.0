Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B73D0E06
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 13:53:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F28D3C2026
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 13:53:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 39BD03C136E
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 13:53:31 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6D739140199B
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 13:53:31 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 76B309F679;
 Wed,  9 Oct 2019 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570622010; bh=p8TWS3UdBjsuTR2BMs2hKwDLguu7MBT9bqZfK8cDQNI=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=lgKlhpZcXdaAv7EouhJU4f2JWlDTPrZvy7SgM5lqPCU2OFezsMgQtbf/OkcOsPWbM
 XQ/Qx/1+oKa8TFRWdrWoeYBs3NSbr7NzNPQKdw5mb2N4QJEfye9RpbwggqA3EBBHHJ
 O9dqqOFuP41HMgJ0k5xid8kjgg5rEBfxcTNhDZ5g=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191009061619.48677-1-lkml@jv-coder.de>
 <20191009061619.48677-3-lkml@jv-coder.de> <20191009113919.GB7561@rei.lan>
 <64bb824c-d577-86e5-bfa5-17a8cfbf4174@jv-coder.de>
 <20191009114854.GC7561@rei.lan>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <22bc4865-295c-3147-8e26-f258fac472f8@jv-coder.de>
Date: Wed, 9 Oct 2019 13:53:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191009114854.GC7561@rei.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] tst_test.sh: Add public tst_test_root command
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


>>> Can we keep the name to be tst_require_root() please?
>>>
>>> Historically this function has been always named like this in LTP.
>>>
>> Not a very good argument for two reasons:
>> 1. The function was internal to the library, so no one (except for
>> library developers)
> It has been in a public API for the old library for more than ten years
> before the new library was written.
Has been, but is not anymore. But I accept it as an argument.
>
>> 2. I wanted to make it consistent with other functions, that do similar
>> stuff like
>>   ???? tst_test_drivers and tst_test_cmds. Both also call tst_brk in case
>> of unsuccessful tests.
> Well I do not like these names either, it's less descriptive that it
> would have been with tst_require_cmds and tst_require_drivers, so if
> anything I would be for renaming the tst_test_* ones.
Fair enough, that makes sense. But then we require a change to 
tst_test_* first,
otherwise the api names are inconsistent. And I'm not sure if changing the
other functions is really worth it.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
