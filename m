Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9E337948B
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 18:49:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 820223C8C56
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 18:49:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 618083C4F41
 for <ltp@lists.linux.it>; Mon, 10 May 2021 18:49:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 51179200A08
 for <ltp@lists.linux.it>; Mon, 10 May 2021 18:49:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7EA2AAEBD
 for <ltp@lists.linux.it>; Mon, 10 May 2021 16:49:20 +0000 (UTC)
Date: Mon, 10 May 2021 18:49:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YJlkD2QjJfn9b3YG@pevik>
References: <YJOYgZNL7/qp5YCN@yuki> <YJPo4L0QnXHU7xks@pevik>
 <YJVPP64LuDK7O564@pevik> <YJj4wftakLE7PECd@yuki>
 <YJlHfa/E+eNchQQE@pevik> <YJlJ+ZV6zxqPO8Ed@yuki>
 <205dc258-12fa-ba43-8a77-15fe0a08a430@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <205dc258-12fa-ba43-8a77-15fe0a08a430@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 10. 05. 21 16:58, Cyril Hrubis wrote:
> >> I suppose you're going to merge Martin's (rt)netlink patchset [1]
> >> (I'd prefer to get it merged).

> > That one is stalled by my question if we can do more active polling
> > instead of the sleep and unless we get a reply soon it's not going to
> > get in...

> That question only applies to patch 6. You don't need to wait with
> merging patches 1-5. It won't break any tests since the new code will be
> unused anyway.
Yep, I'd vote for merging 1-5.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
