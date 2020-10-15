Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DBC28F2A7
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:48:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D179A3C3261
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:48:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E1BC93C2412
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 11:59:46 +0200 (CEST)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6F5C21001426
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 11:59:46 +0200 (CEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1602755983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PlevN6yVm2HnwK034FXsfndh/959DVQqNZzufhIKA04=;
 b=MUall/o1Ep8FjtYpBzVZioQvmMADRw3NIf1+4jtH439kFEfQO7IzV5DdgPPCuGe2H9dcGg
 kuu4rqtx+yhEcLgMy77E1udhVGeD1SpMD6+LIqDmauOIw/EzjDa5bySQgnqsejbxLWB3TI
 zewbm0x4K1tJDEVb0E7B3pReYa+RFBME9ESzd3mAC9KkGi+vLmrdRk2rcJVFoSUvmYyDoG
 vtDgcaxRqaQ3+XQL9exk1Nfn+io2ZeTAxqvet3P6eKF1KDU75BbTTuenrT6Qjkz4Dh3QFo
 McKE19QQLuWbQTNXsHTndMUA3JAixGCJVy472NJCg1EkDdciYAR0CS1bGMeMOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1602755983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PlevN6yVm2HnwK034FXsfndh/959DVQqNZzufhIKA04=;
 b=z7V9dWcnjheORrqANNNbcItCw4NhNMjaxJ1idCJ71t24jY3QPie81gGDA7E7nctNIdESAb
 3zo7jyQ72+1K7TCQ==
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Petr Mladek <mladek.petr@gmail.com>
In-Reply-To: <20201015063137.GA3668@jagdpanzerIV.localdomain>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
 <20201014140514.GB17231@alley> <20201014151311.GB13775@alley>
 <20201014175051.GC13775@alley>
 <20201015063137.GA3668@jagdpanzerIV.localdomain>
Date: Thu, 15 Oct 2020 12:05:42 +0206
Message-ID: <875z7bhks1.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=7.0 tests=BUG6152_INVALID_DATE_TZ_ABSURD,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
 INVALID_DATE_TZ_ABSURD,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 15 Oct 2020 14:48:33 +0200
Subject: Re: [LTP] [PATCH] printk: ringbuffer: Wrong data pointer when
 appending small string
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020-10-15, Sergey Senozhatsky <sergey.senozhatsky@gmail.com> wrote:
>> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
>> index 2493348a1631..24a960a89aa8 100644
>> --- a/kernel/printk/printk_ringbuffer.c
>> +++ b/kernel/printk/printk_ringbuffer.c
>> @@ -1125,7 +1125,10 @@ static char *data_realloc(struct printk_ringbuffer *rb,
>>  
>>  	/* If the data block does not increase, there is nothing to do. */
>>  	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
>> -		blk = to_block(data_ring, blk_lpos->begin);
>> +		if (wrapped)
>> +			blk = to_block(data_ring, 0);
>> +		else
>> +			blk = to_block(data_ring, blk_lpos->begin);
>>  		return &blk->data[0];
>>  	}
>
> Great catch.

Indeed. I don't know how we missed that one. :-/

Reviewed-by: John Ogness <john.ogness@linutronix.de>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
