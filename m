Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 31794B00147
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jul 2025 14:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1752149512; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=Eh/Cl6T0iFctLG8LZxby2SsU/ToJpO3MERrDJnQOfuo=;
 b=U49sgzqBafp96U0HcjDc2VQRdTQFHkp8haFK1HVnO4nucjb9Q2swcW9sZGSBwMYaIRZof
 nLdy1Zen8fFoxjwQFQOjmW/qvuXGKtjYRVaw3FgENV8NuXB9xfHIxsu5jWYkuJYmYIJr0c9
 2FosgVZxjmkeV5I4TuhX0g8peXjBbQg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E189F3CB00C
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jul 2025 14:11:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A38D13C647F
 for <ltp@lists.linux.it>; Thu, 10 Jul 2025 14:11:39 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C59DC1A00359
 for <ltp@lists.linux.it>; Thu, 10 Jul 2025 14:11:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA1A35C5CA7;
 Thu, 10 Jul 2025 12:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542F3C4CEE3;
 Thu, 10 Jul 2025 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752149494;
 bh=tUT68e6Q8IKXdlF8aaRcx77PZdPTzcKSQIzQYR02AQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LBTOtfAUyAstWFgBpC3YlBfuVTH2LN/6eBNw78s78xfUv8B9xnZsW+VCHie78Q2Ky
 VaeNylNO5zv18Tt/Zh4b7F0MzuhM/I112yMqoKXyjrqh/9FElF2Y6VSNszxiHVE/SP
 3PwaQOl6GqFEhUDxCgoJisX/s6CHUR9hd6/xnRUSlrFeCX1U/Si0GlGyJUqj1GiUfX
 SXLLakzuEdaAoypuL3tHNTYkgi2J90VWx1ZcT69hp9CnetbI5zQGuGreo9//1/A1KM
 o9pSxQUr48tO/TQ/hDS//z5o7pegnSpcxrQYdrUVb0GvMj6tvpEehJC2YeDhTglZYO
 xCK32e5uH/Fzg==
Date: Thu, 10 Jul 2025 14:11:26 +0200
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20250710-ehegatte-undicht-6b71310cb1ef@brauner>
References: <20250709181030.236190-1-arnd@kernel.org>
 <20250710-passen-petersilie-32f6f1e9a1fc@brauner>
 <aG92abpCeyML01E1@infradead.org>
 <14865b4a-dfad-4336-9113-b70d65c9ad52@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14865b4a-dfad-4336-9113-b70d65c9ad52@app.fastmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] block: fix FS_IOC_GETLBMD_CAP parsing in
 blkdev_common_ioctl()
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
From: Christian Brauner via ltp <ltp@lists.linux.it>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@kernel.org>,
 Kanchan Joshi <joshi.k@samsung.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Eric Biggers <ebiggers@google.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Anuj Gupta <anuj20.g@samsung.com>, linux-kernel@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 linux-block@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 rbm@suse.com, linux-fsdevel@vger.kernel.org,
 Benjamin Copeland <benjamin.copeland@linaro.org>,
 LTP List <ltp@lists.linux.it>, Alexey Dobriyan <adobriyan@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Christian's version using the copy_struct_{from,to}_user()
> aims to avoid most of the problems. The main downside I see
> here is the extra complexity in the kernel. As far as I can
> tell, this has mainly led to extra kernel bugs but has not
> actually resulted in any structure getting seamlessly
> extended.

We extended ioctls multiple times seemlessly and other than this bug
right here I'm not aware of anything serious. Not liking it is fine of
course but saying "this caused a bug so go away" I won't take all too
seriously, sorry.

I don't want to go down the road of structure revisions for stuff in the
generic layer. Others can do whatever they see fit ofc and userspace can
then have its usualy ifdeffery and structure layout detection party
instead of a clean generic solution. I'd rather clean up the necessary
vetting bits and properly document how this can be done.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
