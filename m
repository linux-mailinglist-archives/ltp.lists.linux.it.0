Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7D83668CC
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Apr 2021 12:04:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6ED63C6BFC
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Apr 2021 12:04:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C9FC93C6B69
 for <ltp@lists.linux.it>; Wed, 21 Apr 2021 12:04:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2AF8A1000F66
 for <ltp@lists.linux.it>; Wed, 21 Apr 2021 12:04:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A02BAEE6;
 Wed, 21 Apr 2021 10:04:32 +0000 (UTC)
Date: Wed, 21 Apr 2021 12:04:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YH/4rmSu6Ie04hkI@pevik>
References: <20210420084410.16179-1-pvorel@suse.cz> <YH6c/cm9uY0QRrbu@yuki>
 <YH8H7gnu9FYziyGG@pevik> <YH/y9JMUfbpSX8ev@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YH/y9JMUfbpSX8ev@yuki>
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

Hi Cyril,

> Hi!
> > Yep. In your code you expect that written letter change each time.
> > But original code writes the same letter for whole buffer (using memset()).

> Ah, right, the mapping in the original code maps the remaning size to be
> written to a letter and uses it for whole block.

> I guess that it may be easier to understand if the letter was defined as
> an function of a position in the file like I have expected in my
> snippet. That way we can also produce different patterns without
> changing the test code (and we can later on introduce a library
> functions to fill buffer and check buffer as well, these would generally
> take a pointer to a buffer, size and an offset).
Make sense.

> That would mean that we will have to fill the buffer in a for loop
> instead of memset, but as long as the get_letter() function is inlined
> it should be fast enough.
Right. I guess trying to "align" buffer with alphabet size (e.g. multiple of 26)
to avoid filling the buffer is not worth. Thus I keep buffer size 512 and fill
it each time.

Thanks for your suggestions and time.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
