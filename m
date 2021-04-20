Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AFC365DFD
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 18:57:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 187B53C92A6
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 18:57:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C0FFA3C25D0
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 18:57:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 51C6D1000F3F
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 18:57:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B1B5AF35;
 Tue, 20 Apr 2021 16:57:20 +0000 (UTC)
Date: Tue, 20 Apr 2021 18:57:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YH8H7gnu9FYziyGG@pevik>
References: <20210420084410.16179-1-pvorel@suse.cz>
 <YH6c/cm9uY0QRrbu@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YH6c/cm9uY0QRrbu@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/2] splice02: Generate input in C
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
Cc: Martin Loviska <mloviska@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> >  	SAFE_CLOSE(fd);
> > +	fd = SAFE_OPEN(TEST_FILENAME, O_RDONLY);
> > +	to_check = st.st_size;
> > +
> > +	psize = sysconf(_SC_PAGESIZE);
> > +
> > +	tst_res(TINFO, "checking file content");
> > +	do {
> > +		i = 0;
> > +		size = to_check > psize ? psize : to_check;
> > +
> > +		map = SAFE_MMAP(NULL, size, PROT_READ, MAP_PRIVATE, fd,
> > +				st.st_size - to_check);

> Huh, why do we loop backward over the file?

> Maybe we can just do simple loop here that would be easier to
> understand:

> 	blocks = LTP_ALIGN(st.st_size, page_size) / page_size;

> 	for (block = 0; block < blocks; block++) {
> 		map = SAFE_MMAP(NULL, pagesize, PROT_READ, MAP_PRIVATE, fd, block * pagesize);

> 		to_check = (block+1) * page_size < st.st_size ? page_size : st.st_size % page_size;

> 		for (i = 0; i < to_check; i++) {
> 			if (map[i] != get_letter(block * page_size + i))
> 				fail++;
> 		}

> 		SAFE_MUNMAP(map, size);
> 	}

> [Beware I haven't tested the code :-)]
Yep. In your code you expect that written letter change each time.
But original code writes the same letter for whole buffer (using memset()).

I guess it does not matter whether I keep writing with memset() as is
and adapt the checking code (code you proposed) or if I use your code for
checking and adapt writing code: create buffer 494 (19x 26 letters), memset() it
only once. Or do you have any preference of these?

Also I have to replace 2x return with goto cleanup (to close fd and exit the child).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
