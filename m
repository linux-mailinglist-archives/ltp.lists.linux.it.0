Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF75A36557E
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 11:34:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45EBF3C6CCC
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 11:34:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5C7CE3C6C50
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 11:34:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E1C951000D96
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 11:34:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43AE0ACBF;
 Tue, 20 Apr 2021 09:34:52 +0000 (UTC)
Date: Tue, 20 Apr 2021 11:21:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YH6c/cm9uY0QRrbu@yuki>
References: <20210420084410.16179-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420084410.16179-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
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
Cc: Martin Loviska <mloviska@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  	SAFE_CLOSE(fd);
> +	fd = SAFE_OPEN(TEST_FILENAME, O_RDONLY);
> +	to_check = st.st_size;
> +
> +	psize = sysconf(_SC_PAGESIZE);
> +
> +	tst_res(TINFO, "checking file content");
> +	do {
> +		i = 0;
> +		size = to_check > psize ? psize : to_check;
> +
> +		map = SAFE_MMAP(NULL, size, PROT_READ, MAP_PRIVATE, fd,
> +				st.st_size - to_check);

Huh, why do we loop backward over the file?

Maybe we can just do simple loop here that would be easier to
understand:

	blocks = LTP_ALIGN(st.st_size, page_size) / page_size;

	for (block = 0; block < blocks; block++) {
		map = SAFE_MMAP(NULL, pagesize, PROT_READ, MAP_PRIVATE, fd, block * pagesize);

		to_check = (block+1) * page_size < st.st_size ? page_size : st.st_size % page_size;

		for (i = 0; i < to_check; i++) {
			if (map[i] != get_letter(block * page_size + i))
				fail++;
		}

		SAFE_MUNMAP(map, size);
	}

[Beware I haven't tested the code :-)]

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
