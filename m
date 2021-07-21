Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5753D12EC
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 17:55:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E841B3C9778
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 17:55:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A2AF83C6C29
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 17:55:25 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C854E10006D2
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 17:55:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 129BD22578;
 Wed, 21 Jul 2021 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626882924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=koglEnN/R0huNjEwk4E/4VzUr0MG/4oaQKb1IXEmVmE=;
 b=a1z6uST5SZNBcSkdd+AHOCmEuLQvAwk9LiiL5VqiZY+6Rs/b/A9znpom2kjdO6XZWuDoN4
 pQYqPKRT4tH/VDK5ygzfNxZEgg/QA1T+5w/BfEhd304mbbdUyJjhb5EoYbBplJVNhGH18u
 mxxzWxnm0tpO4Tq0I1wCFe5GnljJeUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626882924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=koglEnN/R0huNjEwk4E/4VzUr0MG/4oaQKb1IXEmVmE=;
 b=UsMq05sfZ+91QFQ1DXpZZ36voYJENPl5ZOKbDLJyWM8GsffuRgWUIbY820j6ML3tvpyWV9
 rYfe3zjlqrc1mnDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00BCA139F8;
 Wed, 21 Jul 2021 15:55:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M8OpOmtD+GAdEgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 21 Jul 2021 15:55:23 +0000
Date: Wed, 21 Jul 2021 17:29:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <YPg9dN2GhnncVnQQ@yuki>
References: <20201111163114.GB23576@yuki.lan>
 <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] libs/libltpnewipc/libnewipc.c: Add
 msg_do_reader/msg_do_writer function
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

Hi!
> +void msg_do_reader(long key, int tid, long type, int child, int nreps)
> +{
> +	int i, size;
> +	int id;
> +	struct mbuffer buffer;
> +
> +	id = SAFE_MSGGET(key, 0);
> +	if (id != tid) {
> +		tst_brk(TFAIL,
> +			"Message queue mismatch in the reader of child group %d for message queue id %d ",
> +			child, id);
> +	}

Also looking at how these functions are used, we fork a child that calls
this function then wait it and ignore the exit value it does not make
sense to use tst_brk() here at all.

The tst_brk() is supposed to exit the whole test, including all
suprocesses but that does not work if we throw away the child return
value. This piece of code looks like we exit the whole test here, which
isn't simply true.

So either we should do tst_res(TFAIL, ...) followed by an exit(0) here,
or we should handle the return value in the parent. I.e. stop the test
if one of the children reported a failure.

> +	for (i = 0; i < nreps; i++) {
> +		memset(&buffer, 0, sizeof(buffer));
> +
> +		size = SAFE_MSGRCV(id, &buffer, 100, type, 0);
> +		if (buffer.type != type) {
> +			tst_brk(TFAIL,
> +				"Type mismatch in child %d, read #%d, for message got %ld, exected %ld",
> +				child, (i + 1), buffer.type, type);
> +		}
> +		if (buffer.data.len + 1 != size) {
> +			tst_brk(TFAIL,
> +				"Size mismatch in child %d, read #%d, for message got %d, expected %d",
> +				child, (i + 1), buffer.data.len + 1, size);
> +		}
> +		if (verify(buffer.data.pbytes, (key % 255), size - 1, child)) {
> +			tst_brk(TFAIL,
> +				"Verify failed in child %d read # = %d, key = %lx",
> +				child, (i + 1), key);
> +		}
> +		key++;
> +	}

It would also make sense to do exit(0); here so that we do not have to
repeat that in each test.

> +}
> +
> +void msg_do_writer(long key, int tid, long type, int child, int nreps)
> +{
> +	int i, size;
> +	int id;
> +	struct mbuffer buffer;
> +
> +	id = SAFE_MSGGET(key, 0);
> +	if (id != tid) {
> +		tst_brk(TFAIL,
> +			"Message queue mismatch in the writer of child group %d for message queue id %d",
> +			child, id);
> +	}
> +
> +	for (i = 0; i < nreps; i++) {
> +		memset(&buffer, 0, sizeof(buffer));
> +
> +		do {
> +			size = (lrand48() % 99);
> +		} while (size == 0);
> +		memset(buffer.data.pbytes, (key % 255), size);
> +		buffer.data.len = size;
> +		buffer.type = type;
> +		SAFE_MSGSND(id, &buffer, size + 1, 0);
> +		key++;
> +	}
> +}

And same here.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
