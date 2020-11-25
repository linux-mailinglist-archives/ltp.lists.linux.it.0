Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C73F32C3EF4
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 12:23:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9788F3C4E3E
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 12:23:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4CFF93C4E34
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 12:23:05 +0100 (CET)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BC0F7200981
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 12:23:04 +0100 (CET)
Date: Wed, 25 Nov 2020 12:23:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606303383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zddgu1xg92Bn0MiOfefrMFIbOQ+hQRLk2ZCm304FhdM=;
 b=acGIuGJbU7UREvLEeYq30k4lzUJv9UeKuL6qFGncJg4C/V0RZp2uVBBRmIcK+bKofALZv1
 E/i+KY42+zjgGgWIhugsxh4pK0+KzhaSx7krPIqWVaI4tBzuG1b0YjzcTWivmnnVgWxTbx
 su45/uFa1s4kTrwltU9qXYpO2UxbVEVDVku3b9N93c58X1QU5q3xnxSKl++4RbkNi2h2wv
 2AzDyIO6MIXYLHTI5ThxytVN4lNv+CMzJeBA55R781I0K/LFybudsUFdcO7SCJ1/O6VI+w
 wA3laoEwlfSFF4yg44bDycmmLFdclEUeYbHB58QerS0Zt2srzq/8EL336DEcbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606303383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zddgu1xg92Bn0MiOfefrMFIbOQ+hQRLk2ZCm304FhdM=;
 b=DLTtjNS3WiGZoyYE4Mj9Ou1emwbzJ/YRBd8P5jF9pfr7kPbZotaSxP0mB8Yozgu/iZNwBs
 fq/R9KQKzyCNkKAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20201125112302.zh6x3hq7wyzqoz66@linutronix.de>
References: <CA+G9fYuKZGaHVvAv=ZwOL_p6UM3YhOHy0DcJRRM_DOLGYXg1Dw@mail.gmail.com>
 <20201124171628.dk6tle5lh3sx2jxg@linutronix.de>
 <20201125004632.GG4327@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125004632.GG4327@casper.infradead.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] kernel BUG at mm/highmem.c:417! invalid opcode: 0000 EIP:
 zero_user_segments
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, vtolkm@googlemail.com,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-mm <linux-mm@kvack.org>, torvalds@linuxfoundation.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@suse.de>,
 Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Yang Shi <shy828301@gmail.com>, LTP List <ltp@lists.linux.it>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020-11-25 00:46:32 [+0000], Matthew Wilcox wrote:
> 
> Thanks for debugging this!  I didn't realise start1 was allowed to be
> less than start2.  Try this ... (systemd is sabotaging my efforts to
> test an i386 kernel)

You are welcome.

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
